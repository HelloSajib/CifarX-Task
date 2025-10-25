import 'package:arafah/core/utils/styles/app_colors.dart';
import 'package:arafah/core/utils/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.subtitle, // your custom style
        ),
        if (onActionTap != null)
          TextButton(
            onPressed: onActionTap,
            child: Text(
              actionText ?? "See All",
              style: AppTextStyles.secondaryButtonStyle.copyWith(
                color: AppColors.greenColor,
              ),
            ),
          ),
      ],
    );
  }
}
