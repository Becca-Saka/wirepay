import 'package:flutter/material.dart';

class PayBorder extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? padding;
  final Widget child;
  const PayBorder({
    super.key,
    this.width,
    this.height,
    this.color,
    this.radius,
    this.padding,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
        color: color ?? Colors.white,
      ),
      child: child,
    );
  }
}
