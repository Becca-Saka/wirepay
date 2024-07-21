import 'package:flutter/material.dart';
import 'package:wirepay/shared/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  const GradientScaffold({
    super.key,
    this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.lightGrey,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/logo_mask.png',
          ),
        )),
        child: child,
      ),
    );
  }
}
