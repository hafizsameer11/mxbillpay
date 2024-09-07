import 'package:EarlybazeWallet/app/data/models/data_model/login_data_model.dart';

class LoginResponseModel {
  String? message;
  LoginDataModel? data;
  int? status;

  LoginResponseModel({this.message, this.data, this.status});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {

     message = json['message'];
     data = json['data'] != null ? new LoginDataModel.fromJson(json['data']) : null;
     status = json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}



