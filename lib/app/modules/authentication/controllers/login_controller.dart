import 'dart:convert';

import 'package:EarlybazeWallet/app/data/models/remember_me_model.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/response_model/sign_up_response_model.dart';
import '../../../export.dart';
import '../models/auth_request_model.dart';
import '../views/profile_setup_screen.dart';

class LoginController extends GetxController {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  bool viewPassword = false;
  FocusNode? emailFocusNode;
  FocusNode? passwordFocusNode;
  final formGlobalKey = GlobalKey<FormState>();

  LoginResponseModel signUpResponseModel = LoginResponseModel();
  var deviceName, deviceType, deviceID, deviceVersion, userType;
  bool isObscure = true, isRemember = false, isPass = false;

  @override
  void onInit() {
    getDeviceData();
    intializeController();

    super.onInit();
  }

  /*============================================================password hide unhide========================================================*/

  passwordHideUnhide() {
    isPass = !isPass;
    update();
  }

  /*=====================================================remember me=======================================================*/

  rememberMeFunction() {
    isRemember = !isRemember;
    update();
  }

  intializeController() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    if (kDebugMode) {
      emailController!.text = "rocky@toxsl.in";
      passwordController!.text = "Test@123";
    }

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    getsaveRemeberData();
    emailFocusNode?.addListener(() {
      update();
    });
    passwordFocusNode?.addListener(() {
      update();
    });
  }

  @override
  void dispose() {
    debugPrint('disposed');
    super.dispose();
  }

  showOrHidePasswordVisibility() {
    viewPassword = !viewPassword;
    update();
  }

  validate() {
    if (formGlobalKey.currentState!.validate()) {
      hitLoginApi();
    }
  }

  hitLoginApi() async {
    var requestModal = RequestModal.loginRequestModel(
      userName: emailController?.text,
      password: passwordController?.text,
      deviceName: APIRepository.deviceName,
      deviceType: APIRepository.deviceType,
      // deviceToken: APIRepository.deviceID,
      deviceToken: deviceToken,
    );

    /* ============================================================================ login API call =================================================================*/

    APIRepository.loginApiCall(dataBody: requestModal).then((value) {
      if (value != null) {
        signUpResponseModel = value!;
        showInSnackBar(message: signUpResponseModel.message!);
        saveDataToLocalStorage(signUpResponseModel);
        if (isRemember) {
          preferenceManger.saveRemeberMeData(RememberMeModel(
              phoneNumber: emailController!.text.toString().trim(), password: passwordController!.text.toString().trim(), roleId: signUpResponseModel.data!.roleId!));
        } else {
          preferenceManger.clearRememberMeData();
        }
        if (signUpResponseModel.data!.isProfileSetup == "true") {
          Get.offAllNamed(AppRoutes.mainScreen);
        } else {
          Get.offAll(ProfileSetupScreen(), arguments: "OTPScreen");
        }
      }
    }).onError((error, stackTrace) {
      customLoader.hide();

      showInSnackBar(message: error.toString());
      debugPrint("error.toString()  $stackTrace");
    });
  }

  Future getsaveRemeberData() async {
    Map<String, dynamic>? userMap;
    final userStr = await localStorage.read(PreferenceManger.rememberMe);
    if (userStr != null) userMap = jsonDecode(userStr) as Map<String, dynamic>;
    if (userMap != null) {
      RememberMeModel user = RememberMeModel.fromJson(userMap);
      emailController?.text = user.phoneNumber!;
      passwordController?.text = user.password!;
      isRemember = true;
      update();
      return user;
    }
    return null;
  }

  saveDataToLocalStorage(LoginResponseModel? loginResponseModel) {
    preferenceManger.saveRegisterData(loginResponseModel?.data);
    preferenceManger.saveAuthToken(loginResponseModel?.data?.token);
    String toen = preferenceManger.getAuthToken();
    print(toen);
  }

  getDeviceData() async {
    DeviceInfoPlugin info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await info.androidInfo;
      deviceName = androidDeviceInfo.model;
      deviceID = androidDeviceInfo.id;
      deviceVersion = androidDeviceInfo.version.release;
      deviceType = 1;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await info.iosInfo;
      deviceName = iosDeviceInfo.model;
      deviceID = iosDeviceInfo.identifierForVendor;
      deviceVersion = iosDeviceInfo.systemVersion;
      deviceType = 2;
    }
    update();
  }
/* getRememberMeData() {
      preferenceManger.getsaveRemeberData().then((value) {
        if (value != null) {
          _rememberMeModel = value;
          emailTextController.text = _rememberMeModel?.email ?? "";
          mobileNumberTextController.text = _rememberMeModel?.mobile ?? "";
          passwordTextController.text = _rememberMeModel?.password ?? "";
          isRememberMe.value = true;
          update();
        } else {
          isRememberMe.value = false;
        }
        update();
      });
    }*/
}
