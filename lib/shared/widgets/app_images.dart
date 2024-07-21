import 'package:flutter/material.dart';

class AppImageData {
  static const String _basePath = 'assets/images/';
  static const String gh = '${_basePath}gh.png';
  static const String ng = '${_basePath}ng.png';
  static const String us = '${_basePath}us.png';
  static const String user = '${_basePath}user.png';
}

class AppImages extends StatefulWidget {
  final String? path;

  final double? height;
  final double? width;
  final BoxFit? fit;
  const AppImages({this.path, this.height, this.width, this.fit, super.key})
      : assert(path != null);

  @override
  State<AppImages> createState() => _AppImagesState();
}

class _AppImagesState extends State<AppImages> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.path!,
      height: widget.height,
      width: widget.width,
      fit: widget.fit,
      errorBuilder: (context, error, stackTrace) {
        return _errorWidget();
      },
    );
  }

  Widget _errorWidget() {
    return Container(
      height: widget.height,
      width: widget.width,
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
