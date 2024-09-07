import 'package:EarlybazeWallet/app/core/widget/custom_title_bar.dart';
import '../../../../constants/colors.dart';
import '../../../export.dart';

class LoginPage extends StatelessWidget {
  var ctime;

  final LoginController controller = Get.find<LoginController>();
  bool shouldPop = true;

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return AnnotatedRegionWidget(
              statusBarBrightness: Brightness.light,
              child: Scaffold(
                backgroundColor: appBlackColor,
                appBar: _appBar(),
                body: _body(),
                bottomNavigationBar: _newUser(),
              ),
            );
          }),
    );
  }

  _appBar() {
    return CustomAppBar(
      leadingWidget: SizedBox(),
    );
  }

  _body() {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleBar(
          appBarTitleText: strSignInTo,
          appBarSubtitleText: strEarlybazeWallet,
        ).marginOnly(left: margin_20, top: margin_10, bottom: margin_10),
        TextView(text: "Please Sign in to continue", textAlign: TextAlign.start, textStyle: textStyleBody3().copyWith(color: textColor))
            .marginOnly(left: margin_20, bottom: margin_10),
        _loginBody(),
        rememberMeTextView(),
        _signInButton(),
        SizedBox(
          height: height_10,
        ),
      ],
    );
  }

  Widget rememberMeTextView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
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
            TextView(
                text: strRememberMe,
                textStyle: textStyleBody3().copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
        GetInkWell(
          onTap: () {
            Get.toNamed(AppRoutes.forgotScreen);
          },
          child: TextView(
              text: strForgotPasswordQ,
              textStyle: textStyleBody3().copyWith(
                color: appGreenColor,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    ).paddingOnly(top: margin_10, bottom: margin_25, left: margin_20, right: margin_20);
  }

  _loginBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            key: controller.formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  filledColor: controller.emailFocusNode!.hasFocus ? textFieldFocusColor : colorWhiteM,
                  textController: controller.emailController,
                  focusNode: controller.emailFocusNode,
                  contentPadding: EdgeInsets.symmetric(vertical: margin_15, horizontal: margin_10),
                  hint: emailAddress,
                  textViewText: emailAddress,
                  radius: radius_5,
                  validate: (value) => Validator.validateEmail(value),
                  inputType: TextInputType.text,
                  hintStyle: textStyleLabel2().copyWith(
                    fontFamily: FontFamily.barnaulGrotesk,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(left: margin_20, right: margin_20, bottom: margin_5, top: margin_12),
                TextFieldWidget(
                  // contentPadding: EdgeInsets.symmetric(
                  //     vertical: margin_15, horizontal: margin_10),
                  hint: password,
                  textViewText: password,
                  focusNode: controller.passwordFocusNode,
                  filledColor: controller.passwordFocusNode!.hasFocus ? textFieldFocusColor : colorWhiteM,
                  textController: controller.passwordController,
                  obscureText: !controller.isPass,
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
              ],
            )),
      ],
    );
  }

  _forgetPassword() {
    return InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.forgotScreen);
        },
        child: TextView(
          text: forgotPassword,
          textStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: FontFamily.barnaulGrotesk, fontSize: font_14),
        )).paddingAll(margin_15);
  }

  _signInButton() {
    return GradientButton(
      buttonText: signIn,
      onPressed: () {
        print("object");
        controller.validate();
        // controller.hitLoginApi();
      },
      raduis: radius_30,
    ).marginAll(margin_20);

    MaterialButtonWidget(
      buttonText: signIn,
      onPressed: () {
        Get.toNamed(AppRoutes.mainScreen);
        // controller.validate();
        // shouldPop = !shouldPop;
      },
      buttonColor: buttonColor,
      buttonRadius: radius_8,
      buttonTextStyle: textStyleLabel2().copyWith(fontFamily: FontFamily.barnaulGrotesk),
    ).paddingOnly(left: margin_15, right: margin_15);
  }

  _newUser() {
    return SizedBox(
      height: height_50,
      child: InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.signupScreens);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(text: strNewUser, textStyle: textStyleBody3().copyWith(color: textColor)),
                  TextView(text: strClickHereTo, textStyle: textStyleBody3().copyWith(color: appGreenColor)),
                ],
              ),
              TextView(text: strCreateAnAccount, textStyle: textStyleBody3().copyWith(color: appGreenColor)),
            ],
          )).paddingAll(margin_5),
    );
  }
}
