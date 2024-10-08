/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import '../../export.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    return ThemeData(
      brightness: brightness,
      canvasColor: background,
      primaryColorDark: Colors.white,
      primarySwatch: Colors.red,
      cardColor: background,
      dividerColor: divider,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      primaryColor: accentColor,
      colorScheme: ColorScheme.fromSwatch(backgroundColor: background, errorColor: error, accentColor: accentColor, brightness: brightness),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: appColor,
        selectionHandleColor: appColor,
        cursorColor: appColor,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: brightness),
        color: Colors.black,
        toolbarTextStyle: TextStyle(
          color: secondaryText,
          fontSize: 18.0.sp,
        ),
        iconTheme: IconThemeData(color: Colors.black, size: height_25),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: height_25,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: Colors.purple,
          primaryContainer: accentColor,
          secondary: accentColor,
          secondaryContainer: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontFamily: 'PublicSans',
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: primaryText.withOpacity(0.5),
        ),
      ),
      fontFamily: 'PublicSans',
      unselectedWidgetColor: HexColor('#DADCDD'),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: font_24,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontSize: font_20,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
          fontSize: font_18,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: font_20,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: font_18,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: font_16,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontSize: font_15,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: font_14,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: Colors.white,
          fontSize: font_13,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: font_13,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: font_12,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: font_11,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: font_16,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: font_15,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontSize: font_14,
          fontFamily: "PublicSans",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: Colors.white,
        cardBackground: Colors.white,
        primaryText: Colors.white,
        secondaryText: Colors.white,
        accentColor: Colors.white,
        divider: Colors.white,
        buttonBackground: Colors.black38,
        buttonText: Colors.white,
        disabled: Colors.black,
        error: Colors.red,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.light,
        background: Colors.white,
        cardBackground: Colors.white,
        primaryText: Colors.white,
        secondaryText: Colors.white,
        accentColor: Colors.white,
        divider: Colors.white,
        buttonBackground: Colors.black38,
        buttonText: Colors.white,
        disabled: Colors.black,
        error: Colors.red,
      );
}
