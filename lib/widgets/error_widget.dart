import 'package:cifarx_task/core/utils/styles/app_text_styles.dart';
import 'package:cifarx_task/core/utils/ui_helpers/alignments.dart';
import 'package:cifarx_task/core/utils/ui_helpers/paddings.dart';
import 'package:cifarx_task/core/utils/ui_helpers/spacing.dart';
import 'package:cifarx_task/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApiErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const ApiErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding16,
        child: Column(
          mainAxisAlignment: mainCenter,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: Colors.red,
            ),

            gap16,

            Text(
              'Oops! Something went wrong.',
              style: AppTextStyles.titleMedium,
            ),
            gap8,

            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.caption,
            ),

            gap24,

            SizedBox(
              width: 100.w,
              height: 40.h,
              child: PrimaryButton(
                onPressed: onRetry,
                icon: Icons.refresh,
                text: "Retry",
              ),
            )
          ],
        ),
      ),
    );
  }
}