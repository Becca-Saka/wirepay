import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirepay/shared/app_colors.dart';
import 'package:wirepay/shared/app_text_style.dart';

enum PayButtonStyle {
  normal,
  circular,
}

class PayButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double radius;
  final double height;
  final double? width;
  final double? elevation;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool expanded;
  final PayButtonStyle buttonStyle;
  const PayButton({
    super.key,
    required this.text,
    this.onPressed,
    this.radius = 200,
    this.height = 50,
    this.elevation = 0,
    this.borderColor,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.style,
    this.textAlign,
    this.expanded = true,
    this.buttonStyle = PayButtonStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? width ?? double.infinity : null,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: buttonStyle == PayButtonStyle.circular
              ? CircleBorder(
                  side: borderColor == null
                      ? BorderSide.none
                      : BorderSide(
                          color: borderColor!,
                        ),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: borderColor == null
                      ? BorderSide.none
                      : BorderSide(
                          color: borderColor!,
                        ),
                ),
        ),
        child: Text(
          text,
          textAlign: textAlign,
          style: style ??
              AppTextStyle.extraBold20.copyWith(
                fontFamily: AppTextStyle.fontFamilyTertiary,
                color: textColor ?? Colors.white,
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
