/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

class MessageResponseModel {
  bool? success;
  int? isNotify;
  String? message;
  String? copyrighths;

  MessageResponseModel({this.success,this.isNotify, this.message, this.copyrighths});

  MessageResponseModel.fromJson(Map json) {
    success = json['success'];
    isNotify = json['is_notify'];
    message = json['message'];
    copyrighths = json['copyrighths'];
  }

  Map toJson() {
    final Map data = new Map();
    data['success'] = this.success;
    data['is_notify'] = this.isNotify;
    data['message'] = this.message;
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}
