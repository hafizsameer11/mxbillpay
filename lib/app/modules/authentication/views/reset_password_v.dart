import '../../../export.dart';

class PasswordResetView extends StatelessWidget {
  final ResetPasswordController controller =
      Get.find<ResetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: width_30,
        titleInCentre: false,
        titleWidget: TextView(
          text: resetPassword,
          textStyle: textStyleHeading().copyWith(
              color: Colors.black, fontFamily: FontFamily.barnaulGrotesk),
        ),
      ),
      body: GetBuilder<ResetPasswordController>(
          init: ResetPasswordController(),
          builder: (controller) {
            return _body();
          }),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: [_resetBody(), _resetPasswordButton(), _backToSignIn()],
      ),
    );
  }

  _resetBody() {
    return Form(
      key: controller.formGlobalKey,
      child: Column(
        children: [
          TextFieldWidget(
            obscureText: true,
            filledColor: controller.passwordFocusNode.hasFocus
                ? textFieldFocusColor
                : Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: margin_20, horizontal: margin_10),
            hint: enterPassword,
            focusNode: controller.passwordFocusNode,
            textViewText: strPassword,
            textController: controller.passwordController,
            radius: radius_10,
            maxLength: 15,
            inputType: TextInputType.number,
            validate: (value) => Validator.validatePassword(value),
            hintStyle: textStyleLabel2().copyWith(
              fontFamily: FontFamily.barnaulGrotesk,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
            ),
          ).paddingAll(margin_10),
          TextFieldWidget(
            obscureText: true,
            filledColor: controller.confirmPasswordFocusNode.hasFocus
                ? textFieldFocusColor
                : Colors.white,
            focusNode: controller.confirmPasswordFocusNode,
            contentPadding: EdgeInsets.symmetric(
                vertical: margin_20, horizontal: margin_10),
            hint: confirmPassword,
            textViewText: confirmPassword,
            radius: radius_10,
            textController: controller.confirmPasswordController,
            inputType: TextInputType.text,
            maxLength: 15,
            validate: (value) => Validator.validateConfirmPasswordMatch(
                value: value, password: controller.passwordController.text),
            hintStyle: textStyleLabel2().copyWith(
              fontFamily: FontFamily.barnaulGrotesk,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
            ),
          ).paddingAll(margin_10),
        ],
      ),
    );
  }

  _resetPasswordButton() {
    return MaterialButtonWidget(
        buttonText: resetPassword,
        buttonColor: buttonColor,
        buttonTextStyle:
            textStyleLabel2().copyWith(fontFamily: FontFamily.barnaulGrotesk),
        buttonRadius: radius_10,
        onPressed: () {
          controller.validate();
        }).paddingAll(margin_10);
  }

  _backToSignIn() {
    return Container(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Get.offAllNamed(AppRoutes.loginScreen);
        },
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: backTo,
              style: textStyleLabel2().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.barnaulGrotesk)),
          TextSpan(
              text: signIn,
              style: textStyleLabel2().copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.barnaulGrotesk)),
        ])),
      ),
    );
  }
}
