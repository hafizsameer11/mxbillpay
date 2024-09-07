/*
 * @copyright : Ozvid Technologies Pvt. Ltd. < www.ozvid.com >
 * @author     : Shiv Charan Panjeta < shiv@ozvid.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Ozvid Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited
 */

import 'package:intl_phone_field/countries.dart';

// class RememberMeModel {
//   Country? countryCode;
//   var contactNumber;
//   var password;
//
//   RememberMeModel({this.countryCode, this.contactNumber, this.password});
//
//   RememberMeModel.fromJson(Map<String, dynamic> json) {
//     countryCode = json['country_code'] != null
//         ? new Country.fromJson(json['country_code'])
//         : null;
//     contactNumber = json['contact_number'];
//     password = json['password'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (countryCode != null) {
//       data['country_code'] = countryCode!.toJson();
//     }
//     data['contact_number'] = contactNumber;
//     data['password'] = password;
//     return data;
//   }
// }

class RememberMeModel {
  int? roleId;
  String? phoneNumber;
  String? password;

  RememberMeModel({
    this.phoneNumber,
    this.password,
    this.roleId,
  });

  RememberMeModel.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roleId'] = roleId;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;

    return data;
  }
}

class CountryDataModel {
  String? name;
  String? flag;
  String? code;
  String? dialCode;
  int? minLength;
  int? maxLength;

  CountryDataModel({
    this.name,
    this.flag,
    this.code,
    this.dialCode,
    this.minLength,
    this.maxLength,
  });

  CountryDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
    code = json['code'];
    dialCode = json['dialCode'];
    minLength = json['minLength'];
    maxLength = json['maxLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['flag'] = flag;
    data['code'] = code;
    data['dialCode'] = dialCode;
    data['minLength'] = minLength;
    data['maxLength'] = maxLength;
    return data;
  }

  Map<String, dynamic> toJsonCountry(Country country) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = country.name;
    data['flag'] = country.flag;
    data['code'] = country.code;
    data['dialCode'] = country.dialCode;
    data['minLength'] = country.minLength;
    data['maxLength'] = country.maxLength;
    return data;
  }
}
