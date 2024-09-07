import 'package:flutter_share/flutter_share.dart';
import 'package:in_app_review/in_app_review.dart';
// import 'package:url_launcher/url_launcher.dart';
import '../../../core/widget/custom_title_bar.dart';
import '../../../export.dart';
import '../../setting/view/CrashReportScreen.dart';
import '../controller/about_us_controller.dart';

class AboutUsScreen extends StatelessWidget {
  late AboutUsController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
        init: AboutUsController(),
        builder: (_con) {
          controller = _con;
          return Scaffold(
            appBar: CustomAppBar(),
            backgroundColor: appBlackColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleBar(
                  appBarTitleText: strAboutUs,
                ).marginOnly(left: 20),
                tileList(),

              ],
            ),
          );
        });
  }

  tileList() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _listTileIconView(
              label: "Version",
              // leadingIcon: iconsDelete,
              description: "${controller.versionNumber}"),
          _listTileIconView(
              label: "Rate App",
              // leadingIcon: iconsDelete,
              onSeeAllTap: () async {
                final InAppReview inAppReview = InAppReview.instance;
                if (await inAppReview.isAvailable()) {
                  inAppReview.requestReview();
                }
              },
              description: "If you like us, Rate us"),
          _listTileIconView(
              label: "Share App",
              // leadingIcon: iconsDelete,
              onSeeAllTap: () async {
                try {
                  final String appLink =
                      'https://play.google.com/store/apps/details?id=com.';
                  final String message = 'Check out this app: $appLink';
                  await FlutterShare.share(
                      title: 'Share App', linkUrl: appLink, text: message);
                } catch (e) {
                  debugPrint("e$e");
                }
              },
              description: "If you like us, let other's know"),

          _listTileIconView(
            label: "Server URL",
             description: "${imageBaseUrl}",
          ),
            GestureDetector(
                onTap: (){
                  Get.to(CrashReportScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(text: "Check Crash Report", textStyle: textStyleBody1().copyWith(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    )).paddingAll(margin_20),
                    AssetImageWidget(iconsBuy,imageHeight: height_25,imageWidth: width_25,).paddingOnly(right: margin_10)
                  ],
                ),
              ),Divider(color: Colors.grey,)

        ],
      ).marginOnly(top: margin_20);



      Widget _listTileIconView(
          {label, leadingIcon, onSeeAllTap, icon, description}) =>
      InkWell(
        onTap: onSeeAllTap ?? () {},
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    (leadingIcon != null)
                        ? AssetImageWidget(
                            leadingIcon,
                            imageFitType: BoxFit.cover,
                            imageHeight: height_25,
                          ).marginOnly(right: margin_12)
                        : SizedBox(),
                    (icon != null)
                        ? Icon(
                            icon,
                            color: Colors.white,
                            size: height_25,
                          ).marginOnly(right: margin_12)
                        : SizedBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: label,
                          textStyle: textStyleBody1().copyWith(
                            color: Colors.white,
                            fontSize: font_15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: description ?? "",
                          textStyle: textStyleBody1().copyWith(
                            color: Colors.white,
                            fontSize: font_15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(vertical: margin_16, horizontal: margin_15),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      );
}
