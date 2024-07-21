import 'package:flutter/material.dart';
import 'package:wirepay/shared/widgets/app_icons.dart';
import 'package:wirepay/shared/widgets/app_images.dart';
import 'package:wirepay/shared/widgets/app_spacing.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppImages(
                    path: AppImageData.user,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppIcons(
                        icon: AppIconData.gift,
                        size: 24,
                      ),
                      AppSpacing.h8(),
                      const Text(
                        'Earn \$1',
                      ),
                    ],
                  )
                ],
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
