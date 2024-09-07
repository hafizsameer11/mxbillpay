import 'package:flutter/foundation.dart';

import '../../../data/models/response_model/sign_up_response_model.dart';
import '../../../export.dart';
import '../models/auth_request_model.dart';

class SignUpController extends GetxController {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? phoneNumberController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  LoginResponseModel signUpResponseModel = LoginResponseModel();
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  FocusNode? firstNameFocusNode;
  FocusNode? lastNameFocusNode;
  FocusNode? phoneNUmberFocusNode;
  FocusNode? emailFocusNode;
  FocusNode? passwordFocusNode;
  FocusNode? confirmPasswordFocusNode;
  bool isObscure = true, isRemember = false, isPass = false, isConPass = false;

  @override
  void onInit() {
    initialiseController();
    if (kDebugMode) {
      firstNameController?.text = 'demo';
      lastNameController?.text = 'test';
      emailController?.text = 'uuu@toxsl.in';
      passwordController?.text = 'Admin@123';
      confirmPasswordController?.text = 'Admin@123';
    }
    super.onInit();
  }

  initialiseController() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    phoneNUmberFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

    firstNameFocusNode?.addListener(() {
      update();
    });

    lastNameFocusNode?.addListener(() {
      update();
    });

    phoneNUmberFocusNode?.addListener(() {
      update();
    });

    emailFocusNode?.addListener(() {
      update();
    });

    passwordFocusNode?.addListener(() {
      update();
    });

    confirmPasswordFocusNode?.addListener(() {
      update();
    });

    update();
  }

  void validateData() {
    if (formGlobalKey.currentState!.validate()) {
      hitSignUpApi();
    }
  }

  /*=====================================================remember me=======================================================*/

  rememberMeFunction() {
    isRemember = !isRemember;
    update();
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

  hitSignUpApi() {
    debugPrint("Check First Name::::: ${firstNameController?.text}");
    final requestModal = RequestModal.signInRequestModal(
        firstName: firstNameController?.text,
        lastName: lastNameController?.text,
        email: emailController?.text,
        password: passwordController?.text,
        conPassword: confirmPasswordController?.text,
        deviceType: APIRepository.deviceType,
        deviceName: APIRepository.deviceName,
        deviceToken: deviceToken);

    APIRepository.signUpApiCall(dataBody: requestModal).then((value) {
      if (value != null) {
        signUpResponseModel = value;
        PreferenceManger().saveAuthToken(signUpResponseModel.data?.token.toString());
        PreferenceManger().saveEmail(emailController?.text.trim());
        var token = PreferenceManger().getAuthToken();
        showInSnackBar(message: signUpResponseModel.message.toString());
        firstNameController?.text = "";
        lastNameController?.text = "";
        emailController?.text = "";
        passwordController?.text = "";
        confirmPasswordController?.text = "";
        isRemember = false;
        formGlobalKey = GlobalKey<FormState>();

        update();
        Get.toNamed(AppRoutes.otpVerificationScreen, arguments: {"token": signUpResponseModel.data?.token, "email": emailController?.text.trim()});
      }
    }).onError((error, stackTrace) {
      debugPrint("Stack trace :: $stackTrace :==== $error");
      showInSnackBar(message: error.toString());
    });
  }
}
