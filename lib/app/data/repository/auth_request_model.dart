/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import 'package:dio/dio.dart';

class AuthRequestModel {
  /*===================================================Register Request Model==============================================*/
  static registerRequestData({
    required String? contact,
    required String? roleId,
    required String? countryCode,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[contact_no]"] = contact;
    data["User[role_id]"] = roleId;
    data["User[country]"] = countryCode;

    return data;
  }

  static forgotPasswprdRequestData({
    required String? contact,
    required String? countryCode,
    required String? roleID,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[contact_no]"] = contact;
    data["User[role_id]"] = roleID;
    data["User[country]"] = countryCode;

    return data;
  }

  static profileRequestData(
      {required String? firstName,
      required String? lastName,
      required String? email,
      required String? contact,
      required String? countryCode,
      String? countryIsoCode,
      MultipartFile? profilePicture,
      MultipartFile? idPicture,
      required String? dob,
      String? latitude,
      String? longitude,
      String? city,
      String? state,
      String? country}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["email"] = email;
    data["mobile"] = contact;
    data["country_code"] = countryCode;
    data["country_iso_code"] = countryIsoCode;
    data["profile_picture"] = profilePicture;
    data["id_photo"] = idPicture;
    data["dob"] = dob;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["city"] = city;
    data["state"] = state;
    data["country"] = country;

    return data;
  }

  static createPasswordRequestData({
    required String? contact,
    required String? password,
    required String? countryCode,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[contact_no]"] = contact;
    data["User[password]"] = password;
    data["User[country]"] = countryCode;

    return data;
  }

  static verifyOtpRequestModel({
    required String? otp,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[otp]"] = otp;

    return data;
  }

  static resetPaswordRequestModel({
    required String? password,
    required String? otp,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[password]"] = password;
    data["User[contact_no]"] = otp;

    return data;
  }

  static resendOtpRequestModel({
    required String? email,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;

    return data;
  }

  static chnagePaswordRequestModel({
    required String? password,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User[password]"] = password;

    return data;
  }

/*===================================================Register Request Model==============================================*/
  static loginRequestData({required String? contact, required String? password, var deviceToken, required String? roleId, var contryCode, var deviceType, var deviceName}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LoginForm[username]'] = contact;
    data['LoginForm[admin_password]'] = password;
    data['LoginForm[country]'] = contryCode;
    data['LoginForm[role_id]'] = roleId;
    data['LoginForm[device_token]'] = deviceToken;
    data['LoginForm[device_type]'] = deviceType;
    data['LoginForm[device_name]'] = deviceName;

    return data;
  }

  /*====================================================Forgot password Request Model====================================*/
  static changePasswordRequestModel({required String? password, required String? confirmPassword}) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["password"] = password;
    data["confirm_password"] = confirmPassword;

    return data;
  }

  /*==================================================Login Request Model==============================================*/
  static favUnFavRequestModel({
    required int? locationId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Item[model_id]"] = locationId;
    return data;
  }

  static addBusinessDetailsRequestModel({
    required String name,
    required String address,
    required String latitude,
    required String longitude,
    required String websiteLink,
    required String description,
    required MultipartFile? profileFile,
    required String contact,
    required String? acceptType,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Business[name]"] = name;
    data["Business[address]"] = address;
    data["Business[latitude]"] = latitude;
    data["Business[longitude]"] = longitude;
    data["Business[website_link]"] = websiteLink;
    data["Business[description]"] = description;
    data["Business[profile_file]"] = profileFile;
    data["Business[contact_no]"] = contact;
    data["Business[accept_type]"] = acceptType;
    return data;
  }

  static addServicesRequestModel({
    required String title,
    required int? categoryId,
    required String price,
    required String description,
    required int? startTime,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ServiceDetail[title]"] = title;
    data["ServiceDetail[category_id]"] = categoryId;
    data["ServiceDetail[price]"] = price;
    data["ServiceDetail[description]"] = description;
    data["ServiceDetail[service_time_id]"] = startTime;
    return data;
  }

  static addEmployeeRequestModel({
    required String name,
    required String email,
    required String phone,
    required String serviceId,
    MultipartFile? profile,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ServiceStaff[full_name]"] = name;
    data["ServiceStaff[email]"] = email;
    data["ServiceStaff[contact_no]"] = phone;
    data["ServiceStaff[service_id]"] = serviceId;
    data["ServiceStaff[profile_file]"] = profile;
    return data;
  }

  static addAvailabilityRequestModel({
    required String dayId,
    required String startTime,
    required int serviceId,
    required String endTime,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Availability[day_id]"] = dayId;
    data["Availability[slot_start_time]"] = startTime;
    data["Availability[service_id]"] = serviceId;
    data["Availability[slot_end_time]"] = endTime;
    return data;
  }

  static addContactUsRequestModel({
    required String fullName,
    required String mobile,
    required String email,
    required String message,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Information[full_name]"] = fullName;
    data["Information[email]"] = email;
    data["Information[mobile]"] = mobile;
    data["Information[subject]"] = message;
    return data;
  }

  static bookingAppointmentRequestModel({
    required String startTime,
    required int serviceId,
    required String endTime,
    required int reminderType,
    required int providerId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Booking[start_time]"] = startTime;
    data["Booking[end_time]"] = endTime;
    data["Booking[service_id]"] = serviceId;
    data["Booking[reminder_type]"] = reminderType;
    data["Booking[provider_id]"] = providerId;

    return data;
  }

  static logCrashErrorReq({
    error,
    packageVersion,
    phoneModel,
    ip,
    stackTrace,
  }) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Log[error]'] = error;
    data['Log[link]'] = packageVersion;
    data['Log[referer_link]'] = phoneModel;
    data['Log[user_ip]'] = ip;
    data['Log[description]'] = stackTrace;
    return data;
  }
}
