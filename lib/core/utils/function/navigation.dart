import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

void navigateTo(context, dynamic route) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => route,
    ));

void navigateToWithAnimation(context, dynamic route) => Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => route,
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );

void navigateAndReplace(context, dynamic route) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => route), (route) => false);

void navigateAndReplaceWithAnimation(context, dynamic route) =>
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => route,
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, a, __, c) =>
            //   SizeTransition(sizeFactor: a, child: c),
            //  RotationTransition(turns: a, child: c),
            // ScaleTransition(scale: a, child: c),
            FadeTransition(opacity: a, child: c),
      ),
    );
