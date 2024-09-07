import 'package:EarlybazeWallet/app/core/widget/custom_title_bar.dart';
import '../../../../constants/colors.dart';
import '../../../export.dart';

class SignUpScreen extends StatelessWidget {
  late SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (con) {
          controller = con;
          return Scaffold(
            backgroundColor: appBlackColor,
            appBar: _customizedAppBar(),
            body: _body(),
          );
        });
  }

  _customizedAppBar() {
    return CustomAppBar(
      leadingWidth: width_30,
      titleInCentre: false,
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleBar(
            appBarTitleText: strWelcomeTo,
            appBarSubtitleText: strEarlybazeWallet,
          ).marginOnly(left: margin_20),
          TextView(text: "Create your account", textStyle: textStyleBody3().copyWith(color: textColor)).marginOnly(top: margin_12, left: margin_20, bottom: margin_12),
          _signUpBody(),
          _signUpButton(),
          SizedBox(
            height: height_8,
          ),
          _termsAndConditions(),
          SizedBox(
            height: height_30,
          ),
          existingUser(),
          SizedBox(
            height: height_20,
          ),
        ],
      ),
    );
  }

  _signUpBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Form(
            key: controller.formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  filledColor: controller.firstNameFocusNode!.hasFocus ? textFieldFocusColor : colorWhiteM,
                  hint: firstName,
                  focusNode: controller.firstNameFocusNode,
                  textController: controller.firstNameController,
                  textViewText: firstName,
                  inputType: TextInputType.text,
                  validate: (data) => Validator.firstName(data),
                  hintStyle: textStyleLabel2().copyWith(
                    fontFamily: FontFamily.barnaulGrotesk,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(left: margin_20, right: margin_20, bottom: margin_5, top: margin_12),
                TextFieldWidget(
                  filledColor: controller.lastNameFocusNode!.hasFocus ? textFieldFocusColor : colorWhiteM,
                  textController: controller.lastNameController,
                  hint: lastName,
                  focusNode: controller.lastNameFocusNode,
                  textViewText: lastName,
                  inputType: TextInputType.text,
                  validate: (data) => Validator.lastName(data),
                  hintStyle: textStyleLabel2().copyWith(
                    fontFamily: FontFamily.barnaulGrotesk,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(left: margin_20, right: margin_20, bottom: margin_5, top: margin_12),
                TextFieldWidget(
                  filledColor: controller.emailFocusNode!.hasFocus ? textFieldFocusColor : colorWhiteM,
                  textController: controller.emailController,
                  hint: emailAddress,
                  textViewText: emailAddress,
                  focusNode: controller.emailFocusNode,
                  validate: (data) => Validator.validateEmail(data),
                  inputType: TextInputType.text,
                  hintStyle: textStyleLabel2().copyWith(
                    fontFamily: FontFamily.barnaulGrotesk,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(left: margin_20, right: margin_20, bottom: margin_5, top: margin_12),
                TextFieldWidget(
                  filledColor: controller.passwordFocusNode!.hasFocus ? textFieldFocusColor : colorWhiteM,
                  obscureText: !controller.isPass,
                  textController: controller.passwordController,
                  hint: password,
                  textViewText: password,
                  focusNode: controller.passwordFocusNode,
                  inputFormatter: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  suffixIcon: GetInkWell(
                    onTap: () {
                      controller.passwordHideUnhide();
                    },
                    child: AssetImageWidget(controller.isPass == true ? iconsShow : iconsIcHide, imageHeight: height_3, imageWidth: width_3).marginAll(margin_13),
                  ),
                  validate: (data) => Validator.validatePassword(data),
                  inputType: TextInputType.text,
                  hintStyle: textStyleLabel2().copyWith(
                    fontFamily: FontFamily.barnaulGrotesk,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(left: margin_20, right: margin_20, bottom: margin_5, top: margin_12),
                TextFieldWidget(
                  filledColor: controller.confirmPasswordFocusNode!.hasFocus ? textFieldFocusColor : colorWhiteM,
                  obscureText: !controller.isConPass,
                  textController: controller.confirmPasswordController,
                  suffixIcon: GetInkWell(
                    onTap: () {
                      controller.conPasswordHideUnhide();
                    },
                    child: AssetImageWidget(controller.isConPass == true ? iconsShow : iconsIcHide, imageHeight: height_3, imageWidth: width_3).marginAll(margin_13),
                  ),
                  hint: confirmPassword,
                  inputFormatter: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  focusNode: controller.confirmPasswordFocusNode,
                  textViewText: confirmPassword,
                  validate: (data) => Validator.validateConfirmPasswordMatch(value: data, password: controller.passwordController?.text.trim()),
                  inputType: TextInputType.text,
                  hintStyle: textStyleLabel2().copyWith(
                    fontFamily: FontFamily.barnaulGrotesk,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(left: margin_20, right: margin_20, bottom: margin_5, top: margin_12),
              ],
            )),
      ],
    );
  }

  _signUpButton() {
    return GradientButton(
      onPressed: () {
        if (controller.formGlobalKey.currentState!.validate()) {
          if (controller.isRemember == false) {
            showInSnackBar(message: "Please accept Term of services & Privacy Policy.");
          } else {
            controller.hitSignUpApi();
            // Get.toNamed(AppRoutes.profileSetupScreen);
          }
        }
      },
      buttonText: "Sign Up",
      raduis: radius_30,
    ).marginOnly(left: margin_20, right: margin_20, top: margin_20);
  }

  _termsAndConditions() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: GetInkWell(
                  onTap: () {
                    controller.rememberMeFunction();
                  },
                  child: AssetImageWidget(
                    controller.isRemember ? iconsCheck : iconsUnCheck,
                    imageHeight: height_15,
                  ).marginOnly(right: margin_6)),
            ),
            TextView(text: strIAgreeToAll, textStyle: textStyleBody3().copyWith(color: textColor)),
            GetInkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.staticPage, arguments: {"static": 1});
                },
                child: TextView(text: strTermOfServices, textStyle: textStyleBody3().copyWith(color: appGreenColor))),
            TextView(text: "& ", textStyle: textStyleBody3().copyWith(color: textColor)),
            GetInkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.staticPage, arguments: {"static": 2});
                },
                child: TextView(text: strPrivacyPolicy, textStyle: textStyleBody3().copyWith(color: appGreenColor))),
          ],
        ),
      ],
    ).marginOnly(top: margin_10, left: margin_20);
  }

  existingUser() {
    return GetInkWell(
      onTap: () {
        Get.toNamed(AppRoutes.loginScreen);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(text: "Existing user?  ", textStyle: textStyleBody2().copyWith(color: textColor)),
          TextView(text: signIn, textStyle: textStyleBody2().copyWith(color: appGreenColor)),
        ],
      ),
    );
  }
}
