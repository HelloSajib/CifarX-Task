
import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final OutlineInputBorder primaryInputBorder = OutlineInputBorder(
  borderRadius: radius8,
  borderSide: BorderSide(
      width: 1.2.w,
      color: AppColors.grey
  ),
);


final Decoration primaryDecoration = ShapeDecoration(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    side: BorderSide(
      width: 1,
      color: const Color(0xFFE2E2E2),
    ),
    borderRadius: BorderRadius.circular(18),
  ),
  shadows: [
    BoxShadow(
      color: Color(0x00000000),
      blurRadius: 12,
      offset: Offset(0, 6),
      spreadRadius: 0,
    )
  ],
);


final Decoration secondaryDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: Colors.grey.withValues(alpha: 0.15),
    width: 1,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 10,
      spreadRadius: 2,
      offset: const Offset(0, 4),
    ),
  ],
);
