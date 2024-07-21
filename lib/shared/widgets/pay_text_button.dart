import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirepay/shared/app_colors.dart';
import 'package:wirepay/shared/app_text_style.dart';
import 'package:wirepay/shared/widgets/app_icons.dart';
import 'package:wirepay/shared/widgets/app_spacing.dart';

enum PayButtonStyle {
  normal,
  underlined,
}

class PayTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double height;
  final double? width;
  final Color? textColor;
  final TextStyle? style;
  final TextAlign? textAlign;
  final PayButtonStyle buttonStyle;
  final EdgeInsets? padding;
  final String? suffixIcon;
  const PayTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.height = 50,
    this.width = 50,
    this.textColor,
    this.style,
    this.textAlign,
    this.buttonStyle = PayButtonStyle.normal,
    this.padding,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width?.w,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: style ??
                  AppTextStyle.medium14.merge(
                    TextStyle(
                      fontFamily: AppTextStyle.fontFamilyTertiary,
                      decorationThickness: 2,
                      decorationColor: textColor ?? AppColors.primary,
                      color: buttonStyle == PayButtonStyle.underlined
                          ? Colors.transparent
                          : textColor ?? AppColors.primary,
                      decoration: buttonStyle == PayButtonStyle.underlined
                          ? TextDecoration.underline
                          : null,
                      shadows: buttonStyle == PayButtonStyle.underlined
                          ? [
                              Shadow(
                                color: textColor ?? AppColors.primary,
                                offset: const Offset(0, -1.8),
                              )
                            ]
                          : null,
                    ),
                  ),
            ),
            if (suffixIcon != null) ...[
              AppSpacing.h4(),
              AppIcons(
                icon: suffixIcon!,
                size: 16,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
