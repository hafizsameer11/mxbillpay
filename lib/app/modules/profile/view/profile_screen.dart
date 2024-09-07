import 'package:EarlybazeWallet/app/core/utils/replace_http_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/widget/custom_title_bar.dart';
import '../../../export.dart';
import '../../authentication/views/profile_setup_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      backgroundColor: appBlackColor,
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: Get.height,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xFF04C304), Color(0xFFB8F89B)],
                  begin: const Alignment(0.6, -1),
                  end: const Alignment(0.6, 0.95),
                )),
                height: height_195,
                width: Get.width,
              )),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: GetBuilder(
                    init: controller,
                    builder: (controller) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: margin_10, top: margin_10),
                          child: CustomAppBar(
                            bgColor: Colors.transparent,
                            leadingWidget: Container(
                              height: 35,
                              width: 35,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  MainScreenController mainController =
                                      Get.find<MainScreenController>();
                                  mainController.bottomNavIndex = 0;
                                  mainController.update();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18,
                                  color: appGreenColor,
                                ),
                                style: ButtonStyle(
                                  elevation: WidgetStateProperty.all(0),
                                  shape:
                                      WidgetStateProperty.all(CircleBorder()),
                                  backgroundColor:
                                      WidgetStateProperty.all(appBlackColor), //
                                  padding: WidgetStateProperty.all(
                                      EdgeInsets.all(8)), // <-- Button color
                                ),
                              ),
                            ),
                            actionIconWidget: false,
                            actionWidget: Container(
                              height: 35,
                              width: 35,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: ElevatedButton(
                                onPressed: () async {
                                  var result =
                                      await Get.to(ProfileSetupScreen());
                                  if (result != null) {
                                    controller.getProfileData();
                                  }
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: appGreenColor,
                                ),
                                style: ButtonStyle(
                                  elevation: WidgetStateProperty.all(0),
                                  shape:
                                      WidgetStateProperty.all(CircleBorder()),
                                  backgroundColor:
                                      WidgetStateProperty.all(appBlackColor), //
                                  padding: WidgetStateProperty.all(
                                      EdgeInsets.all(8)), // <-- Button color
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height_20,
                        ),
                        CustomTitleBar(
                                appBarTitleText: strProfile,
                                titleTextColor: Colors.black)
                            .marginSymmetric(horizontal: margin_20),
                        SizedBox(
                          height: height_25,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(height_100),
                            child: NetworkImageWidget(
                              imageHeight: height_100,
                              imageUrl:
                                  controller.loginDataModel!.profilePic ?? "",
                              imageWidth: height_100,
                              placeHolder: iconsProfileSetup,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height_10,
                        ),
                        /*   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AssetImageWidget(
                              iconsSuccess,
                              imageWidth: width_18,
                            ).marginOnly(left: margin_10, right: margin_5),
                            Text(
                              "Verified",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ).marginOnly(right: 10),*/
                        SizedBox(
                          height: height_5,
                        ),
                        profileDetailWidget(
                            strFirstName,
                            controller.loginDataModel != null
                                ? controller.loginDataModel!.firstName ?? "--"
                                : "--"),
                        profileDetailWidget(
                            strLastName,
                            controller.loginDataModel != null
                                ? controller.loginDataModel!.lastName ?? "--"
                                : "--"),
                        profileDetailWidget(
                            strEmailAddress,
                            controller.loginDataModel != null
                                ? controller.loginDataModel!.email ?? "--"
                                : "--"),
                        profileDetailWidget(
                            strPhoneNumber,
                            controller.loginDataModel != null
                                ? controller.loginDataModel!.mobileNo ?? "--"
                                : "--"),
                        profileDetailWidget(
                            strDateOfBirth,
                            controller.loginDataModel != null
                                ? controller.loginDataModel!.dob ?? "--"
                                : "--"),
                        profileDetailWidget(
                            strCity,
                            controller.loginDataModel != null
                                ? controller.loginDataModel!.city ?? "--"
                                : "--"),
                        profileDetailWidget(
                            strState,
                            controller.loginDataModel != null
                                ? controller.loginDataModel!.state ?? "--"
                                : "--"),
                        profileDetailWidget(
                            strCountry,
                            controller.loginDataModel != null
                                ? controller.loginDataModel!.country ?? "--"
                                : "--"),
                        TextView(
                                text: strIdDProof,
                                textAlign: TextAlign.start,
                                textStyle: textStyleBody2().copyWith(
                                  color: appGreenColor,
                                  fontSize: font_12,
                                ))
                            .marginOnly(
                                left: margin_8, right: margin_8, top: margin_10)
                            .marginOnly(
                              left: margin_13,
                              right: margin_13,
                            ),
                        Container(
                                child:
                                    controller.loginDataModel!.idPhoto != null
                                        ? InkWell(
                                            onTap: () {
                                              openIdImageView(controller
                                                  .loginDataModel!.idPhoto);
                                            },
                                            child: NetworkImageWidget(
                                              imageHeight: height_70,
                                              imageUrl: controller
                                                      .loginDataModel!
                                                      .idPhoto ??
                                                  "",
                                              imageWidth: height_70,
                                              placeHolder: iconsProfileSetup,
                                            ),
                                          )
                                        : SizedBox())
                            .paddingSymmetric(horizontal: 25, vertical: 10)
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  profileDetailWidget(title, subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextView(
              text: title ?? "",
              textAlign: TextAlign.start,
              textStyle: textStyleBody2().copyWith(
                color: Colors.grey.shade500,
                fontSize: Get.width * .036,
              )),
        ),
        // SizedBox(width: width_20,),

        TextView(
            text: ":",
            textStyle: textStyleBody2().copyWith(
              color: Colors.grey.shade500,
              fontSize: Get.width * .036,
            )),
        SizedBox(
          width: width_40,
        ),
        Expanded(
          child: TextView(
              text: subTitle ?? "",
              textAlign: TextAlign.start,
              textStyle: textStyleBody2()
                  .copyWith(fontSize: font_12, color: Colors.white),
              maxLine: 2),
        ),
      ],
    )
        .marginOnly(left: margin_8, right: margin_8, top: margin_10)
        .marginOnly(left: margin_13, right: margin_13, top: margin_10);
  }

  openIdImageView(String url) {
    Get.dialog(Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
              size: height_30,
            )),
        Padding(
          padding: EdgeInsets.all(margin_10),
          child: CachedNetworkImage(imageUrl: url.replaceHttp()),
        ),
      ],
    ));
  }
}
