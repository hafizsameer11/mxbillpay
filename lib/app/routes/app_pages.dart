/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:EarlybazeWallet/app/modules/authentication/views/otp_verify_screen.dart';
import 'package:EarlybazeWallet/app/modules/chat/binding/chat_binding.dart';
import 'package:EarlybazeWallet/app/modules/chat/view/MessagingScreen.dart';
import 'package:EarlybazeWallet/app/modules/notification_module/binding/notification_binding.dart';
import 'package:EarlybazeWallet/app/modules/setting/view/CrashReportScreen.dart';

import '../export.dart';
import '../modules/authentication/views/profile_setup_screen.dart';
import '../modules/authentication/views/static_page.dart';
import '../modules/notification_module/view/notification_screen.dart';
import '../modules/setting/view/setting_screen.dart';

class AppPages {
  static const INITIAL = AppRoutes.splashRoute;
  static final routes = [
    GetPage(
        name: AppRoutes.splashRoute,
        page: () => SplashViewScreen(),
        bindings: [SplashBindings()]),
    // GetPage(
    //   name: AppRoutes.dealsDescriptionScreen,
    //   page: () => SplashViewScreen(),
    // ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginPage(),
      bindings: [AuthenticationBinding()],
    ),
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => OtpVerifyScreen(),
      bindings: [AuthenticationBinding()],
    ),
    GetPage(
      name: AppRoutes.profileSetupScreen,
      page: () => ProfileSetupScreen(),
      bindings: [AuthenticationBinding()],
    ),
    GetPage(
      name: AppRoutes.staticPage,
      page: () => StaticPage(),
      bindings: [AuthenticationBinding()],
    ),

    GetPage(
        name: AppRoutes.signupScreens,
        page: () => SignUpScreen(),
        bindings: [SignUpBinding()]),
    GetPage(
      name: AppRoutes.forgotScreen,
      page: () => ForgetPasswordView(),
      bindings: [ForgetPasswordBinding()],
    ),
    GetPage(
        name: AppRoutes.resetScreen,
        page: () => PasswordResetView(),
        bindings: [ResetPasswordBindings()]),
    GetPage(
        name: AppRoutes.onBoarding,
        page: () => OnBoardingScreen(),
        bindings: [OnBoardingBindings()]),
    GetPage(
        name: AppRoutes.mainScreen,
        page: () => MainScreenView(),
        bindings: [HomeScreenBindings()]),
    GetPage(
        name: AppRoutes.changePasswordScreen,
        page: () => ChangePasswordScreen(),
        bindings: [ProfileBindings()]),
    GetPage(
        name: AppRoutes.MessagingScreen,
        page: () => MessagingScreen(),
        bindings: [ChatBinding()]),
    GetPage(
        name: AppRoutes.settingScreen,
        page: () => SettingScreen(),
        bindings: [ProfileBindings()]),
    GetPage(
        name: AppRoutes.editProfileScreen,
        page: () => EditProfileScreen(),
        bindings: [ProfileBindings()]),
    GetPage(
        name: AppRoutes.notificationScreen,
        page: () => NotificationScreen(),
        bindings: [NotificationBinding()]),
    GetPage(
        name: AppRoutes.profileScreen,
        page: () => ProfileScreen(),
        bindings: [ProfileBindings()]),
    GetPage(
        name: AppRoutes.profileScreen,
        page: () => ProfileScreen(),
        bindings: [ProfileBindings()]),
    GetPage(
      name: AppRoutes.crashReportScreen,
      page: () => CrashReportScreen(),
    ),
  ];
}
