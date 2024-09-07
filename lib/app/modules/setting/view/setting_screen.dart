import 'package:EarlybazeWallet/app/core/widget/custom_title_bar.dart';
import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/setting/controller/setting_controller.dart';

import '../../AboutUs/view/about_screen.dart';
import '../widget/setting_widget.dart';
import 'faq_screen.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  late SettingController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (con) {
          controller = con;
          return Scaffold(
            backgroundColor: appBlackColor,
            body: _bodyWidget(),
          );
        });
  }

  _bodyWidget() {
    return Column(
      children: [
        CustomTitleBar(
          appBarTitleText: strSetting,
        ).marginOnly(top: margin_15),
        SettingWidget(
          titleImage: iconsNotify,
          title: strNotification,
          toggle: true,
          isToggle: controller.isValue,
          onChanged: (value) {
            if (controller.loginResponseModel.data?.notification == true) {
              controller.hitNotificationToggleAPiCall(notificationStatus: 0);
            } else {
              controller.hitNotificationToggleAPiCall(notificationStatus: 1);
            }
          },
        ),
        SettingWidget(
          titleImage: iconsPassword,
          title: "Change Password",
          onTap: () {
            Get.toNamed(AppRoutes.changePasswordScreen, arguments: "Setting");
          },
        ),
        SettingWidget(
          titleImage: iconsFaq,
          title: "FAQ's",
          onTap: () {
            Get.to(FaqScreen());
          },
        ),
        SettingWidget(
          titleImage: iconsTerms,
          title: "Terms & Conditions",
          onTap: () {
            Get.toNamed(AppRoutes.staticPage, arguments: {"static": 1});
          },
        ),
        SettingWidget(
          titleImage: iconsTerms,
          title: "Privacy Policy",
          onTap: () {
            Get.toNamed(AppRoutes.staticPage, arguments: {"static": 2});
          },
        ),
        SettingWidget(
          titleImage: iconsTerms,
          title: "About Us",
          onTap: () {
            Get.to(AboutUsScreen());
          },
        ),
        SettingWidget(
          titleImage: iconsDelete,
          title: "Delete Account",
          onTap: () {
            Get.bottomSheet(LogOutDialogWidget(
                title: "Delete Account",
                description: "Are you sure want to delete your account?",
                onYesPressed: () async {
                  controller.hitDeleteAccountApiCall();
                }));
          },
        ),
        SettingWidget(
          titleImage: iconsLogout,
          title: "Logout",
          onTap: () {
            Get.bottomSheet(LogOutDialogWidget(
                title: strLogout,
                description: strLogoutDialog,
                onYesPressed: () async {
                  controller.hitLogoutApiCall();
                  PreferenceManger().clearLoginData();
                }));
          },
        ),
      ],
    ).marginOnly(
      left: margin_15,
    );
  }
}
