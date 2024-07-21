import 'package:flutter/material.dart';
import 'package:wirepay/shared/app_colors.dart';
import 'package:wirepay/shared/app_text_style.dart';
import 'package:wirepay/shared/widgets/app_spacing.dart';

class PaySection extends StatelessWidget {
  final Widget child;
  final Widget? suffix;
  final String header;
  const PaySection({
    super.key,
    required this.child,
    required this.header,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              header,
              style: AppTextStyle.bold18.copyWith(
                color: AppColors.grey09,
                fontFamily: AppTextStyle.fontBrico,
              ),
            ),
            if (suffix != null) suffix!,
          ],
        ),
        AppSpacing.v16(),
        child,
        AppSpacing.v16(),
      ],
    );
  }
}
