/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

class ErrorMessageResponseModel {
  bool? success;
  String? message;
  String? copyrights;

  ErrorMessageResponseModel({this.success, this.message, this.copyrights});

  ErrorMessageResponseModel.fromJson(Map json) {
    success = json['success'];
    message = json['message'];
    copyrights = json['copyrights'];
  }

  Map toJson() {
    final Map data = new Map();
    data['success'] = this.success;
    data['message'] = this.message;
    data['copyrights'] = this.copyrights;
    return data;
  }
}
