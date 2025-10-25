
import 'dart:math';

import 'package:cifarx_task/core/helpers/helpers.dart';
import 'package:cifarx_task/core/utils/extensions/null_empty_extension.dart';
import 'package:cifarx_task/core/utils/extensions/status_extension.dart';
import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/ui_helpers/alignments.dart';
import 'package:cifarx_task/core/utils/ui_helpers/margins.dart';
import 'package:cifarx_task/core/utils/ui_helpers/paddings.dart';
import 'package:cifarx_task/core/utils/ui_helpers/spacing.dart';
import 'package:cifarx_task/features/products/data/models/produts_model.dart';
import 'package:cifarx_task/features/products/presentation/bloc/products_bloc.dart';
import 'package:cifarx_task/features/products/presentation/bloc/products_event.dart';
import 'package:cifarx_task/features/products/presentation/widgets/item_view/product_item_view.dart';
import 'package:cifarx_task/widgets/app_bars/primary_app_bar.dart';
import 'package:cifarx_task/widgets/circle_loading.dart';
import 'package:cifarx_task/widgets/empty_widget.dart';
import 'package:cifarx_task/widgets/text_forms/search_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsPage extends HookWidget {

  static String get path => "/products";
  static String get name => "products";

  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scrollController = useScrollController();
    final searchController = useTextEditingController();

    final productsBloc = context.read<ProductsBloc>();


    void searchProducts(){
      if(searchController.text.isNotEmpty){
        Map<String, dynamic> queryParams = {"q": searchController.text};
        productsBloc.add(SearchProducts(queryParams: queryParams));
      }
    }


    void paginationHandler(){
      scrollController.addListener(() {
        final currentState = context.read<ProductsBloc>().state;
        int skippedTotal = currentState.productsEntity?.skip ?? 1;
        int totalProducts = currentState.productsEntity?.total ?? 1;
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent
            && !currentState.paginationStatus.isLoading && skippedTotal < totalProducts
        ) {
          productsBloc.add(GetMoreProducts());
        }
      });
    }


    useEffect(() {
      Future.microtask((){
        productsBloc.add(GetProducts());
        paginationHandler();
      });
      return null;
    },[]);

    return Scaffold(
      appBar: PrimaryAppBar(title: "Products List"),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: padding12,
        child: Column(
          crossAxisAlignment: crossCenter,
          children: [

            SearchTextForm(
                controller: searchController,
                onSearch: ()=> searchProducts()
            ),

            gap12,

            Expanded(
              child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {

                  if(state.status.isLoading){
                    return CircleLoadingWidget();
                  }else if(state.status.isSuccess){
                    if(state.products.isNotNullAndNotEmpty){
                      return Column(
                        crossAxisAlignment: crossCenter,
                        children: [
                          Expanded(
                            child: RefreshIndicator(
                              color: AppColors.primaryColor,
                              onRefresh: () async => productsBloc.add(GetProducts()),
                              child: MasonryGridView.count(
                                controller: scrollController,
                                physics: const AlwaysScrollableScrollPhysics(), // ✅ Important
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.w,
                                mainAxisSpacing: 12.w,
                                itemCount: state.products?.length,
                                itemBuilder: (context, index) {

                                  Product product = state.products![index];

                                  return ProductItemView(
                                    margin: margin0,
                                    height: 260.h,
                                    imageUrl: product.images!.first,
                                    stock: product.stock ?? 0,
                                    price: Helpers.calculateDiscountedPrice(product.price ?? 0, product.discountPercentage ?? 0),
                                    regularPrice: product.price ?? 0,
                                    discount: product.discountPercentage ?? 0,
                                    productTitle: product.title ?? "N/A",
                                    productRating: product.rating,
                                    totalReview: product.reviews?.length,
                                    freeDelivery: Random().nextBool(),
                                  );

                                },
                              ),
                            ),
                          ),

                          if(state.paginationStatus.isLoading)
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
