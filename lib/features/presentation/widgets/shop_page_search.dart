import 'package:arafah/core/utils/styles/app_colors.dart';
import 'package:arafah/core/utils/ui_helpers/radius.dart';
import 'package:arafah/core/utils/ui_helpers/spacing.dart';
import 'package:arafah/features/shop/presentation/pages/products_page.dart';
import 'package:arafah/features/shop/presentation/pages/shop_page.dart';
import 'package:arafah/widgets/text_forms/search_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ShopPageSearch extends StatelessWidget {
  const ShopPageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Map<String,String> query = {"productType" : "Search Products"};
        context.go(Uri(path: ShopPage.path + ProductsPage.path,queryParameters: query).toString());
      },
      child: IgnorePointer(
        child: Row(
          children: [
            Expanded(
              child: SearchTextForm(
                controller: TextEditingController(),
                onSearch: () {  },
              ),
            ),

            gap12,

            Container(
              width: 55.w,
              height: 55.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: radius8,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/filter_icon.svg",
                  width: 40.w,
                  height: 40.w,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
