import 'package:cifarx_task/core/helpers/validation/form_validations.dart';
import 'package:cifarx_task/core/utils/styles/app_colors.dart';
import 'package:cifarx_task/core/utils/styles/app_text_styles.dart';
import 'package:cifarx_task/core/utils/ui_helpers/paddings.dart';
import 'package:cifarx_task/core/utils/ui_helpers/spacing.dart';
import 'package:cifarx_task/features/products/presentation/pages/products_page.dart';
import 'package:cifarx_task/widgets/buttons/primary_button.dart';
import 'package:cifarx_task/widgets/text_forms/primary_text_forms_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends HookWidget {
  static String get path => "/sign-in";
  static String get name => "sign-in";

  const SignInPage({super.key});


  @override
  Widget build(BuildContext context) {

    final formKey = useMemoized(()=> GlobalKey<FormState>());
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();


    final rememberStudent = useState<bool>(false);
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding24,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                gap48,

                Text(
                  "Hi, Welcome Back! 👋",
                  style: AppTextStyles.titleLarge.copyWith(
                      fontWeight: FontWeight.bold
                  ),
                ),

                gap24,

                Form(
                  key: formKey,
                  child: Column(
                    spacing: 12.w,
                    children: [

                      PrimaryTextFormsFields(
                        isRequired: true,
                        controller: phoneController,
                        title: "Phone Number",
                        hintText: "Enter your phone number",
                        textInputType: TextInputType.phone,
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.phone,
                            formValue: value
                        ).validate(),
                      ),


                      PrimaryTextFormsFields(
                        isRequired: true,
                        controller: passwordController,
                        title: "Password",
                        hintText: "Enter your password",
                        showObscureButton: true,
                        textInputType: TextInputType.visiblePassword,
                        validator: (value)=> FormValidation(
                            validationType: ValidationType.password,
                            formValue: value
                        ).validate(),
                      ),

                    ],
                  ),
                ),

                Row(
                  children: [
                    Checkbox(
                        value: rememberStudent.value,
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(6), // Rounded corners
                        ),
                        activeColor: AppColors.blueLight,
                        onChanged: (value)=> rememberStudent.value = value ?? false
                    ),

                    Text(
                      "Remember Me",
                      style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textPrimary
                      ),
                    ),

                    const Spacer(),

                    TextButton(
                        onPressed: (){},
                        child: Text(
                            "Forgot Password?",
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.errorRed.withValues(alpha: 0.7)
                            )
                        )
                    )
                  ],
                ),

                gap24,


                PrimaryButton(
                  onPressed: ()=> context.go(ProductsPage.path),
                  text: "Login",
                  textColor: Colors.white,
                ),


                gap6,


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "Don’t have an account ?",
                      style: AppTextStyles.titleSmall,
                    ),

                    TextButton(
                      onPressed: (){},
                      child: Text(
                          "Sign Up",
                          style: AppTextStyles.titleSmall.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.deepPurpleAccent
                          )
                      ),
                    )

                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
