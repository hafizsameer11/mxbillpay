import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/authentication/models/auth_request_model.dart';

import '../../../data/models/response_model/notification_toggle_response_model.dart';
import '../../../data/models/response_model/sign_up_response_model.dart';

class SettingController extends GetxController {
  bool? isValue;
  LoginResponseModel loginResponseModel = LoginResponseModel();

  ErrorMessageResponseModel errorMessageResponseModel =
      ErrorMessageResponseModel();
  @override
  void onInit() {
    hitCheckAPI();
    super.onInit();
  }

  hitDeleteAccountApiCall() {
    customLoader.show(Get.overlayContext);
    APIRepository().deleteAccountApiCall().then((value) async {
      if (value != null) {
        customLoader.hide();
        MessageResponseModel messageResponseModel = value;
        showInSnackBar(message: messageResponseModel.message.toString());
        PreferenceManger().clearLoginData();
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      showInSnackBar(message: error.toString());
    });
  }

  hitNotificationToggleAPiCall({notificationStatus}) {
    var requestModel =
        RequestModal.notificationToggle(notificationStatus: notificationStatus);

    APIRepository.notificationToggleCall(dataBody: requestModel)
        .then((value) async {
      if (value != null) {
        NotificationToggleResponseModel notificationModel = value;
        isValue = notificationModel.data!.notification!;
        hitCheckAPI();
        update();
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
    });
  }

  void hitCheckAPI() {
    APIRepository().checkApiCall().then((value) async {
      if (value != null) {
        loginResponseModel = value;
        isValue = loginResponseModel.data!.notification!;
        update();
      }
    }).onError((error, stackTrace) {});
  }

  hitLogoutApiCall() {
    customLoader.show(Get.overlayContext);
    APIRepository.logoutApiCall().then((value) async {
      if (value != null) {
        customLoader.hide();
        Get.offAllNamed(AppRoutes.loginScreen);
        errorMessageResponseModel = value;
        showInSnackBar(message: errorMessageResponseModel.message.toString());
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      Get.offAllNamed(AppRoutes.loginScreen);
      debugPrint(error.toString());
    });
  }
}
