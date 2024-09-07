import 'package:EarlybazeWallet/app/core/utils/remove_otp_verification_code.dart';
import 'package:EarlybazeWallet/app/data/models/response_model/sign_up_response_model.dart';
import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/authentication/models/auth_request_model.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../data/models/response_model/otp_verification_response_model.dart';
import '../views/profile_setup_screen.dart';

class OtpVerifyController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  dynamic token;

  // dynamic email;
  final otpPinFieldController = GlobalKey<OtpPinFieldState>();
  OtpVerificationResponseModel otpVerificationResponseModel =
      OtpVerificationResponseModel();
  LoginResponseModel loginResponseModel = LoginResponseModel();
  String? otp;
  String type = "";
  bool isFromOtp = false;

  getArgument() {
    debugPrint('print----------->>>>>}');
    // if (Get.arguments["token"] != null) {
    //   token = Get.arguments["token"] ?? "test";
    //   if (Get.arguments["type"] != null) {
    //     type = Get.arguments["type"];
    //   }
    //   debugPrint("Token::::::: $token");
    // } else {
    //   token = "test";
    // }
    if (Get.arguments != null) {
      if (Get.arguments["email"] != null) {
        debugPrint("email::::::: ${Get.arguments["email"]}");
      } else {
        debugPrint("email::::::: else---------------->>> ");
      }
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments.containsKey("isFromForgot")) {
        isFromOtp = Get.arguments["isFromForgot"];
      }
    }
    super.onInit();
  }

  hitOtpVerifyApi() {
    final requestModel = RequestModal.otpVerifyRequestMOdel(otp: otp);

    APIRepository.accountVerificationApiCall(dataBody: requestModel)
        .then((value) {
      if (value != null) {
        otpVerificationResponseModel = value;
        saveDataToLocalStorage(otpVerificationResponseModel);
        if (isFromOtp == false) {
          Get.offAll(ProfileSetupScreen(), arguments: "OTPScreen");
        } else {
          Get.toNamed(AppRoutes.changePasswordScreen);
        }
        // showInSnackBar(message: otpVerificationResponseModel.message ?? "");
        showInSnackBar(
            message: otpVerificationResponseModel.message
                    ?.removeVerificationCode() ??
                '');

        // showInSnackBar( message: 'An OTP has been sent to your registered email.');
      }
    }).onError((error, stackTrace) {
      debugPrint("stack Trace :::::: $stackTrace");
      showInSnackBar(message: error.toString());
    });
  }

  saveDataToLocalStorage(OtpVerificationResponseModel? loginResponseModel) {
    PreferenceManger().saveRegisterData(loginResponseModel?.data);
    PreferenceManger().saveAuthToken(loginResponseModel?.data?.token);
  }

  forgetPasswordOtpVerifyApiCall() {
    final requestModel = RequestModal.otpVerifyRequestMOdel(otp: otp);

    APIRepository.otpVerificationApiCall(dataBody: requestModel).then((value) {
      if (value != null) {
        otpVerificationResponseModel = value;
        PreferenceManger()
            .saveAuthToken(otpVerificationResponseModel.data?.token);
        Get.offNamed(AppRoutes.changePasswordScreen);
        showInSnackBar(
            message: otpVerificationResponseModel.message
                    ?.removeVerificationCode() ??
                '');
        // showInSnackBar( message: 'An OTP has been sent to your registered email.');
      }
    }).onError((error, stackTrace) {
      debugPrint("stack Trace :::::: $stackTrace");
      showInSnackBar(message: error.toString());
    });
  }

  hitReSendOtpApiCall() {
    var email = PreferenceManger().getEmail();
    otpPinFieldController.currentState?.clearOtp();
    final requestModel = AuthRequestModel.resendOtpRequestModel(
      email: email,
    );
    APIRepository.reSendOtpApiCall(dataBody: requestModel).then((value) {
      if (value != null) {
        otpVerificationResponseModel = value;
        PreferenceManger()
            .saveAuthToken(otpVerificationResponseModel.data?.token);
        // showInSnackBar(message: otpVerificationResponseModel.message!);
        showInSnackBar(
            message: otpVerificationResponseModel.message
                    ?.removeVerificationCode() ??
                '');
      }
    }).onError((error, stackTrace) {
      debugPrint("stack Trace :::::: $stackTrace");
      showInSnackBar(message: error.toString());
    });
    update();
  }

  @override
  void onReady() {
    // getArgument();
    super.onReady();
  }
}
