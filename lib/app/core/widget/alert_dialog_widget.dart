/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import '../../export.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final bool? data;
  final bool? isCancelVisible;
  final Function()? onSuccess;
  final Function()? cancelPressed;
  final Function()? crossBackPressed;

  AlertDialogWidget({
    Key? key,
    required this.title,
    this.onSuccess,
    this.data = false,
    this.isCancelVisible = true,
    this.cancelPressed,
    this.crossBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: GetInkWell(
            onTap: crossBackPressed,
            child: AssetImageWidget(
              iconsIcBack,
              imageHeight: height_30,
              imageWidth: height_30,
            ).paddingOnly(right: margin_10, bottom: margin_20),
          ),
        ),
        _dialogTitle().paddingSymmetric(horizontal: margin_15),
        _continueButton(onPress: onSuccess),
        isCancelVisible == true
            ? _cancelButton(onCancel: cancelPressed)
            : Container(
                height: margin_0,
                width: margin_0,
              )
      ],
    ).paddingSymmetric(horizontal: margin_15);
  }

  Widget _dialogTitle() => TextView(
        text:  title,
        textStyle: textStyleHeading6().copyWith(color: Colors.black),
        textAlign: TextAlign.center,
      ).paddingOnly(top: margin_20, bottom: margin_15);

  _continueButton({onPress}) {
    return MaterialButtonWidget(
      onPressed: () {
        onPress();
      },
      buttonText: strNext,
      elevation: margin_2,
    ).paddingSymmetric(vertical: margin_10, horizontal: margin_10);
  }

  _cancelButton({onCancel}) {
    return MaterialButtonWidget(
      onPressed: () {
        onCancel();
      },
      buttonText: strCancel,
      buttonColor: appColor,
      textColor: appColor,
      borderColor: appColor,
      elevation: margin_4,
    ).paddingOnly(
        top: margin_5, bottom: margin_15, left: margin_10, right: margin_10);
  }
}
