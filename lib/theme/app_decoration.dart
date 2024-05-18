import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple5002,
      );

  static BoxDecoration get fillDeeppurple5001 => BoxDecoration(
        color: appTheme.deepPurple5001,
      );

  static BoxDecoration get fillDeeppurple5003 => BoxDecoration(
        color: appTheme.deepPurple5003,
      );

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );

  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );

  static BoxDecoration get fillGray10001 => BoxDecoration(
        color: appTheme.gray10001,
      );

  static BoxDecoration get fillGray300 => BoxDecoration(
        color: appTheme.gray300,
      );

  static BoxDecoration get fillGray70001 => BoxDecoration(
        color: appTheme.gray70001.withOpacity(0.08),
      );

  static BoxDecoration get fillGray700011 => BoxDecoration(
        color: appTheme.gray70001,
      );

  static BoxDecoration get fillGray900 => BoxDecoration(
        color: appTheme.gray900.withOpacity(0.08),
      );

  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green500,
      );

  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
      );

  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  static BoxDecoration get fillPrimary1 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.12),
      );

  static BoxDecoration get fillPrimary2 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.08),
      );

  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red50,
      );

  static BoxDecoration get fillRed900 => BoxDecoration(
        color: appTheme.red900,
      );

  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
      );

// Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.3),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          )
        ],
      );

  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.15),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          )
        ],
      );

  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineBluegray100 => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border.all(
          color: appTheme.blueGray100,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineBluegray1001 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.blueGray100,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineBluegray1002 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.blueGray100,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineDeepPurple => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border.all(
          color: appTheme.deepPurple50,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineDeeppurple50 => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        border: Border.all(
          color: appTheme.deepPurple50,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineDeeppurple5002 => BoxDecoration(
        color: appTheme.gray100,
        border: Border.all(
          color: appTheme.deepPurple5002,
          width: 1.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );

  static BoxDecoration get outlineDeeppurple5003 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: appTheme.deepPurple5003,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineDeeppurple501 => BoxDecoration(
        border: Border.all(
          color: appTheme.deepPurple50,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineDeeppurple502 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.deepPurple50,
            width: 1.h,
          ),
          left: BorderSide(
            color: appTheme.deepPurple50,
            width: 1.h,
          ),
          right: BorderSide(
            color: appTheme.deepPurple50,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineDeeppurple503 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.deepPurple50,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray900,
          width: 1.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );

  static BoxDecoration get outlineGray10001 => BoxDecoration(
        color: appTheme.deepPurple5003,
        border: Border.all(
          color: appTheme.gray10001,
          width: 10.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );

  static BoxDecoration get outlineGray300 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineGray500 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray500,
          width: 2.h,
        ),
      );

  static BoxDecoration get outlineGray60002 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray60002,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineGray600021 => BoxDecoration(
        color: appTheme.pink50,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray60002,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineGray600022 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.gray60002,
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get outlineGray600023 => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        border: Border.all(
          color: appTheme.gray60002,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineGray900 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray900,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineOnErrorContainer => BoxDecoration(
        color: appTheme.deepPurple5001,
        border: Border.all(
          color: theme.colorScheme.onErrorContainer,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 3.h,
        ),
      );

  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: appTheme.deepPurple5003,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: appTheme.whiteA70001,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlinePrimary3 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 2.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );

  static BoxDecoration get outlinePrimary4 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 2.h,
        ),
      );

  static BoxDecoration get outlinePurple => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        border: Border.all(
          color: appTheme.purple50,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlinePurple50 => BoxDecoration(
        border: Border.all(
          color: appTheme.purple50,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder12 => BorderRadius.circular(
        12.h,
      );

  static BorderRadius get circleBorder128 => BorderRadius.circular(
        128.h,
      );

  static BorderRadius get circleBorder20 => BorderRadius.circular(
        20.h,
      );

  static BorderRadius get circleBorder24 => BorderRadius.circular(
        24.h,
      );

  static BorderRadius get circleBorder32 => BorderRadius.circular(
        32.h,
      );

  static BorderRadius get circleBorder35 => BorderRadius.circular(
        35.h,
      );

  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );

// Custom borders
  static BorderRadius get customBorderBL11 => BorderRadius.vertical(
        bottom: Radius.circular(11.h),
      );

  static BorderRadius get customBorderBL12 => BorderRadius.only(
        topLeft: Radius.circular(4.h),
        topRight: Radius.circular(12.h),
        bottomLeft: Radius.circular(12.h),
        bottomRight: Radius.circular(12.h),
      );

  static BorderRadius get customBorderBL8 => BorderRadius.vertical(
        bottom: Radius.circular(8.h),
      );

  static BorderRadius get customBorderLR12 => BorderRadius.only(
        topLeft: Radius.circular(4.h),
        topRight: Radius.circular(12.h),
        bottomLeft: Radius.circular(4.h),
        bottomRight: Radius.circular(12.h),
      );

  static BorderRadius get customBorderTL12 => BorderRadius.only(
        topLeft: Radius.circular(12.h),
        topRight: Radius.circular(12.h),
        bottomLeft: Radius.circular(12.h),
        bottomRight: Radius.circular(4.h),
      );

  static BorderRadius get customBorderTL121 => BorderRadius.only(
        topLeft: Radius.circular(12.h),
        topRight: Radius.circular(12.h),
        bottomLeft: Radius.circular(4.h),
        bottomRight: Radius.circular(12.h),
      );

  static BorderRadius get customBorderTL122 => BorderRadius.only(
        topLeft: Radius.circular(12.h),
        topRight: Radius.circular(4.h),
        bottomLeft: Radius.circular(12.h),
        bottomRight: Radius.circular(4.h),
      );

  static BorderRadius get customBorderTL123 => BorderRadius.only(
        topLeft: Radius.circular(12.h),
        topRight: Radius.circular(4.h),
        bottomLeft: Radius.circular(12.h),
        bottomRight: Radius.circular(12.h),
      );

  static BorderRadius get customBorderTL124 => BorderRadius.vertical(
        top: Radius.circular(12.h),
      );

  static BorderRadius get customBorderTL28 => BorderRadius.vertical(
        top: Radius.circular(28.h),
      );

  static BorderRadius get customBorderTL4 => BorderRadius.vertical(
        top: Radius.circular(4.h),
      );

  static BorderRadius get customBorderTL8 => BorderRadius.vertical(
        top: Radius.circular(8.h),
      );

// Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );

  static BorderRadius get roundedBorder28 => BorderRadius.circular(
        28.h,
      );

  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );

  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}
