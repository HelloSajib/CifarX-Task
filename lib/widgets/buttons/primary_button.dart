import 'package:cifarx_task/core/utils/ui_helpers/alignments.dart';
import 'package:cifarx_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/styles/app_text_styles.dart';
import 'package:cifarx_task/core/utils/ui_helpers/paddings.dart';
import 'package:cifarx_task/core/utils/ui_helpers/radius.dart';


class PrimaryButton extends StatelessWidget {
  final bool? isLoading;
  final bool? gradientColor;
  final String? text;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final EdgeInsets? padding;
  final BorderRadius? radius;
  final Color? textColor;
  final Color? background;
  final Color? strokeColor;
  final IconData? icon;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    this.isLoading,
    this.gradientColor,
    this.text,
    this.width,
    this.height,
    this.alignment,
    this.padding,
    this.radius,
    this.textColor,
    this.background,
    this.icon,
    this.onPressed,
    this.strokeColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 1.sw,
        height: height ?? 50.h,
        alignment: alignment ?? Alignment.center,
        padding: padding ?? paddingH16,
        decoration: ShapeDecoration(
          gradient: gradientColor ?? true ? LinearGradient(
            colors:  [
              background ?? AppColors.primaryColor,   // first color
              Colors.pink, // second color (fallback)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ): null,
          color: gradientColor == false ? background ?? AppColors.primaryColor : null,
          shape: RoundedRectangleBorder(
              borderRadius: radius ?? radius8,
            side: strokeColor != null ? BorderSide(
              width: 1.w,
              color: strokeColor!
            ):BorderSide.none
          ),
        ),
        child: isLoading == true ?
        Center(
            child: SizedBox(
                child: CircularProgressIndicator(
                    color: Colors.white
                )
            )
        ) : Row(
          mainAxisAlignment: mainCenter,
          crossAxisAlignment: crossCenter,
          children: [

            if(icon != null)
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),

                gap6,
              ],
            ),

            Text(
              text ?? "Continue",
              style: AppTextStyles.bodyMedium.copyWith(color: textColor ?? Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
