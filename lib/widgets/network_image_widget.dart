import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    required this.imageUrl,
  });

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: borderRadius ?? radius8,
        child: Image.network(
          imageUrl,
          width: width ?? 100.w,
          height: height ?? 120.w,
          fit: BoxFit.cover,
          gaplessPlayback: true, // Prevent flickering

          // Optimized placeholder
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 200), // very fast fade
                child: child,
              );
            }

            // Static lightweight placeholder
            return Container(
              width: width ?? 100.w,
              height: height ?? 120.w,
              color: AppColors.greyLight,
              alignment: Alignment.center,
              child: const Icon(Icons.image, color: Colors.grey),
            );
          },

          // Error fallback
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              "assets/images/placeholder.png",
              width: width ?? 100.w,
              height: height ?? 120.w,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
