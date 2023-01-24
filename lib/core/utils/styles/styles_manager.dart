import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    double? fontHeight,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(
      height: fontHeight,
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamilyChanga,
      color: color,
      fontWeight: fontWeight);
}

// light style 300
TextStyle getLightStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? ColorManager.black,
      fontWeight: FontWeightManager.light,
      fontSize: fontSize ?? FontSize.s16,
      fontHeight: fontHeight);
}

// regular style 400
TextStyle getRegularStyle(
    {Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? ColorManager.grey,
      fontWeight: FontWeightManager.regular,
      fontSize: fontSize ?? FontSize.s16,
      fontHeight: fontHeight);
}

// Regular with line

TextStyle getLineOverStyle({required Color color, double? fontHeight}) {
  return TextStyle(
      decoration: TextDecoration.lineThrough,
      height: fontHeight,
      fontSize: FontSize.s12,
      fontFamily: FontConstants.fontFamilyChanga,
      color: ColorManager.grey3D3D3D,
      fontWeight: FontWeightManager.regular);
}

// Medium style 500
TextStyle getMediumStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? ColorManager.black,
      fontWeight: FontWeightManager.medium,
      fontSize: fontSize ?? FontSize.s16,
      fontHeight: fontHeight);
}

// Semi bold style w600
TextStyle getSemiStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? ColorManager.black,
      fontWeight: FontWeightManager.semiBold,
      fontSize: fontSize ?? FontSize.s16,
      fontHeight: fontHeight);
}

// bold style 700
TextStyle getBoldStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? ColorManager.black,
      fontWeight: FontWeightManager.bold,
      fontSize: fontSize ?? FontSize.s16,
      fontHeight: fontHeight);
}

// Extra Bold style 800
TextStyle getExtraStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? ColorManager.black,
      fontWeight: FontWeightManager.extraBold,
      fontSize: fontSize ?? FontSize.s16,
      fontHeight: fontHeight);
}

//Black Style 900
TextStyle getBlackStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? ColorManager.black,
      fontWeight: FontWeightManager.black,
      fontSize: fontSize ?? FontSize.s16,
      fontHeight: fontHeight);
}
