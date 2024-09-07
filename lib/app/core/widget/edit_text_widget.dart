
/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import '../../export.dart';
class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final String? labelText;
  final String? tvHeading;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? courserColor;
  final validate;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final Function(String value)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputAction? inputAction;
  final bool? hideBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxline;
  final decoration;
  final int? minLine;
  final int? maxLength;
  final bool readOnly;
  final bool? shadow;
  final bool? obscureText;
  final bool? isOutined;
  final Function(String value)? onChange;
  final inputFormatter;
  final errorColor;
  final filledColor;
  final textViewText;
  const TextFieldWidget({
    this.hint,
    this.labelText,
    this.tvHeading,
    this.inputType,
    this.textController,
    this.hintStyle,
    this.courserColor,
    this.validate,
    this.onChange,
    this.decoration,
    this.radius,
    this.focusNode,
    this.readOnly = false,
    this.shadow,
    this.onFieldSubmitted,
    this.inputAction,
    this.height,
    this.width,
    this.contentPadding,
    this.isOutined = false,
    this.maxline = 1,
    this.minLine = 1,
    this.maxLength,
    this.color,
    this.hideBorder = true,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.onTap,
    this.inputFormatter,
    this.errorColor,
    this.textViewText,
    this.filledColor
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textViewText != null
        ?TextView(
          text: textViewText ?? "",
          textStyle: textStyleLabel2().copyWith(
            color: appGreenColor,
              fontFamily: FontFamily.barnaulGrotesk,
              fontWeight: FontWeight.w500,
              fontSize: font_13
          ),).paddingOnly(bottom: margin_5,left: margin_8)
        :SizedBox(),
        TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            obscureText: obscureText ?? false,
            controller: textController,
            focusNode: focusNode,
            keyboardType: inputType,
            maxLength: maxLength,
            onChanged: onChange,
            cursorColor: courserColor ?? Colors.white,
            inputFormatters: inputFormatter ??
                [
                  FilteringTextInputFormatter(
                      RegExp(
                          '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                      allow: false),
                ],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: maxline,
            minLines: minLine,
            textInputAction: inputAction,
            onFieldSubmitted: onFieldSubmitted,
            validator: validate,
            style: Theme.of(Get.context!).textTheme.displayLarge!.copyWith(
                fontSize: font_15,
                fontFamily: FontFamily.barnaulGrotesk,
                fontWeight: FontWeight.w500,
                color: textColor),
            decoration: inputDecoration()),
      ],
    );
  }

  inputDecoration() => InputDecoration(
    counterText: "",
    errorMaxLines: 2,
    errorStyle: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
      fontFamily: FontFamily.barnaulGrotesk,
        fontSize: font_14,
        fontWeight: FontWeight.w400,
        color: errorColor ?? Colors.red),
    isDense: true,
    filled: true,
    contentPadding: contentPadding ??
        EdgeInsets.symmetric(
            vertical: margin_15, horizontal: margin_10),
    prefixIcon: prefixIcon,
    suffixIcon: isOutined == true ? null : suffixIcon,
    hintText: hint,
    hintStyle: hintStyle==null?
        textStyleBody1().copyWith(
          color: Colors.grey.shade500,
        ):hintStyle!.copyWith(fontSize: font_13),
    labelText: labelText,
    fillColor: textFieldColor,
    border: decoration ??
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? radius_5),
            borderSide: BorderSide(color: Colors.grey.shade300)),
    focusedErrorBorder: decoration ??
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? radius_5),
            borderSide: BorderSide(color: Colors.red.shade300)),
    errorBorder: decoration ??
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? radius_5),
            borderSide: BorderSide(color: Colors.red.shade300)),
    focusedBorder: decoration ??
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? radius_5),
            borderSide: BorderSide(color: Colors.green.shade300)),
    enabledBorder: decoration ??
        OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? radius_5),
            borderSide: BorderSide(color: buttonEdgeColor)),
  );
}

class DecoratedInputBorder extends InputBorder {
  DecoratedInputBorder({
    required this.child,
    this.shadow,
  }) : super(borderSide: child.borderSide);

  final InputBorder child;

  final BoxShadow? shadow;

  @override
  bool get isOutline => child.isOutline;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      child.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      child.getOuterPath(rect, textDirection: textDirection);

  @override
  EdgeInsetsGeometry get dimensions => child.dimensions;

  @override
  InputBorder copyWith(
      {BorderSide? borderSide,
        InputBorder? child,
        BoxShadow? shadow,
        bool? isOutline}) {
    return DecoratedInputBorder(
      child: (child ?? this.child).copyWith(borderSide: borderSide),
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ShapeBorder scale(double t) {
    final scalledChild = child.scale(t);

    return DecoratedInputBorder(
      child: scalledChild is InputBorder ? scalledChild : child,
      shadow: BoxShadow.lerp(null, shadow, t),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
        double gapExtent = 0.0,
        double gapPercentage = 0.0,
        TextDirection? textDirection}) {
    final clipPath = Path()
      ..addRect(const Rect.fromLTWH(-5000, -5000, 10000, 10000))
      ..addPath(getInnerPath(rect), Offset.zero)
      ..fillType = PathFillType.evenOdd;
    canvas.clipPath(clipPath);

    final Paint paint = shadow!.toPaint();
    final Rect bounds =
    rect.shift(shadow!.offset).inflate(shadow!.spreadRadius);

    canvas.drawPath(getOuterPath(bounds), paint);

    child.paint(canvas, rect,
        gapStart: gapStart,
        gapExtent: gapExtent,
        gapPercentage: gapPercentage,
        textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DecoratedInputBorder &&
        other.borderSide == borderSide &&
        other.child == child &&
        other.shadow == shadow;
  }

  @override
  int get hashCode => hashValues(borderSide, child, shadow);
}

   