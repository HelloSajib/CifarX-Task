import 'dart:math';

import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/styles/app_text_styles.dart';
import 'package:cifarx_task/core/utils/ui_helpers/alignments.dart';
import 'package:cifarx_task/core/utils/ui_helpers/decoration.dart';
import 'package:cifarx_task/core/utils/ui_helpers/margins.dart';
import 'package:cifarx_task/core/utils/ui_helpers/paddings.dart';
import 'package:cifarx_task/core/utils/ui_helpers/radius.dart';
import 'package:cifarx_task/core/utils/ui_helpers/spacing.dart';
import 'package:cifarx_task/features/presentation/widgets/ratings_widget.dart';
import 'package:cifarx_task/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductItemView extends HookWidget {
  final double? width;
  final double? height;
  final double price;
  final double? regularPrice;
  final double? discount;
  final bool? freeDelivery;
  final String imageUrl;
  final int stock;
  final String productTitle;
  final double? productRating;
  final int? totalReview;
  final EdgeInsetsGeometry? margin;

  const ProductItemView({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.freeDelivery,
    this.productRating,
    this.totalReview,
    this.regularPrice,
    this.discount,
    required this.stock,
    required this.price,
    required this.imageUrl,
    required this.productTitle,
  });


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          width: width ?? 160.w,
          height: height,
          decoration: primaryDecoration,
          margin: margin ?? marginRight12,
          padding: padding12,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [

              Container(
                width: 1.sw,
                height: 110.h,
                decoration: BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: radius8
                ),
                child: Stack(
                  children: [
                    NetworkImageWidget(
                        width: 1.sw,
                        borderRadius: radius8,
                        imageUrl: imageUrl
                    ),


                    if(freeDelivery == true)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: paddingH4,
                          decoration: BoxDecoration(
                              borderRadius: radius4,
                              color: AppColors.greenColor
                          ),
                          child: Text(
                            "Free Delivery",
                            style: AppTextStyles.labelSmall.copyWith(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),

                  ],
                ),
              ),

              gap6,


              Row(
                mainAxisAlignment: mainSpaceBetween,
                children: [
                  Text(
                      "Stock: $stock"
                  ),


                  if(discount != null && discount! > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: radius6,
                      ),
                      child: Text(
                        "-$discount%",
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),


                ],
              ),

              Text(
                productTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.primary,
              ),

              RatingWidget(
                  rating: productRating ?? 0.0,
                  totalReviews: totalReview ?? 0
              ),


              Row(
                mainAxisAlignment: mainSpaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        "৳ ${price.toStringAsFixed(2)}",
                        style: AppTextStyles.primary,
                      ),
                      Text(
                        "৳ ${regularPrice!.toStringAsFixed(2)}",
                        style: AppTextStyles.labelSmall.copyWith(
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                    ],
                  ),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )

                ],
              ),


            ],
          ),
        ),

        Positioned(
          top: 15,
          left: 15,
          child: Container(
            width: 35.w,
            height: 35.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Visibility(
              visible: Random().nextBool(),
              replacement: Icon(
                Icons.favorite_border,
                size: 20.sp,
              ),
              child: Icon(
                Icons.favorite,
                color: Color(0xFFFF0000).withValues(alpha: 0.6),
                size: 20.sp,
              ),
            ),
          ),
        )
      ],
    );
  }
}
