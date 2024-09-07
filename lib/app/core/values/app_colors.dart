/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:flutter/material.dart';

Color appColor = Color.fromRGBO(19, 132, 138, 1.0);
Color backgroundColor = Colors.black;
Color greenColor = Color.fromRGBO(36, 165, 33, 1.0);
Color missedColor = Color.fromRGBO(231, 138, 2, 1.0);
Color headingColor = Color.fromRGBO(40, 40, 40, 1.0);
Color textFieldBorderColor = Color.fromRGBO(203, 203, 203, 1.0);
Color textFieldLabelColor = Color.fromRGBO(107, 107, 107, 1.0);
Color textColor = Colors.white;
Color textWhiteColor = Colors.white70;
Color appGreenColor = Color(0xFF04C304);
Color appBlackColor = Color(0xFF14140F);
Color transparentBlackColor = Color(0xE2000000);
Color textFieldColor = Color(0xFF3A3A3A);
Color gradientColor = Color(0xFFD2FAC0);
Color appLightColor = Color.fromRGBO(227, 255, 255, 1.0);
Color toastColor = Color.fromRGBO(200, 239, 238, 1.0);
Color categoriesColor = Color.fromRGBO(226, 240, 240, 1.0);
Color backColor = Color.fromRGBO(29, 61, 112, 1.0);
Color greyColor = Color.fromRGBO(117, 117, 117, 1.0);
Color hintTextColor = Color.fromRGBO(156, 156, 156, 1.0);
Color labelTextColor = Color.fromRGBO(116, 116, 116, 1.0);

Color greyTextColor = Color.fromRGBO(139, 139, 139, 1.0);
Color brownTextColor = Color.fromRGBO(138, 129, 123, 1.0);
Color beachesTextColor = Color.fromRGBO(19, 106, 143, 1.0);
Color foodTextColor = Color.fromRGBO(85, 141, 169, 1.0);
Color toursTextColor = Color.fromRGBO(23, 153, 150, 1.0);
Color locationColor = Color.fromRGBO(201, 201, 201, 1.0);
Color langSelectGreyColor = Color.fromRGBO(201, 201, 201, 1.0);
const Color textColorPrimary = Color(0xFF323232);
Color hintGrey = const Color.fromRGBO(160, 164, 176, 1.0);
const Color colorPrimary = Color(0xFF38686A);
const Color boardingColor = Color(0xFF3AAF2D);
const Color buttonColor = Color(0xFF3AAF2D);
const Color buttonEdgeColor = Color(0xFFBEBEBE);
const Color filledColor = Color(0xFFEBF7EA);
const Color buttonColorHome = Color(0xFF3AAF2D);
const Color cardBackGroundColor = Color(0xFFF5F5F5);
const Color sliderColor = Color(0xFF2A3D8C);
const Color textFieldFocusColor = Color(0xFFE9F5E8);

LinearGradient splashGradient = LinearGradient(
  colors: [Color(0xFF04C304), Color(0xFFD2FAC0)],
);

class HexColor extends Color {
  static int getcolorfromHex(String hexcolor) {
    hexcolor = hexcolor.toUpperCase().replaceAll("#", "");
    if (hexcolor.length == 6) {
      hexcolor = "FF" + hexcolor;
    }
    return int.parse(hexcolor, radix: 16);
  }

  HexColor(final String hexColor) : super(getcolorfromHex(hexColor));
}
