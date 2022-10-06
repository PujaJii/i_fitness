import 'package:flutter/material.dart';

import 'app_colors.dart';


final ButtonStyle elevatedButtonStyleThemeColor = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: AppColors.themeColorTwo,
  minimumSize: const Size(150, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
  ),
);

final ButtonStyle elevatedButtonStyleThemeColorTow = ElevatedButton.styleFrom(
 onPrimary: Colors.white,
 primary: AppColors.themeColorTwo,
 minimumSize: const Size(150, 36),
 padding: const EdgeInsets.symmetric(horizontal: 16),
 shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(4)),
 ),
);

final ButtonStyle elevatedButtonStyleWhiteCurve = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.green,
  minimumSize: const Size(150, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);


final ButtonStyle textButtonStyleWhite = TextButton.styleFrom(
  primary: Colors.black87,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

final ButtonStyle curveButtonStyleThemeColorTow = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: AppColors.themeColorTwo,
  minimumSize: const Size(150, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);

final ButtonStyle curveButtonStyleThemeColor = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: AppColors.btnColor,
  minimumSize: const Size(150, 40),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);


final ButtonStyle elevatedButtonStyleStripe = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary:Colors.deepPurpleAccent,
  minimumSize: const Size(150, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);

final ButtonStyle elevatedCurveButtonStyleRed = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.redAccent,
  minimumSize: const Size(150, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);

final ButtonStyle elevatedCurveButtonStyleYellow = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.amberAccent,
  minimumSize: const Size(150, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);
