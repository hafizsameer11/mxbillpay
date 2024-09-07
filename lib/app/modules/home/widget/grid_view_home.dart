import 'package:EarlybazeWallet/app/export.dart';

class HomeGrid extends StatelessWidget {
  final String? title;
  final String? subtitle1;
  final String? subtitle2;
  final String? supportType;
  final String? imageFile;

  const HomeGrid({super.key, this.title, this.subtitle1, this.subtitle2, this.supportType, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius_10),
          gradient: LinearGradient(
            colors: [Color(0xFF04C304), Color(0xFFD2FAC0)],
            begin: const Alignment(0.6, -1),
            end: const Alignment(0.6, 0.95),
          )),
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NetworkImageWidget(
                    imageUrl: imageFile!,
                    imageHeight: height_80,
                    imageWidth: height_80,
                    imageFitType: BoxFit.cover,
                    placeHolder: iconsSell,
                    radiusAll: Get.width,
                  ).marginOnly(top: margin_6),
                  TextView(
                    text: title ?? "",
                    textStyle: textStyleBody1().copyWith(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  Column(
                    children: [
                      TextView(
                        text: subtitle1 ?? "",
                        textStyle: textStyleBody2().copyWith(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
                      ),
                      TextView(text: subtitle2 ?? "", textStyle: textStyleBody3().copyWith(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black)),
                    ],
                  ),
                  supportType != null
                      ? Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.black),
                          child: TextView(text: supportType ?? "", textStyle: textStyleBody2().copyWith(color: Colors.white, fontSize: 12))
                              .marginSymmetric(horizontal: 6, vertical: 3))
                      : SizedBox(),
                ],
              ),
            ),
            Container(
                width: Get.width,
                decoration:
                    BoxDecoration(color: Color(0xff47593F), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius_10), bottomRight: Radius.circular(radius_10))),
                child: AssetImageWidget(
                  iconsForward,
                  imageHeight: height_28,
                ).marginAll(margin_5)),
          ],
        ),
      ),
    );
  }
}
