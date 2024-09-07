import 'package:EarlybazeWallet/app/modules/chat/view/chat_screen.dart';
import 'package:EarlybazeWallet/app/modules/notification_module/view/notification_screen.dart';

import '../../../export.dart';
import '../../setting/view/setting_screen.dart';

class MainScreenController extends GetxController {
  int bottomNavIndex = 0;
  final PreferenceManger _preferenceManger = Get.put(PreferenceManger());
  LoginDataModel loginDataModel = LoginDataModel();
  List<MainBottomModel> homeList = [
    MainBottomModel(title: strHomeB, routeName: HomeScreenPage()),
    MainBottomModel(title: strProfileB, routeName: ChatScreen()),
    MainBottomModel(title: strProfileB, routeName: NotificationScreen()),
    MainBottomModel(title: strProfileB, routeName: ProfileScreen()),
    MainBottomModel(title: strProfileB, routeName: SettingScreen()),
  ];

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  getArguments() {
    if (Get.arguments != null) {
      updateBottomNavIndex(Get.arguments['bottom']);
    }
  }

  updateBottomNavIndex(int index) {
    bottomNavIndex = index;
    switch (index) {
      case 0:
        Get.find<HomeScreenController>();
        Get.find<HomeScreenController>().getServiceList();
        break;
      case 1:
        update();
        break;
    }
    update();
  }

  getProfileData() async {
    _preferenceManger.getSavedLoginData().then((value) {
      if (value != null) {
        loginDataModel = value;
        update();
      }
    });
  }

  @override
  void onReady() {
    getProfileData();
    super.onReady();
  }
}
