/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import 'package:EarlybazeWallet/app/modules/chat/Model/chat_list_response_model.dart';
import 'package:EarlybazeWallet/app/modules/setting/model/faq_response_model.dart';

import '../../export.dart';
import '../../modules/Gallery/Model/SelectedServiceResponseModel.dart';
import '../../modules/Gallery/Model/gallery_images_response_model.dart';
import '../../modules/chat/Model/EndChatResponseModel.dart';
import '../../modules/chat/Model/LoadChatResponseModel.dart';
import '../../modules/chat/Model/SendMessageResponseModel.dart';
import '../../modules/chat/Model/message_window_response_model.dart';
import '../../modules/home/model/ServicesResponseModel.dart';
import '../../modules/notification_module/model/clear_all_response_model.dart';
import '../../modules/notification_module/model/delete_notification_response_model.dart';
import '../../modules/notification_module/model/notification_response_model.dart';
import '../../modules/notification_module/model/read_notification_response_model.dart';
import '../models/response_model/notification_toggle_response_model.dart';
import '../models/response_model/otp_verification_response_model.dart';
import '../models/response_model/sign_up_response_model.dart';
import '../models/response_model/static_page_response_model.dart';

class APIRepository {
  static late DioClient? dioClient;
  static var deviceName, deviceType, deviceID, deviceVersion, deviceToken = "test";

  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
    getDeviceData();
  }

  getDeviceData() async {
    DeviceInfoPlugin info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await info.androidInfo;
      deviceName = androidDeviceInfo.model;
      deviceID = androidDeviceInfo.id;
      deviceVersion = androidDeviceInfo.version.release;
      deviceType = "1";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await info.iosInfo;
      deviceName = iosDeviceInfo.model;
      deviceID = iosDeviceInfo.identifierForVendor;
      deviceVersion = iosDeviceInfo.systemVersion;
      deviceType = "2";
    }
  }

  //*===================================================================== Report Any crashes or errors to logger API Call  ==========================================================*

