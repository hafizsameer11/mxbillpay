//
// import '../../../export.dart';
//
// class LoginResponseModel {
//   String? message;
//   String? accessToken;
//   LoginDataModel? detail;
//   String? copyrights;
//
//   LoginResponseModel(
//       {this.message, this.accessToken, this.detail, this.copyrights});
//
//   LoginResponseModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     accessToken = json['access-token'];
//     detail =
//     json['detail'] != null ? new LoginDataModel.fromJson(json['detail']) : null;
//     copyrights = json['copyrights'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['access-token'] = this.accessToken;
//     if (this.detail != null) {
//       data['detail'] = this.detail!.toJson();
//     }
//     data['copyrights'] = this.copyrights;
//     return data;
//   }
// }
//
