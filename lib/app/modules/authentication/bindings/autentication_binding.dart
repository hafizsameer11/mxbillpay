/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import 'package:EarlybazeWallet/app/modules/authentication/controllers/otp_verify_controller.dart';
import 'package:EarlybazeWallet/app/modules/authentication/controllers/profile_setup_controller.dart';
import 'package:EarlybazeWallet/app/modules/authentication/controllers/static_page_controller.dart';

import '../../../export.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<OtpVerifyController>(
      () => OtpVerifyController(),
    );
    Get.lazyPut<StaticPageController>(
      () => StaticPageController(),
    );
    Get.lazyPut<ProfileSetupController>(
      () => ProfileSetupController(),
    );
  }
}
