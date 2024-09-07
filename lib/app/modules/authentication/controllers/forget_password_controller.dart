import 'package:EarlybazeWallet/app/data/models/response_model/sign_up_response_model.dart';
import 'package:EarlybazeWallet/app/core/utils/remove_otp_verification_code.dart';

import '../../../export.dart';
import '../models/auth_request_model.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController emailAddressController;
  late FocusNode emailAddressFocusNode;
  final formGlobalKey = GlobalKey<FormState>();
  LoginResponseModel errorMessageResponseModel = LoginResponseModel();

  @override
  void onInit() {
    initializeController();
    super.onInit();
  }

  initializeController() {
    emailAddressController = TextEditingController();
    emailAddressFocusNode = FocusNode();
  }

  void validate() {
    if (formGlobalKey.currentState!.validate()) {
      hitForgetPasswordApiCall();
    }
  }

  @override
  void dispose() {
    emailAddressFocusNode.dispose();
    emailAddressController.dispose();
    super.dispose();
  }

  hitForgetPasswordApiCall() {
    var request = RequestModal.forgetPasswordRequestModal(
        emailAddress: emailAddressController.text);

    APIRepository.forgetPasswordApiCall(dataBody: request).then((value) {
      if (value != null) {
        LoginResponseModel loginResponseModel = value;
        PreferenceManger().saveAuthToken(loginResponseModel.data?.token);
        customLoader.hide();
        // showInSnackBar(message: loginResponseModel.message!);
        showInSnackBar(
            message:
                loginResponseModel.message?.removeVerificationCode() ?? '');

        Get.toNamed(AppRoutes.otpVerificationScreen, arguments: {
          "token": loginResponseModel.data?.token,
          "type": "forgetPassword",
          'email': emailAddressController.text.trim(),
          "isFromForgot": true
        });
      }
    }).onError((error, stackTrace) {
      customLoader.hide();
      showInSnackBar(message: error.toString());
      print(stackTrace);
    });
  }
}
