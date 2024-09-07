/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import '../../export.dart';

class LogOutDialogWidget extends StatelessWidget {
  final String title;
  final String description;
  final Function()? onYesPressed;

  LogOutDialogWidget({
    Key? key,
    required this.title,
    required this.description,
    this.onYesPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            width: Get.width,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(margin_5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dialogTitle(),
                _logoutSubTitle(),
              ],
            ).marginAll(margin_20)),
        _dialogButton()
      ],
    ).marginAll(margin_10);
  }

  Widget _dialogTitle() => TextView(
        text: title,
        textStyle: textStyleHeading().copyWith(fontSize: font_20),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_10);

  Widget _logoutSubTitle() => TextView(
        text: description,
        maxLine: 3,
        textStyle: textStyleTitle2(),
        textAlign: TextAlign.start,
      ).paddingOnly(bottom: margin_10);

  Widget _dialogButton() {
    return Row(
      children: [
        noButton(),
        SizedBox(width: margin_15),
        yesButton(),
      ],
    ).marginOnly(top: margin_10, bottom: margin_20);
  }

  yesButton() {
    return Expanded(
        child: MaterialButtonWidget(
      onPressed: onYesPressed,
      buttonColor: appGreenColor,
      buttonRadius: margin_5,
      textColor: Colors.white,
      buttonText: strYes,
      fontsize: font_15,
      fontWeight: FontWeight.w600,
    ));
  }

  noButton() {
    return Expanded(
        child: MaterialButtonWidget(
      onPressed: () {
        Get.back();
      },
      elevation: 10.0,
      buttonColor: greyColor,
      borderColor: greyColor,
      buttonRadius: margin_5,
      textColor: Colors.white,
      buttonText: strNo,
      fontsize: font_15,
      fontWeight: FontWeight.w600,
    ));
  }
}
