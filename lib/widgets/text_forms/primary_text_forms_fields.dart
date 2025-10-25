import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/styles/app_text_styles.dart';
import 'package:cifarx_task/core/utils/ui_helpers/alignments.dart';
import 'package:cifarx_task/core/utils/ui_helpers/decoration.dart';
import 'package:cifarx_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class PrimaryTextFormsFields extends HookWidget {
  final bool? isRequired;
  final bool? showObscureButton;
  final int? minLine;
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final VoidCallback? onTap;

  const PrimaryTextFormsFields({
    super.key,
    this.isRequired,
    this.title,
    this.showObscureButton,
    this.controller,
    this.hintText,
    this.minLine,
    this.validator,
    this.onTap,
    this.textInputType,
  });


  @override
  Widget build(BuildContext context) {


    final obscureText = useState<bool>(true);


    return Column(
      crossAxisAlignment: crossStart,
      children: [

        if(title != null)
          Row(
            mainAxisAlignment: mainStart,
            children: [
              Text(
                title!,
                style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary
                ),
              ),

              if(isRequired == true)
                Text(
                  "*",
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.red
                  ),
                ),
            ],
          ),

        gap4,

        InkWell(
          onTap: onTap,
          child: TextFormField(
            controller: controller,
            minLines: minLine ?? 1,
            maxLines: minLine ?? 1,
            //enabled: onTap == null,
            style: AppTextStyles.bodyLarge,
            readOnly: onTap != null,
            obscureText: showObscureButton == true ? obscureText.value : false,
            keyboardType: textInputType,
            decoration: InputDecoration(
              suffixIcon: showObscureButton == true ? IconButton(
                  onPressed: ()=> obscureText.value = !obscureText.value,
                  icon: Icon(
                      obscureText.value == true ?
                      Icons.visibility_off : Icons.visibility
                  )
              ): null,
              hintText: hintText,
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.grey
              ),
              border: primaryInputBorder,
              disabledBorder: primaryInputBorder,
              enabledBorder: primaryInputBorder,
              //focusedBorder: primaryInputBorder,
              errorBorder: primaryInputBorder,

            ),
            validator: validator,
          ),
        )

      ],
    );
  }
}
