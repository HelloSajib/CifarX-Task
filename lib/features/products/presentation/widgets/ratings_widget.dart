import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/ui_helpers/alignments.dart';
import 'package:cifarx_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int totalReviews;

  const RatingWidget({
    super.key,
    required this.rating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainStart,
      children: [
        Icon(
          Icons.star_rounded,
          size: 20.sp,
          color: AppColors.goldColor,
        ),
        Text(rating.toStringAsFixed(1)),
        gap8,
        Text("($totalReviews)"),
      ],
    );
  }
}
