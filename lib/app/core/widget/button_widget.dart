/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */
import '../../export.dart';

class MaterialButtonWidget extends StatelessWidget {
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
  const MaterialButtonWidget({
    Key? key,
    this.buttonText = "",
    this.buttonColor,
    this.buttonTextStyle,
    this.textColor,
    this.buttonRadius,
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
        padding: EdgeInsets.symmetric(vertical: padding ?? margin_15),
        child: TextView(text : buttonText!,
            textStyle: textStyleButton().copyWith(
                color: textColor ?? Colors.white,
                fontSize: fontsize??fontsize,

                fontFamily: FontFamily.barnaulGrotesk,
                fontWeight:fontWeight?? FontWeight.w500)));
  }
}


class GradientButton extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;
  final bool? isHeight;
  final double width;
  final buttonText;
  final textColor;
  final fontSize;
  final fontWeight;
  final color;
  final raduis;
  final double height;
  final Function()? onPressed;

  const GradientButton({
    Key? key,
    this.child,
    this.gradient,
    this.textColor,
    this.raduis,
    this.color,
    this.buttonText,
    this.fontSize,
    this.fontWeight,
    this.width = double.infinity,
    this.height = 50.0,
    this.isHeight = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height_45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(raduis ?? margin_8),
        gradient: splashGradient,
      ),
      child: InkWell(
          onTap: onPressed,
          child: Center(
            child: TextView(
                text: buttonText!,
                textStyle: textStyleHeading().copyWith(
                    color: textColor??Colors.black,
                    fontSize: fontSize??18,
                    fontWeight: fontWeight??FontWeight.bold)),
          )),
    );
  }
}
