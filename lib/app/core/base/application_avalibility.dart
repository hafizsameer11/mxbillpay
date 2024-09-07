/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import '../../export.dart';

class ApplicationAvailabilityDialog extends AlertDialog {
  const ApplicationAvailabilityDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
          height: height_150,
          width: Get.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius_10),
                topRight: Radius.circular(radius_10),
              )),
          child: imageAsset(iconsAlert)),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: EdgeInsets.symmetric(
          horizontal: margin_10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextView(
              text: strDemoExpired,
              textStyle: textStyleBody2()
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ).marginOnly(bottom: margin_10),
            TextView(
              text: strAppDemoExpiredDesc,
              maxLine: 4,
              textStyle: textStyleBody2().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: font_14),
            ).marginOnly(bottom: height_20),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius_10)),
    );
  }
}
