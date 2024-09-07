
import '../../export.dart';
import '../base/application_avalibility.dart';

appExpirationDialog() {
  return Get.dialog(
    ApplicationAvailabilityDialog(),
    barrierColor: Colors.grey.shade300,
    barrierDismissible: false,
  );
}

logoutDialog({onTap}) {
  return showModalBottomSheet(

    context: Get.overlayContext!, builder: (BuildContext context) {
    return   Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(

          // width: Get.width,
          color: appBlackColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: margin_20),
                decoration: BoxDecoration(
                    color: appBlackColor,
                    borderRadius: BorderRadius.circular(margin_10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          )).marginOnly(right: 8,top: 5),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        TextView(
                          text: "strLogoutDialog",
                          textStyle: textStyleBody1().copyWith(color: textColor,height: height_10),
                          maxLine: 1,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child:
                                _yesBtn(onTap: onTap ?? () {}, label: strLogout)
                                    .marginOnly(right: width_30)),
                            Expanded(
                                child: _noBtn().marginOnly(
                                  left: width_30,
                                )),
                          ],
                        ).marginAll(20)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ); },
  );
}

Widget _yesBtn({onTap, label}) {
  return MaterialButtonWidget(

      buttonRadius: 10,
      onPressed: onTap ??
              () {
            Get.offAllNamed(AppRoutes.loginScreen);
          },
      buttonText: label ?? '',
      textColor: Colors.white,
      minHeight: height_20,
      buttonColor: appGreenColor).marginAll(10);
}

Widget _noBtn() {
  return MaterialButtonWidget(
      buttonRadius: 10,
      onPressed: () {
        Get.back();
      },
      buttonText: strCancel,
      textColor: Colors.white,
      buttonColor: appGreenColor).marginAll(10);
}

