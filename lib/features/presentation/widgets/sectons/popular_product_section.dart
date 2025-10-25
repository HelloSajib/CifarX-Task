import 'package:arafah/core/constants/api_urls.dart';
import 'package:arafah/core/utils/extensions/null_empty_extension.dart';
import 'package:arafah/core/utils/extensions/status_extension.dart';
import 'package:arafah/features/product_details/presentation/pages/product_details_page.dart';
import 'package:arafah/features/shop/data/models/produts_model.dart';
import 'package:arafah/features/shop/presentation/bloc/shop_bloc.dart';
import 'package:arafah/features/shop/presentation/pages/popular_products_page.dart';
import 'package:arafah/features/shop/presentation/pages/shop_page.dart';
import 'package:arafah/features/shop/presentation/widgets/section_header.dart';
import 'package:arafah/widgets/item_view/product_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class PopularProductSection extends HookWidget {

  const PopularProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {

        if(state.popularProductsStatus.isSuccess && state.popularProducts.isNotNullAndNotEmpty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Section header
              SectionHeader(
                title: "Popular Products",
                actionText: "See All",
                onActionTap: () {
                  context.go(ShopPage.path + PopularProductsPage.path);
                },
              ),

              // Horizontal List of products
              SizedBox(
                width: 1.sw,
                height: 260.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.popularProducts?.length,
                  itemBuilder: (context, index) {

                    Product product = state.popularProducts![index];

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
                        imageUrl: ApiUrls.imageBaseURL + product.images!.first,
                        stock: product.totalStock ?? 0,
                        price: product.minPrice ?? 0,
                        regularPrice: product.baseMinPrice ?? 0,
                        discount: product.discount ?? 0,
                        productTitle: product.name ?? "N/A",
                        productRating: product.averageRating,
                        totalReview: product.numReviews,
                        freeDelivery: product.isFreeDelivery,
                        productId: product.id.toString(),
                      ),
                    ); // can have flexible height
                  },
                ),
              ),
            ],
          );
        }else{
          return SizedBox.shrink();
        }

      },
    );
  }
}
