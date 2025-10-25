import 'package:arafah/core/constants/api_urls.dart';
import 'package:arafah/core/utils/extensions/null_empty_extension.dart';
import 'package:arafah/core/utils/extensions/status_extension.dart';
import 'package:arafah/core/utils/styles/app_colors.dart';
import 'package:arafah/core/utils/ui_helpers/margins.dart';
import 'package:arafah/core/utils/ui_helpers/paddings.dart';
import 'package:arafah/core/utils/ui_helpers/spacing.dart';
import 'package:arafah/features/product_details/presentation/pages/product_details_page.dart';
import 'package:arafah/features/shop/data/models/produts_model.dart';
import 'package:arafah/features/shop/presentation/bloc/shop_bloc.dart';
import 'package:arafah/features/shop/presentation/bloc/shop_event.dart';
import 'package:arafah/widgets/app_bars/secondary_app_bar.dart';
import 'package:arafah/widgets/circle_loading.dart';
import 'package:arafah/widgets/empty_widget.dart';
import 'package:arafah/widgets/filter_widget.dart';
import 'package:arafah/widgets/item_view/product_item_view.dart';
import 'package:arafah/widgets/search_with_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends HookWidget {
  static String get path => "/products";

  static String get name => "products";

  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scrollController = useScrollController();
    final filters = useState<Map<String, dynamic>>({});
    final searchController = useTextEditingController();

    final shopBloc = context.read<ShopBloc>();

    void getProducts() {
        if(searchController.text.isNotEmpty){
          filters.value.addEntries({"search": searchController.text}.entries);
        }
        shopBloc.add(GetProducts(queryParams: filters.value));
    }


    void getMoreProducts() {
      if(searchController.text.isNotEmpty){
        filters.value.addEntries({"search": searchController.text}.entries);
      }
      shopBloc.add(GetMoreProducts(queryParams: filters.value));
    }


    void paginationHandler(){
      scrollController.addListener(() {
        final currentState = context.read<ShopBloc>().state;
        int currentPage = currentState.productsEntity?.productsData?.meta?.page ?? 1;
        int totalPage = currentState.productsEntity?.productsData?.meta?.totalPages ?? 1;
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent
            && !currentState.productsPaginationStatus.isLoading && currentPage < totalPage
        ) {
          getMoreProducts();
        }
      });
    }

    useEffect(() {
      Future.microtask((){
        getProducts();
        paginationHandler();
      });
      return null;
    },[]);

    return Scaffold(
      appBar: SecondaryAppBar(title: "Products"),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: padding12,
        child: Column(
          children: [

            SearchWithFilterBar(
              searchController: searchController,
              onSearch: () => getProducts(),
              filterWidget: FilterWidget(
                initialFilter: filters.value,
                onApply: (value) {
                  filters.value.clear();
                  filters.value.addEntries(value.toJson().entries);
                  getProducts();
                },
                onReset: () {
                  filters.value.clear();
                  getProducts();
                  Navigator.pop(context);
                },
              ),
            ),

            gap12,

            Expanded(
              child: BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {

                  if(state.status.isLoading){
                    return CircleLoadingWidget();
                  }else if(state.status.isSuccess){
                    if(state.products.isNotNullAndNotEmpty){
                      return Column(
                        children: [
                          Expanded(
                            child: RefreshIndicator(
                              color: AppColors.primaryColor,
                              onRefresh: () async => getProducts(),
                              child: MasonryGridView.count(
                                controller: scrollController,
                                physics: const AlwaysScrollableScrollPhysics(), // ✅ Important
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.w,
                                mainAxisSpacing: 12.w,
                                itemCount: state.products?.length,
                                itemBuilder: (context, index) {

                                  Product product = state.products![index];

                                  return InkWell(
                                    onTap: () {
                                      Map<String, dynamic> queryParams = {
                                        "productId" : product.id,
                                        "categoryId" : product.category,
                                        "subCategoryId": product.subCategory
                                      };
                                      context.pushNamed(ProductDetailsPage.name, queryParameters: queryParams);
                                    },
                                    child: ProductItemView(
                                      margin: margin0,
                                      height: 260.h,
                                      imageUrl: ApiUrls.imageBaseURL + product.images!.first,
                                      stock: product.totalStock ?? 0,
                                      price: product.minPrice ?? 0,
                                      regularPrice: product.baseMinPrice ?? 0,
                                      discount: product.discount ?? 0,
                                      productTitle: product.name ?? "N/A",
                                      productRating: product.averageRating,
                                      totalReview: product.numReviews,
                                      freeDelivery: product.isFreeDelivery,
                                      productId: product.id ?? "",
                                    ),
                                  ); // can have flexible height
                                },
                              ),
                            ),
                          ),

                          if(state.productsPaginationStatus.isLoading)
                            Padding(
                              padding: padding20,
                              child: CircleLoadingWidget(),
                            )

                        ],
                      );
                    }else{
                      return EmptyWidget(
                          title: "No Products Found",
                          description: "Looks like there are no products available right now. Please try again later!"
                      );
                    }
                  }else{
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
