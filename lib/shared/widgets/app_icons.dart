import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconData {
  static const String _basePath = 'assets/svgs/';
  static const String barcode = '${_basePath}barcode.svg';
  static const String creditCard = '${_basePath}credit_card.svg';
  static const String faceScan = '${_basePath}face_scan.svg';
  static const String gift = '${_basePath}gift.svg';
  static const String home = '${_basePath}home.svg';
  static const String notification = '${_basePath}notification.svg';
  static const String securityUser = '${_basePath}security_user.svg';
  static const String stash = '${_basePath}stash.svg';
  static const String viewOff = '${_basePath}view_off.svg';
  static const String wirepayIcon = '${_basePath}wirepay_icon.svg';
  static const String forwardArrow = '${_basePath}forward_arrow.svg';
  static const String delete = '${_basePath}del.svg';
}

class AppIcons extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final double size;
  final Color? color;
  const AppIcons({
    super.key,
    this.onPressed,
    required this.icon,
    this.size = 35,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SvgPicture.asset(
        icon,
        height: size,
        width: size,
        color: color,
      ),
    );
  }
}
