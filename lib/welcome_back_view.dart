import 'package:flutter/material.dart';
import 'package:wirepay/app/app_routes.dart';
import 'package:wirepay/shared/app_colors.dart';
import 'package:wirepay/shared/app_text_style.dart';
import 'package:wirepay/shared/widgets/app_icons.dart';
import 'package:wirepay/shared/widgets/app_images.dart';
import 'package:wirepay/shared/widgets/app_spacing.dart';
import 'package:wirepay/shared/widgets/gradient_scaffold.dart';
import 'package:wirepay/shared/widgets/pay_button.dart';
import 'package:wirepay/shared/widgets/pin_input_field.dart';

class WelcomeBackView extends StatefulWidget {
  const WelcomeBackView({super.key});

  @override
  State<WelcomeBackView> createState() => _WelcomeBackViewState();
}

class _WelcomeBackViewState extends State<WelcomeBackView> {
  final TextEditingController _pinController = TextEditingController();

  void _onKeyPress(String digit) {
    if (_pinController.text.length < 4) {
      _pinController.text += digit;
    }

    if (_pinController.text.length == 4) {
      Navigator.of(context).pushNamed(AppRoutes.homeView);
    }
  }

  void _onDelete() {
    if (_pinController.text.isNotEmpty) {
      _pinController.text =
          _pinController.text.substring(0, _pinController.text.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      backgroundColor: AppColors.primary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            children: [
              const AppSpacing(v: 48),
              Row(
                children: [
                  const AppImages(
                    path: AppImageData.user,
                  ),
                  const AppSpacing(h: 12),
                  Text(
                    'Hi, \$miracle ✨',
                    style: AppTextStyle.bold20.copyWith(
                      fontFamily: AppTextStyle.fontFamilySecondary,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              AppSpacing.v8(),
              Text(
                'Input your 4-digit Pin.',
                style: AppTextStyle.medium16.copyWith(
                  color: Colors.white,
                ),
              ),
              AppSpacing.v24(),
              PinInputField(
                controller: _pinController,
                pinLength: 4,
                onChanged: (pin) {
                  print('Current PIN: $pin');
                },
              ),
              const Spacer(),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 48,
                  crossAxisSpacing: 48,
                  // mainAxisExtent: 52,
                  childAspectRatio: 1.11,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final value = '${index + 1}';
                  return KeypadButton(
                    text: value,
                    onPressed: () => _onKeyPress(value),
                  );
                },
              ),
              const AppSpacing(v: 48),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.11,
                padding: EdgeInsets.zero,
                mainAxisSpacing: 48,
                crossAxisSpacing: 48,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: AppIcons(
                      icon: AppIconData.faceScan,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  KeypadButton(
                    text: '0',
                    onPressed: () => _onKeyPress('0'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppIcons(
                      icon: AppIconData.delete,
                      size: 32,
                      color: Colors.white,
                      onPressed: _onDelete,
                    ),
                  ),
                ],
              ),
              const AppSpacing(v: 48),
              Text(
                'Forgot PIN code?',
                textAlign: TextAlign.center,
                style: AppTextStyle.medium14.copyWith(
                  color: Colors.white,
                ),
              ),
              const AppSpacing(v: 38),
            ],
          ),
        ),
      ),
    );
  }
}

class KeypadButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const KeypadButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PayButton(
      buttonStyle: PayButtonStyle.circular,
      backgroundColor: AppColors.blue500,
      text: text,
      height: 52,
      width: 52,
      onPressed: onPressed,
      style: AppTextStyle.medium20.copyWith(
        fontFamily: AppTextStyle.fontFamilyTertiary,
        color: Colors.white,
        fontSize: 24,
      ),
    );
  }
}
