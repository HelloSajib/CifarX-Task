import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cifarx_task/config/routes/app_routes.dart';
import 'package:cifarx_task/core/theme/app_theme.dart';
import 'package:toastification/toastification.dart';

import 'config/bloc/app_bloc_providers.dart';


class CifarXApp extends StatelessWidget {
  const CifarXApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen util is used for make
    /// Pixel perfect responsive
    /// User Interface according with screen height and width
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: ToastificationWrapper(
        child: MultiBlocProvider(
          providers: AppBlocProviders.providers,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routerConfig: AppRouter.routes,
          ),
        ),
      ),
    );
  }
}


