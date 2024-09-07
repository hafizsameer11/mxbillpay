/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'dart:convert';

import '../../../export.dart';
import '../../models/remember_me_model.dart';

class PreferenceManger {
  static const String isFirstLaunch = "isFirstLaunch";
  static const String authToken = "authToken";
  static const String roleId = "roleId";
  static const String loginModel = "loginResponseModel";
  static const String staticResponseModel = "staticResponseModel";
  static const String rememberMe = "rememberMe";
  static const String rememberMeService = "rememberMeService";
  static const String isNotification = "isNotification";
  static const String email = "email";
  static const String password = "password";
  static const String notificationOn = "notificationOn";
  static const String HIVE_BOX = "HIVE_BOX";

  Rx<LoginDataModel> loginData = LoginDataModel().obs;

  initUserData({LoginDataModel? loginDataModel}) {
    if (loginDataModel == null) {
      getSavedLoginData().then((value) {
        if (value != null) loginData = value;
      });
    } else {
      loginData.value = loginDataModel;
    }
  }

  saveNotify(value) {
    localStorage.write("isNotify", value);
    return true;
  }

  getNotify() {
    var value = localStorage.read("isNotify");
    return value;
  }

  firstLaunch(bool? isFirstCheck) {
    localStorage.write(isFirstLaunch, isFirstCheck).onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
    localStorage.read(
      isFirstLaunch,
    );
  }

  saveAuthToken(String? token) {
    localStorage.write(authToken, token);
    return true;
  }

  getAuthToken() {
    String d = localStorage.read(authToken);
    return d;
  }

  saveEmail(String? e) {
    localStorage.write(email, e);
  }

  getEmail() {

    String? d = localStorage.read(email);
    if(d != null){

    return d;
    }else{
      
    }
  }

  saveRole(int? role) {
    localStorage.write(roleId, role);
  }

  getRole() {
    return localStorage.read(roleId);
  }

  getStatusFirstLaunch() {
    return localStorage.read(isFirstLaunch) ?? false;
  }

  saveRegisterData(LoginDataModel? model) async {
    if (model != null) localStorage.write(loginModel, jsonEncode(model.toJson()));
    await initUserData(loginDataModel: model);
  }

  Future getSavedLoginData() async {
    Map<String, dynamic>? userMap;
    final userStr = await localStorage.read(loginModel);
    if (userStr != null) userMap = jsonDecode(userStr) as Map<String, dynamic>;
    if (userMap != null) {
      LoginDataModel user = LoginDataModel.fromJson(userMap);
      return user;
    }
    return null;
  }

  saveRemeberMeData(RememberMeModel? model) async {
    localStorage.write(rememberMe, jsonEncode(model));
  }

  Future getsaveRemeberData({roldId}) async {
    Map<String, dynamic>? userMap;
    final userStr = await localStorage.read(roldId == roleCustomer ? rememberMe : rememberMeService);
    if (userStr != null) userMap = jsonDecode(userStr) as Map<String, dynamic>;
    if (userMap != null) {
      RememberMeModel user = RememberMeModel.fromJson(userMap);
      return user;
    }
    return null;
  }

  clearRememberMeData() {
    localStorage.remove(rememberMe);
    localStorage.remove(rememberMeService);
  }

  clearLoginData() {
    localStorage.remove(loginModel);
    localStorage.remove(authToken);
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  saveNotification(bool? notify) {
    localStorage.write(notificationOn, notify);
  }

  getNotification() {
    return localStorage.read(notificationOn);
  }
}

Future<bool> checkInternet() async {
  try {
    final result = await InternetAddress.lookup('www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      return true;
    }
  } on SocketException catch (_) {
    print('not connected');
    return false;
  }
  return false;
}
