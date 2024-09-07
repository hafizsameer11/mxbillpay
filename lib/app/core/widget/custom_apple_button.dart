/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import '../../../constants/assets.dart';
import '../../export.dart';

class MaterialAppleButtonWidget extends StatelessWidget {
  final String? buttonText;
  final buttonTextStyle;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonRadius;
  final double? minWidth;
  final double? minHeight;
  final double? verticalPadding;
  final double? horizontalPadding;
  final onPressed;
  final iconWidth;
  final iconHeight;
  final borderSide;
  final fontWeight;
  final elevation;
  final double? fontsize;
  final double? padding;
  final borderColor;
  final borderWidth;
  final widget;
  final iconWidget;
  final isOutlined;
  const MaterialAppleButtonWidget({
    Key? key,
    this.buttonText = "",
    this.buttonColor,
    this.buttonTextStyle,
    this.textColor,
    this.buttonRadius,
    this.iconWidth,
    this.iconHeight,
    required this.onPressed,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    this.minWidth,
    this.borderSide,
    this.padding,
    this.fontsize,
    this.minHeight,
    this.verticalPadding,
    this.horizontalPadding,
    this.widget,
    this.iconWidget,
    this.isOutlined = false, this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: minHeight,
        splashColor: Colors.transparent,
        minWidth: minWidth ?? Get.width,
        color: buttonColor ?? Colors.black,
        elevation: elevation ?? radius_2,


        shape: RoundedRectangleBorder(
            side: BorderSide(width:borderSide?? width_1,color: borderColor??greenColor),
            borderRadius: BorderRadius.circular(buttonRadius??0.0)),
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? margin_15,horizontal: horizontalPadding ?? margin_15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageAsset(iconAppleLogo,height: iconHeight ?? height_30,width: iconWidth ?? width_30),
            TextView(text : buttonText!,
                textStyle: textStyleButton().copyWith(
                    color: textColor ?? Colors.white,
                    fontSize: fontsize??fontsize,
                    fontWeight:fontWeight?? FontWeight.w500)).paddingOnly(left: margin_5),
          ],
        ));
  }
}
