import 'package:arafah/core/utils/styles/app_text_styles.dart';
import 'package:arafah/core/utils/ui_helpers/radius.dart';
import 'package:arafah/core/utils/ui_helpers/spacing.dart';
import 'package:arafah/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({
    super.key,
    required this.name,
    required this.image
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: radius8, // keeps your original radius
          child: NetworkImageWidget(
            imageUrl: image,
            width: 60.w,          // preserves original width
            height: 60.w,         // preserves original height
            //fit: BoxFit.fill,
          ),
        ),

        gap6, // preserves your original vertical gap

        Text(
          name,
          style: AppTextStyles.categoryTitle, // keeps original text style
        ),
      ],
    );
  }
}
