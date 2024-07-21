import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTextStyle {
  static const String fontNunito = 'NunitoSans';
  static const String fontBrico = 'BricolageGrotesque';
  static const String fontAvenir = 'AvenirLTStd';

  /// Base text style
  static const TextStyle _baseTextStyle = TextStyle(
    fontFamily: AppTextStyle.fontNunito,
    fontWeight: AppFontWeight.regular,
    color: AppColors.darkText,
    letterSpacing: -0.2,
  );

  ///NunitoSans 10
  static TextStyle get regular10 => _baseTextStyle.copyWith(fontSize: 10);

  ///NunitoSans medium 10
  static TextStyle get medium10 =>
      regular10.copyWith(fontWeight: AppFontWeight.medium);

  ///NunitoSans 12
  static TextStyle get regular12 => _baseTextStyle.copyWith(fontSize: 12);

  ///NunitoSans medium 12
  static TextStyle get medium12 =>
      regular12.copyWith(fontWeight: AppFontWeight.medium);

  ///NunitoSans semibold 12
  static TextStyle get semibold12 =>
      regular12.copyWith(fontWeight: AppFontWeight.semiBold);

  ///NunitoSans medium 14
  static TextStyle get medium14 => regular10.copyWith(
        fontWeight: AppFontWeight.medium,
        fontSize: 14.sp,
      );

  ///NunitoSans medium 16
  static TextStyle get medium16 => regular10.copyWith(
        fontWeight: AppFontWeight.medium,
        fontSize: 16.sp,
      );

  ///NunitoSans 14
  static TextStyle get regular14 => _baseTextStyle.copyWith(
        fontSize: 14.sp,
      );

  ///NunitoSans light 14
  static TextStyle get light14 =>
      regular14.copyWith(fontWeight: AppFontWeight.light);

  ///NunitoSans semibold 14
  static TextStyle get semibold14 =>
      regular14.copyWith(fontWeight: AppFontWeight.semiBold);

  ///NunitoSans bold 14
  static TextStyle get bold14 =>
      regular14.copyWith(fontWeight: AppFontWeight.bold);

  ///NunitoSans 15
  static TextStyle get regular15 => _baseTextStyle.copyWith(
        fontSize: 15.sp,
      );

  ///NunitoSans medium 15
  static TextStyle get medium15 =>
      regular15.copyWith(fontWeight: AppFontWeight.medium);

  ///NunitoSans semibold 15
  static TextStyle get semibold15 =>
      regular15.copyWith(fontWeight: AppFontWeight.semiBold);

  ///NunitoSans 16
  static TextStyle get regular16 => _baseTextStyle.copyWith(
        fontSize: 16.sp,
      );

  ///NunitoSans light 16
  static TextStyle get light16 =>
      regular16.copyWith(fontWeight: AppFontWeight.light);

  ///NunitoSans semibold 16
  static TextStyle get semibold16 =>
      regular16.copyWith(fontWeight: AppFontWeight.semiBold);

  ///NunitoSans extrabold 16
  static TextStyle get extrabold16 =>
      regular16.copyWith(fontWeight: AppFontWeight.extraBold);

  ///NunitoSans bold 16
  static TextStyle get bold16 =>
      regular16.copyWith(fontWeight: AppFontWeight.bold);

  ///NunitoSans 18
  static TextStyle get regular18 => _baseTextStyle.copyWith(
        fontSize: 18.sp,
      );

  ///NunitoSans semibold 18
  static TextStyle get semibold18 =>
      regular18.copyWith(fontWeight: AppFontWeight.semiBold);

  ///NunitoSans bold 18
  static TextStyle get bold18 =>
      regular18.copyWith(fontWeight: AppFontWeight.bold);

  ///NunitoSans 20
  static TextStyle get regular20 => _baseTextStyle.copyWith(
        fontSize: 20.sp,
      );

  ///NunitoSans medium 20
  static TextStyle get medium20 =>
      regular20.copyWith(fontWeight: AppFontWeight.medium);

  ///NunitoSans semibold 20
  static TextStyle get semibold20 =>
      regular20.copyWith(fontWeight: AppFontWeight.semiBold);

  ///NunitoSans bold 20
  static TextStyle get bold20 =>
      regular20.copyWith(fontWeight: AppFontWeight.bold);

  ///NunitoSans extra bold 20
  static TextStyle get extraBold20 =>
      regular20.copyWith(fontWeight: AppFontWeight.extraBold);

  ///NunitoSans bold 24
  static TextStyle get semibold24 => regular16.copyWith(
        fontWeight: AppFontWeight.semiBold,
        fontSize: 24.sp,
      );
}

abstract class AppFontWeight {
  /// FontWeight value of `w900`
  static const FontWeight black = FontWeight.w900;

  /// FontWeight value of `w800`
  static const FontWeight extraBold = FontWeight.w800;

  /// FontWeight value of `w700`
  static const FontWeight bold = FontWeight.w700;

  /// FontWeight value of `w600`
  static const FontWeight semiBold = FontWeight.w600;

  /// FontWeight value of `w500`
  static const FontWeight medium = FontWeight.w500;

  /// FontWeight value of `w400`
  static const FontWeight regular = FontWeight.w400;

  /// FontWeight value of `w300`
  static const FontWeight light = FontWeight.w300;

  /// FontWeight value of `w200`
  static const FontWeight extraLight = FontWeight.w200;

  /// FontWeight value of `w100`
  static const FontWeight thin = FontWeight.w100;
}
