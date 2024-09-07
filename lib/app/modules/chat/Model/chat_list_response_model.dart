import 'package:EarlybazeWallet/app/data/models/links_self_meta_model.dart';

import '../../../core/widget/time_formatter.dart';

class ChatListResponseModel {
  List<ReceiverData>? data;
  Meta? meta;
  int? status;

  ChatListResponseModel({this.data, this.meta, this.status});

  ChatListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReceiverData>[];
      json['data'].forEach((v) {
        data!.add(new ReceiverData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class ReceiverData {
  String? id;
  LastMessage? lastMessage;
  Receiver? receiver;
  Service? service;
  int? chatStatus;
  var createdOn;

  ReceiverData(
      {this.id,
      this.lastMessage,
      this.receiver,
      this.service,
      this.chatStatus,
      this.createdOn});

  ReceiverData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastMessage = json['last_message'] != null
        ? new LastMessage.fromJson(json['last_message'])
        : null;
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    chatStatus = json['chat_status'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.lastMessage != null) {
      data['last_message'] = this.lastMessage!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['chat_status'] = this.chatStatus;
    data['created_on'] = this.createdOn;
    return data;
  }
}

class LastMessage {
  String? sender;
  String? message;
  int? messageType;
  String? messageFile;
  String? createdOn;

  LastMessage(
      {this.sender,
      this.message,
      this.messageType,
      this.messageFile,
      this.createdOn});

  LastMessage.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    message = json['message'];
    messageType = json['message_type'];
    messageFile = json['message_file'];
    createdOn = json['created_on'] == null ? null : utcToLocalLatest(json['created_on']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['message'] = this.message;
    data['message_type'] = this.messageType;
    data['message_file'] = this.messageFile;
    data['created_on'] = this.createdOn;
    return data;
  }
}

class Receiver {
  String? id;
  String? fullName;
  String? profilePic;

  Receiver({this.id, this.fullName, this.profilePic});

  Receiver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}

class Service {
  String? title;
  int? minTime;
  int? maxTime;
  String? id;

  Service({this.title, this.minTime, this.maxTime, this.id});

  Service.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    minTime = json['min_time'];
    maxTime = json['max_time'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['min_time'] = this.minTime;
    data['max_time'] = this.maxTime;
    data['id'] = this.id;
    return data;
  }
}
