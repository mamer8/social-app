import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../function/material_color.dart';
import 'color_manager.dart';
import 'styles_manager.dart';
import 'font_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: buildMaterialColor(ColorManager.primary),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,

        //backgroundColor: Colors.black12,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        // showSelectedLabels: ,
        elevation: 20),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: ColorManager.white),
        color: ColorManager.primary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle:
            getBoldStyle(color: ColorManager.white, fontSize: FontSize.s20)),

    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    // button theme
    // buttonTheme: ButtonThemeData(
    //     shape: const StadiumBorder(),
    //     disabledColor: ColorManager.grey1,
    //     buttonColor: ColorManager.primary,
    //     splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),

            // primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    textTheme: TextTheme(

        // bodyText2: getRegular400Style(
        //     color: ColorManager.primary, fontSize: FontSize.s14),
        displayLarge:
            getSemiStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        headlineLarge:
            getSemiStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: ColorManager.primary, fontSize: FontSize.s14),
        titleMedium:
            getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        titleSmall: getRegularStyle(
            color: ColorManager.primary, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(
          color: ColorManager.primary,
        ),
        bodySmall: getRegularStyle(
          color: ColorManager.primary,
        ),
        bodyMedium: getRegularStyle(
            color: ColorManager.primary, fontSize: FontSize.s12),
        labelSmall:
            getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s12)),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.all(AppSize.s8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s18),
        // labelStyle: getMedium500Style(
        //     color: ColorManager.green, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
