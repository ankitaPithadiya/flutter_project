import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onErrorContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray60002,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.onErrorContainer,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.deepPurple50,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray60001,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 57.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 32.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 28.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray800,
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: appTheme.gray60001,
          fontSize: 11.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 22.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray900,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    primary: Color(0XFFea4e47),
    primaryContainer: Color(0XFF27a5db),
    secondaryContainer: Color(0XFFEA4335),
    errorContainer: Color(0XFF4F378B),
    onErrorContainer: Color(0XFFFFFFFF),
    onPrimary: Color(0XFF21005D),
    onPrimaryContainer: Color(0XFF938F96),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amberA100 => Color(0XFFFDE77A);

  Color get amberA200 => Color(0XFFFFDA44);

// Black
  Color get black900 => Color(0XFF000000);

// Blue
  Color get blue900 => Color(0XFF0052B4);

// BlueGray
  Color get blueGray100 => Color(0XFFCAC4D0);

  Color get blueGray200 => Color(0XFFB0A7C0);

  Color get blueGray400 => Color(0XFF888888);

  Color get blueGray800 => Color(0XFF2F4859);

  Color get blueGray900 => Color(0XFF322F37);

  Color get blueGray90001 => Color(0XFF322F35);

  Color get blueGray90002 => Color(0XFF072654);

  Color get blueGray90003 => Color(0XFF332D41);

  Color get blueGray90004 => Color(0XFF36343B);

  Color get blueGray90005 => Color(0XFF2B2930);

// DeepOrange
  Color get deepOrange50 => Color(0XFFF9DEDC);

// DeepPurple
  Color get deepPurple100 => Color(0XFFD0BCFF);

  Color get deepPurple400 => Color(0XFF7F67BE);

  Color get deepPurple50 => Color(0XFFE7E0EC);

  Color get deepPurple5001 => Color(0XFFE8DEF8);

  Color get deepPurple5002 => Color(0XFFECE6F0);

  Color get deepPurple5003 => Color(0XFFEADDFF);

// Gray
  Color get gray100 => Color(0XFFF7F2FA);

  Color get gray10001 => Color(0XFFF6EDFF);

  Color get gray10002 => Color(0XFFF5EFF7);

  Color get gray200 => Color(0XFFEFE9EB);

  Color get gray20001 => Color(0XFFF0F0F0);

  Color get gray300 => Color(0XFFE6E0E9);

  Color get gray30001 => Color(0XFFECE4E1);

  Color get gray30002 => Color(0XFFDED8E1);

  Color get gray400 => Color(0XFFCAC5CD);

  Color get gray50 => Color(0XFFFEF7FF);

  Color get gray500 => Color(0XFFAEA9B1);

  Color get gray600 => Color(0XFF7A7289);

  Color get gray60001 => Color(0XFF79767D);

  Color get gray60002 => Color(0XFF79747E);

  Color get gray700 => Color(0XFF605D64);

  Color get gray70001 => Color(0XFF625B71);

  Color get gray800 => Color(0XFF49454F);

  Color get gray80001 => Color(0XFF3B383E);

  Color get gray80002 => Color(0XFF48464C);

  Color get gray900 => Color(0XFF1D1B20);

  Color get gray90001 => Color(0XFF1D192B);

  Color get gray90002 => Color(0XFF202124);

// Green
  Color get green500 => Color(0XFF469967);

// Indigo
  Color get indigo900 => Color(0XFF381E72);

  Color get indigoA200 => Color(0XFF6772E5);

// Pink
  Color get pink50 => Color(0XFFFFD8E4);

// Purple
  Color get purple50 => Color(0XFFF3EDF7);

  Color get purple800 => Color(0XFF5F259F);

// Red
  Color get red300 => Color(0XFFe74c3c);
  Color get blue => Color(0XFF0f79f3);

  Color get red50 => Color(0XFFFCEEEE);

  Color get red700 => Color(0XFFDC362E);

  Color get red900 => Color(0XFFB3261E);

  Color get redA700 => Color(0XFFE50019);

  Color get redA70001 => Color(0XFFD80027);

// White
  Color get whiteA700 => Color(0XFFFFFBFF);

  Color get whiteA70001 => Color(0XFFFFFBFE);

// Yellow
  Color get yellow800 => Color(0XFFFDB022);
}
