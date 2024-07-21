import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirepay/shared/app_colors.dart';
import 'package:wirepay/shared/app_text_style.dart';

import 'sign_in_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          home: const SignUpView(),
          debugShowCheckedModeBanner: false,
          title: 'Wirepay',
          theme: ThemeData(
            primaryColor: AppColors.primary,
            fontFamily: AppTextStyle.fontFamily,
          ),
        );
      },
    );
  }
}
