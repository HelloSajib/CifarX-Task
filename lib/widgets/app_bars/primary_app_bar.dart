import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    required this.title
  });

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      leading: IconButton(
          onPressed: (){},
          icon: Icon(
              Icons.menu,
              color: Colors.white
          )
      ),
      title: Text(
        title,
        style: AppTextStyles.appBarTextStyles,
      ),
      actions: [
        IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.more_vert,
                color: Colors.white

            )
        )
      ],
    );
  }
}
