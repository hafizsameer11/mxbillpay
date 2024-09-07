/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import '../../export.dart';

class ScreenHeading extends StatelessWidget {
  final String title;
  final textStyle;
  final actionIcon;
  final topMargin;

  ScreenHeading({
    Key? key,
    required this.title,
    this.actionIcon,
    this.textStyle,
    this.topMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(text: title, textStyle: textStyle ?? textStyleHeading5()),
              ],
            ),
          ),
          actionIcon ?? Container()
        ],
      ).paddingOnly(
          left: margin_15,
          right: margin_15,
          bottom: margin_15,
          top: topMargin ?? margin_5),
    );
  }
}
