import '../../../core/widget/custom_title_bar.dart';
import '../../../export.dart';

class ChangePasswordScreen extends StatelessWidget {
  var controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) => Scaffold(
        backgroundColor: appBlackColor,
        appBar: CustomAppBar(
          appBarTitleText: strPassword,
          titleInCentre: false,
        ),
        body: bodyWidget(),
      ),
    );
  }

  Widget bodyWidget() {
    return SingleChildScrollView(
      child: Form(
        key: controller.formGlobalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleBar(
              appBarTitleText: Get.arguments == null ? strResetPassword : strChangePassword,
            ).marginSymmetric(horizontal: 10),
            SizedBox(
              height: height_20,
            ),
            TextFieldWidget(
              hint: strNewPassword,
              textViewText: strNewPassword,
              textController: controller.newPasswordTextController,
              validate: (data) => Validator.validatePassword(data),
              inputType: TextInputType.text,
              obscureText: controller.isPass,
              inputFormatter: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              hintStyle: textStyleLabel2().copyWith(
                fontFamily: FontFamily.barnaulGrotesk,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: GetInkWell(
                onTap: () {
                  controller.passwordHideUnhide();
                },
                child: AssetImageWidget(controller.isPass == true ? iconsShow : iconsIcHide, imageHeight: height_3, imageWidth: width_3).marginAll(margin_13),
              ),
            ).paddingAll(margin_5),
            TextFieldWidget(
              hint: strConfirmPassword,
              textViewText: strConfirmPassword,
              textController: controller.confirmPasswordTextController,
              validate: (data) => Validator.validateConfirmPasswordMatch(value: data, password: controller.newPasswordTextController.text.trim()),
              inputType: TextInputType.text,
              obscureText: controller.isConPass,
              inputFormatter: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              hintStyle: textStyleLabel2().copyWith(
                fontFamily: FontFamily.barnaulGrotesk,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: GetInkWell(
                onTap: () {
                  controller.conPasswordHideUnhide();
                },
                child: AssetImageWidget(controller.isConPass == true ? iconsShow : iconsIcHide, imageHeight: height_3, imageWidth: width_3).marginAll(margin_13),
              ),
            ).paddingOnly(top: margin_15, left: margin_5, bottom: margin_15),
            GradientButton(
              buttonText: strSave,
              onPressed: () {
                controller.validateData();
              },
              raduis: radius_30,
            ).marginOnly(top: margin_20)
          ],
        ).paddingAll(margin_10),
      ),
    );
  }
}