/*  Future reportCrashLogApiCall({data}) async {
    try {
      final res = await Dio().post(crashBaseUrl + logCrashesExceptionsEndPoint,
          data: FormData.fromMap(data));
      var response = res.data;
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }*/

  //*===================================================================== Login API Call  ==========================================================*

  static Future loginApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(loginEndPoint, data: formData);
      return LoginResponseModel.fromJson(response);
    } catch (e, st) {
      print(st);
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*===================================================================== Account Verification  ==========================================================*

  static Future accountVerificationApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(accountVerification, data: formData, skipAuth: false);
      return OtpVerificationResponseModel.fromJson(response);
    } catch (e) {
      // debugPrint("Stack trace ::: $st ===== $e");
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*===================================================================== Account Verification  ==========================================================*

  static Future reSendOtpApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(
        reSendOtpEndPoint,
        skipAuth: false,
        data: formData,
      );
      return OtpVerificationResponseModel.fromJson(response);
    } catch (e) {
      //debugPrint("Stack trace ::: $st ===== $e");
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*===================================================================== Update Profile  ==========================================================*

  static Future updateProfileApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(updateProfileEndPoint, data: formData, skipAuth: false);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*===================================================================== Check API Call  ==========================================================*

  Future checkApiCall() async {
    try {
      final response = await dioClient!.get(checkEndPoint, skipAuth: false);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  Future<ServicesResponseModel> getServicesListAPICall(String page) async {
    try {
      final response = await dioClient!.get(servicesListingToggle, skipAuth: false, queryParameters: {keyPage: page});
      return ServicesResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*===================================================================== signUp API Call  ==========================================================*

  static Future signUpApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(signUpEndPoint, data: formData);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future<SelectedServiceResponseModel> findAgentApiCall({required String service_id}) async {
    try {
      FormData formData = FormData.fromMap({"service_id": service_id});
      final response = await dioClient!.post(selectServiceFindAgent, data: formData, skipAuth: false, isLoading: false);
      return SelectedServiceResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future<LoadChatResponseModel> loadChatApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(loadChat, data: formData, skipAuth: false, isLoading: false, isHideKeyboard: false);
      return LoadChatResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future<MessageWindowResponseModel> messageWindowApiCall({required Map<String, dynamic> dataBody, required Map<String, dynamic> queryParameter}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(messageWindow, data: formData, skipAuth: false, isLoading: false, queryParameters: queryParameter);
      return MessageWindowResponseModel.fromJson(response);
    } catch (e, stacktrace) {
      print("Message Error---${e.toString()}");
      print("Message Stack---$stacktrace");
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  Future<SendMessageResponseModel> sendMessagesApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      debugPrint("entered");
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(sendMessages, data: formData, skipAuth: false, isLoading: false, isHideKeyboard: false);
      return SendMessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*===================================================================== forgetPassword API Call  ==========================================================*

  static Future forgetPasswordApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      final response = await dioClient!.post(forgetPasswordEndPoint, data: FormData.fromMap(dataBody), skipAuth: true);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*===================================================================== Logout API Call  ==========================================================*

  static Future logoutApiCall() async {
    try {
      final response = await dioClient!.get(logoutEndPoint, skipAuth: false);
      return ErrorMessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  ///toggle on/off
  static Future notificationToggleCall({required Map<String, dynamic> dataBody}) async {
    try {
      final response = await dioClient!.post(
        userNotificationToggle,
        data: FormData.fromMap(dataBody),
        skipAuth: false,
      );
      return NotificationToggleResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*=====================================================================  Delete Account  ==========================================================*

  Future deleteAccountApiCall() async {
    try {
      final response = await dioClient!.get(
        deleteAccountEndPoint,
        skipAuth: false,
      );
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

//*============================================================================== HomeScreen API Call  ========================================================================*

//*==================================== PopularProducts ApiCall ==================================== *//

  static Future staticPageApiCall({typeId}) async {
    try {
      final response = await dioClient!.get(staticPageEndPoint, queryParameters: {"type_id": typeId}, skipAuth: true);
      return StaticPageResponseModel.fromJson(response);
    } catch (e, stack) {
      print(stack);
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

//*==================================== PopularProducts ApiCall ==================================== *//

  static Future faqListApiCall(page) async {
    try {
      final response = await dioClient!.get(faqListEndPoint, queryParameters: {"page": page}, skipAuth: false);
      return FaqResponseModel.fromJson(response);
    } catch (e, st) {
      debugPrint("St:::::::::: $st");
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

//*===================================================================== Update Profile API Call  ==========================================================*

  //
  // static Future updateProfileApiCall({required Map<String, dynamic>? dataBody}) async {
  //   try {
  //     final response = await dioClient!.post(updateProfileEndPoint,
  //         data: FormData.fromMap(dataBody!), skipAuth: false);
  //     return LoginResponseModel.fromJson(response);
  //   } catch (e) {
  //     return Future.error(NetworkExceptions.getDioException(e));
  //   }
  // }

  //*===================================================================== loadNotificationsApiCall  ==========================================================*/

  static Future notificationListApiCall({page}) async {
    try {
      final response = await dioClient!.get(NotificationList, queryParameters: {"page": page}, skipAuth: false);
      return NotificationResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future notificationClearApi() async {
    try {
      final response = await dioClient?.get(
        clearAllNotification,
        skipAuth: false,
      );
      return ClearAllResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future deleteNotificationApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient?.post(deleteNotificationEndPoint, data: FormData.fromMap(dataBody!), skipAuth: false);
      return DeleteNotificationResponseModel.fromJson(response);
    } catch (e) {
      debugPrint("Error == $e");
    }
  }

  static Future readNotificationApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient?.post(markReadNotificationEndPoint, data: FormData.fromMap(dataBody!), skipAuth: false);
      return ReadResponseModel.fromJson(response);
    } catch (e) {
      debugPrint("Error == $e");
    }
  }

  //*===================================================================== resetPassword API Call  ==========================================================*

  static Future resetPasswordApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient?.post("forgetPasswordEndPoint", data: FormData.fromMap(dataBody!), skipAuth: false);
      return ErrorMessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  //*===================================================================== Change Password API Call  ==========================================================*

  Future changePasswordApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      final response = await dioClient!.post(changePasswordEndPoint, data: FormData.fromMap(dataBody), skipAuth: false);

      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future otpVerificationApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(veriftOTPEndPoint, data: formData, skipAuth: false);
      return OtpVerificationResponseModel.fromJson(response);
    } catch (e, st) {
      debugPrint("Stack trace ::: $st ===== $e");
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  static Future endChatApiCall({required Map<String, dynamic> dataBody}) async {
    try {
      FormData formData = FormData.fromMap(dataBody);
      final response = await dioClient!.post(endChat, data: formData, skipAuth: false);
      return EndChatResponseModel.fromJson(response);
    } catch (e) {
      //debugPrint("Stack trace ::: $st ===== $e");
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  chatApiCall({page, perPage, search}) async {
    try {
      final response = await dioClient!.get(chatListEnd, queryParameters: {"search": search, "per_page": perPage, "page": page}, skipAuth: false);
      //debugPrint("response =========.${jsonEncode(response)}");
      return ChatListResponseModel.fromJson(response);
    } catch (e) {
      //debugPrint("Stack trace ::: $st ===== $st");
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  Future<GalleryListResponseModel> galleryApiCall({agentId}) async {
    try {
      final response = await dioClient!.get(galleryEndPoint, queryParameters: {"agent_id": agentId});
      return GalleryListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }
}

// reportCrash(stackTrace) async {
//   PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   String version = packageInfo.version;
//   CustomLoader customLoader = CustomLoader();
//   var req = AuthRequestModel.logCrashErrorReq(
//       error: packageInfo.packageName,
//       packageVersion: version,
//       phoneModel: APIRepository.deviceName,
//       ip: APIRepository.deviceVersion,
//       stackTrace: stackTrace);
//
//   await APIRepository().reportCrashLogApiCall(data: req).then((value) async {
//     customLoader.hide();
//     if (value != null) {}
//   }).onError((error, stackTrace) {
//     customLoader.hide();
//     initApp();
//     debugPrint(error.toString());
//   });
// }
