import 'dart:ui';

import 'package:dayalima_test/src/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//// USAGE
// Theme.of(context).copyWith(accentColor: Colors.yellow),
// Theme.of(context).accentColor,
// Theme.of(context).textTheme.headline6,
// Styles.PrimaryColor

class Styles {
  // Color
  static final Color _primaryColor = hexToColor('22DA9D');
  static final Color _accentColor = hexToColor('106B54');
  static final Color _secondaryColor = hexToColor('00BFA5');
  static final Color _backroundColor = hexToColor('F8FFFD');
  static final Color _lightColor = hexToColor('FFFFFF');
  static final Color _darkColor = hexToColor('030303');
  static final Color _greyColor = hexToColor('707070');
  static final Color _textColorDefault = hexToColor('054534');
  static final Color _textColorStrong = hexToColor('030303');

  // Theme
  static final themeData = ThemeData(
    splashColor: Colors.white,
    dialogBackgroundColor: _lightColor,
    primarySwatch: Colors.green,
    backgroundColor: _backroundColor,
    primaryColor: _primaryColor,
    primaryColorDark: _accentColor,
    textTheme: _globalTextTheme,
    dividerColor: _backroundColor,
  );

  static final _globalTextTheme = TextTheme(
    headline1: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 97.0)),
    headline2: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 61.0)),
    headline3: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 48.0)),
    headline4: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 34.0)),
    headline5: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 24.0)),
    headline6: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 20.0)),
    subtitle1: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 16.0)),
    subtitle2: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 14.0)),
    bodyText2: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 16.0)),
    bodyText1: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 14.0)),
    button: GoogleFonts.ubuntu(
        textStyle: TextStyle(fontSize: 14.0, letterSpacing: 0.5)),
    caption: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 12.0)),
    overline: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 10.0)),
  );

  // Responsive
  static double responsiveSize({
    @required BuildContext context,
    @required double largeValue,
    @required double mediumValue,
    @required double smallValue,
    @required double verrySmallValue,
  }) {
    if (Responsive.isLargeScreen(context)) {
      return largeValue;
    } else if (Responsive.isMediumScreen(context)) {
      return mediumValue;
    } else if (Responsive.isVerySmallScreen(context)) {
      return smallValue;
    } else {
      return verrySmallValue;
    }
  }

  // Color
  static Color primaryColor() {
    return _primaryColor;
  }

  static Color accentColor() {
    return _accentColor;
  }

  static Color secondaryColor() {
    return _secondaryColor;
  }

  static Color backgroundColor() {
    return _backroundColor;
  }

  static Color lightColor() {
    return _lightColor;
  }

  static Color darkColor() {
    return _darkColor;
  }

  static Color greyColor() {
    return _greyColor;
  }

  static Color textColorDefault() {
    return _textColorDefault;
  }

  static Color textColorStrong() {
    return _textColorStrong;
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
}
