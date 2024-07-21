import 'package:flutter/material.dart';

class AppImageData {
  static const String _basePath = 'assets/images/';
  static const String gh = '${_basePath}gh.png';
  static const String ng = '${_basePath}ng.png';
  static const String us = '${_basePath}us.png';
  static const String user = '${_basePath}user.png';
}

class AppImages extends StatelessWidget {
  final String? path;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const AppImages({
    super.key,
    this.path,
    this.height,
    this.width,
    this.fit,
    this.onPressed,
  }) : assert(path != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(
        path!,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _errorWidget();
        },
      ),
    );
  }

  Widget _errorWidget() {
    return Container(
      height: height,
      width: width,
      color: Colors.grey.withOpacity(0.4),
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.red,
        ),
      ),
    );
  }
}
