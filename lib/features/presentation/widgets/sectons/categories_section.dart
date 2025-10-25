import 'package:arafah/core/constants/api_urls.dart';
import 'package:arafah/core/utils/extensions/null_empty_extension.dart';
import 'package:arafah/core/utils/extensions/status_extension.dart';
import 'package:arafah/features/shop/data/models/categories_model.dart';
import 'package:arafah/features/shop/presentation/bloc/shop_bloc.dart';
import 'package:arafah/features/shop/presentation/pages/categories_page.dart';
import 'package:arafah/features/shop/presentation/pages/category_products_page.dart';
import 'package:arafah/features/shop/presentation/pages/shop_page.dart';
import 'package:arafah/features/shop/presentation/widgets/item_view/category_item_view.dart';
import 'package:arafah/features/shop/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class CategoriesSection extends HookWidget {

  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {

        if(state.categoryStatus.isSuccess && (state.categoriesEntity?.categories).isNotNullAndNotEmpty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Section header
              SectionHeader(
                title: "Categories",
                actionText: "See All",
                onActionTap: () =>
                    context.go(ShopPage.path + CategoriesPage.path),
              ),

              // Category grid
              MasonryGridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 12.w,
                // keeps your spacing
                mainAxisSpacing: 15.h,
                // keeps your spacing
                itemCount: (state.categoriesEntity?.categories?.length ?? 0) > 8
                    ? 8 : state.categoriesEntity?.categories?.length,
                itemBuilder: (context, index) {

                  Category category = state.categoriesEntity!.categories![index];

                  return InkWell(
                    onTap: () {
                      Map<String, String> query = {
                        "categoryId": category.id ?? "",
                        "category": category.name ?? "",
                      };
                      context.push(Uri(
                          path: ShopPage.path + CategoryProductsPage
                              .path, queryParameters: query).toString());
                    },
                    child: CategoryItemView(
                        name: category.name ?? "",
                        image: ApiUrls.imageBaseURL + (category.icon ?? "")
                    ),
                  );

                },
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
