import 'package:EarlybazeWallet/app/core/widget/custom_title_bar.dart';
import 'package:EarlybazeWallet/app/export.dart';
import 'package:EarlybazeWallet/app/modules/authentication/controllers/otp_verify_controller.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({super.key});

  late OtpVerifyController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpVerifyController>(
        init: OtpVerifyController(),
        builder: (con) {
          controller = con;
          return Scaffold(
            backgroundColor: appBlackColor,
            appBar: CustomAppBar(),
            body: _bodyWidget(),
          );
        });
  }

  Widget _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleBar(
          appBarTitleText: strEnterDigit,
          appBarSubtitleText: strVerificationCode,
        ).marginSymmetric(horizontal: 10),
        SizedBox(
          height: height_15,
        ),
        TextView(text: strVerificationCodeWastSend, textAlign: TextAlign.start, textStyle: textStyleBody3().copyWith(color: Colors.white)).marginSymmetric(horizontal: 10),
        TextView(
          text: strPleaseEnterTheCode,
          textAlign: TextAlign.start,
          textStyle: textStyleBody3().copyWith(color: Colors.white),
        ).marginSymmetric(horizontal: 10),
        SizedBox(
          height: height_25,
        ),
        _otpBox(),
        SizedBox(
          height: height_20,
        ),
        _sendButton(),
        SizedBox(
          height: 10,
        ),
        resendWidget(),
      ],
    ).paddingAll(margin_10);
  }

  Widget resendWidget() {
    return Center(
        child: GestureDetector(
      onTap: () {
        controller.hitReSendOtpApiCall();
      },
      child: RichText(
        overflow: TextOverflow.clip,
        softWrap: true,
        maxLines: 1,
        textScaleFactor: 1,
        text: TextSpan(
          text: "Didn't receive code? ",
          style: textStyleLabel1().copyWith(color: Colors.white),
          children: <TextSpan>[
            TextSpan(text: 'Resend', style: TextStyle(color: appGreenColor)),
          ],
        ),
      ),
    ));
  }

  Widget _otpBox() => OtpPinField(
        key: controller.otpPinFieldController,
        autoFillEnable: true,
        fieldHeight: height_50,
        autoFocus: false,
        fieldWidth: width_55,
        textInputAction: TextInputAction.done,
        onSubmit: (text) {
          controller.otp = text;
        },
        onChange: (text) {
          controller.otp = text;
          print('Enter on change pin is $text');
        },
        otpPinFieldStyle:
            OtpPinFieldStyle(activeFieldBorderColor: appGreenColor, defaultFieldBorderColor: appGreenColor, textStyle: TextStyle(color: Colors.white, fontSize: font_19)),
        maxLength: 4,
        keyboardType: TextInputType.number,
        showCursor: true,
        cursorColor: textColor,
        showCustomKeyboard: false,
        showDefaultKeyboard: true,
        cursorWidth: 3,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
      ).marginSymmetric(horizontal: margin_10);

  Widget _sendButton() => GradientButton(
        buttonText: strVerify,
        onPressed: () {
          print("===============${controller.type.toString().toLowerCase()}");
          print("===============${controller.type.toString().toLowerCase().trim() == "forgetpassword".toLowerCase()}");
          if (controller.otpPinFieldController.currentState!.text.toString().trim().isNotEmpty) {
            if (controller.type.toString().toLowerCase().trim() == "forgetpassword".toLowerCase()) {
              controller.forgetPasswordOtpVerifyApiCall();
            } else {
              controller.hitOtpVerifyApi();
            }
          } else {
            showInSnackBar(message: "OTP can not be empty");
          }
        },
        raduis: radius_30,
        textColor: Colors.black,
      ).marginSymmetric(horizontal: margin_20, vertical: margin_15);
}
