import '../../../export.dart';

class ProfileController extends GetxController {
  ErrorMessageResponseModel errorMessageResponseModel =
      ErrorMessageResponseModel();

  LoginDataModel? loginDataModel;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getProfileData();
  }

  void getProfileData() {
    preferenceManger.getSavedLoginData().then((value) {
      loginDataModel = value;
      print(loginDataModel!.toJson());
      update();
      update();
    });
  }

  hitLogoutApiCall() {
    customLoader.show(Get.overlayContext);
    APIRepository.logoutApiCall().then((value) async {
      if (value != null) {
        customLoader.hide();
        errorMessageResponseModel = value;
        Get.find<PreferenceManger>().clearLoginData();
        Get.offAllNamed(AppRoutes.loginScreen);
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      debugPrint(error.toString());
    });
  }
}
