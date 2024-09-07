import 'package:EarlybazeWallet/app/modules/notification/push_notification_manager.dart';

import '../../../data/models/response_model/sign_up_response_model.dart';
import '../../../export.dart';
import '../../chat/Model/chat_list_response_model.dart';

class SplashController extends GetxController {
  bool isFirstTime = false;
  var timer;
  int index = 0;
  LoginResponseModel loginResponseModel = LoginResponseModel();
  final PreferenceManger _preferenceManger = Get.find<PreferenceManger>();
  LoginDataModel loginDataModel = LoginDataModel();

  @override
  void onInit() {
    _navigateToNextPage();
    super.onInit();
  }

  getProfileData() async {
    _preferenceManger.getSavedLoginData().then((value) {
      if (value != null) {
        loginDataModel = value;
        hitCheckAPI();
        update();
      } else {
        isFirstTime = Get.find<PreferenceManger>().getStatusFirstLaunch();
        print(isFirstTime);
        isFirstTime == true
            ? Get.offAllNamed(AppRoutes.loginScreen)
            : Get.offAllNamed(AppRoutes.onBoarding);
      }
    }, onError: ((e) {}));
  }

  _navigateToNextPage() {
    timer = Timer(const Duration(seconds: 2, milliseconds: 800), () async {
      getProfileData();
    });
  }

  void hitCheckAPI() {
    APIRepository().checkApiCall().then((value) async {
      if (value != null) {
        loginResponseModel = value;
        if (loginResponseModel.data!.isProfileSetup == "false" ||
            loginResponseModel.data!.isProfileSetup!.isEmpty) {
          Get.offAllNamed(AppRoutes.loginScreen);
        } else {
          if (PushNotificationsManager().comingFromNotification == true) {
            if (PushNotificationsManager().notificationMap.isNotEmpty) {
              Map data = PushNotificationsManager().notificationMap;
              if (data["notification_type"] == "3") {
                MainScreenController mainScreenController =
                    Get.put(MainScreenController());
                mainScreenController.updateBottomNavIndex(2);
                Get.offAllNamed(AppRoutes.mainScreen);
              } else if (data["notification_type"].toString() == "1") {
                ReceiverData receiverData = ReceiverData(
                    id: data["object_id"],
                    service: Service(
                        id: data["service_id"], title: data["service_name"]),
                    receiver: Receiver(id: data["receiver_id"]));
                Get.offAllNamed(AppRoutes.MessagingScreen, arguments: {
                  "isFromChat": false,
                  "receiverDetails": receiverData
                });
              } else if (data["notification_type"].toString() == "2") {
                ReceiverData receiverData = ReceiverData(
                    id: data["object_id"],
                    service: Service(
                        id: data["service_id"], title: data["service_name"]),
                    receiver: Receiver(id: data["receiver_id"]));
                Get.offAllNamed(AppRoutes.MessagingScreen, arguments: {
                  "isFromChat": false,
                  "receiverDetails": receiverData
                });
              }
              timer.cancel();
            }
          } else {
            print("Timer Not Cancelled");
            Get.offAllNamed(AppRoutes.mainScreen);
          }
        }
        update();
      }
    }).onError((error, stackTrace) {
      isFirstTime = Get.find<PreferenceManger>().getStatusFirstLaunch();
      isFirstTime == true
          ? Get.offAllNamed(AppRoutes.loginScreen)
          : Get.offAllNamed(AppRoutes.onBoarding);
      update();
    });
  }
}
