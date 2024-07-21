import 'package:flutter/material.dart';
import 'package:wirepay/home_view.dart';
import 'package:wirepay/shared/app_text_style.dart';
import 'package:wirepay/shared/widgets/app_icons.dart';
import 'package:wirepay/shared/widgets/gradient_scaffold.dart';
import 'package:wirepay/shared/widgets/pay_button.dart';
import 'package:wirepay/shared/widgets/pay_text_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Column(
        children: [
          const Expanded(
            child: Center(
                child: AppIcons(
              icon: AppIconData.faceScan,
              size: 120,
            )),
          ),
          // const SafeArea(
          //   child: Center(
          //     child: Text(
          //       'Sign Up',
          //     ),
          //   ),
          // ),
          // const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: PayBorder(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 32,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Welcome back, Miracle',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bold20.copyWith(
                        fontFamily: AppTextStyle.fontFamilySecondary,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Text(
                    'Use Face ID to sign into Wirepay',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular14,
                  ),
                  const Spacer(),
                  PayButton(
                    text: 'Sign in with Face ID',
                    onPressed: () {},
                  ),
                  PayTextButton(
                    width: double.infinity,
                    text: 'Sign in with PIN code',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
