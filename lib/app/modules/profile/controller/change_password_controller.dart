import '../../../export.dart';

class ChangePasswordController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordTextController =
      TextEditingController();
  final TextEditingController newPasswordTextController =
      TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  ErrorMessageResponseModel errorMessageResponseModel =
      ErrorMessageResponseModel();
  bool isObscure = true, isRemember = false, isPass = true, isConPass = true;

  @override
  void onInit() {
    super.onInit();
  }

  validateData() {
    if (formGlobalKey.currentState!.validate()) {
      changePasswordApi();
    }
  }

  /*============================================================password hide unhide========================================================*/

  passwordHideUnhide() {
    isPass = !isPass;
    update();
  }

  /*============================================================password hide unhide========================================================*/

  conPasswordHideUnhide() {
    isConPass = !isConPass;
    update();
  }

  changePasswordApi() {
    var requestModel = AuthRequestModel.changePasswordRequestModel(
      password: newPasswordTextController.text.trim(),
      confirmPassword: confirmPasswordTextController.text.trim(),
    );
    APIRepository()
        .changePasswordApiCall(dataBody: requestModel)
        .then((value) async {
      if (value != null) {
        MessageResponseModel errorMessageResponseModel = value;
        showInSnackBar(message: errorMessageResponseModel.message!);
        PreferenceManger().clearLoginData();
        Get.offAllNamed(AppRoutes.loginScreen);
        Get.put<LoginController>(LoginController());
      }
    }).onError((error, stackTrace) {
      showInSnackBar(message: error.toString());
    });
  }
}
