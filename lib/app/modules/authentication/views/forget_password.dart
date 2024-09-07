import 'package:EarlybazeWallet/app/core/widget/custom_title_bar.dart';

import '../../../export.dart';

class ForgetPasswordView extends StatelessWidget {
  final ForgetPasswordController controller = Get.find<ForgetPasswordController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customizedAppBar(),
      body: Scaffold(
        backgroundColor: appBlackColor,
        body: GetBuilder<ForgetPasswordController>(
          init: ForgetPasswordController(),
          builder: (controller) {
            return _body();
          },
        ),
      ),
    );
  }

  _customizedAppBar() {
    return CustomAppBar(
      leadingWidth: width_30,
    );
  }

  _body() {
    return Form(
      key: controller.formGlobalKey,
      child: Column(
        children: [
          CustomTitleBar(
            appBarTitleText: strForgotPassword,
          ).marginOnly(left: margin_20, top: margin_5, bottom: margin_8),
          TextView(
            text: strEnterEmailAssociate,
            textStyle: textStyleBody3().copyWith(color: Colors.white),
            maxLine: 3,
            textAlign: TextAlign.justify,
          ).marginOnly(left: margin_20, right: margin_20, bottom: margin_15),
          Form(
            key: _formKey,
            child: TextFieldWidget(
              filledColor: controller.emailAddressFocusNode.hasFocus ? textFieldFocusColor : Colors.white,
              hint: emailAddress,
              textViewText: emailAddress,
              textController: controller.emailAddressController,
              focusNode: controller.emailAddressFocusNode,
              validate: (value) => Validator.validateEmail(value),
              inputType: TextInputType.text,
              hintStyle: textStyleLabel2().copyWith(
                fontFamily: FontFamily.barnaulGrotesk,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ).paddingAll(margin_15),
          ),
          _forgetPasswordButton()
        ],
      ),
    );
  }

  _forgetPasswordButton() {
    return GradientButton(
      buttonText: strSend,
      raduis: radius_30,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          controller.hitForgetPasswordApiCall();
        }
      },
    ).marginOnly(left: margin_20, right: margin_20, top: margin_20);
  }
}
