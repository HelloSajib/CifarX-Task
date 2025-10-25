
import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/styles/app_text_styles.dart';
import 'package:cifarx_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter/material.dart';

class SearchTextForm extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchTextForm({
    super.key,
    required this.controller,
    required this.onSearch
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (_)=> onSearch(),
      decoration: InputDecoration(
        hintText: "Search product",
        hintStyle: AppTextStyles.primary.copyWith(color: AppColors.grey),
        filled: true,
        fillColor: AppColors.greyLight,
        suffixIcon: IconButton(
            onPressed: onSearch,
            icon: Icon(Icons.search)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius8,
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius8,
          borderSide: BorderSide(style: BorderStyle.none),
        ),
        border: OutlineInputBorder(
          borderRadius: radius8,
          borderSide: BorderSide(style: BorderStyle.none),
        ),
      ),
    );
  }
}
