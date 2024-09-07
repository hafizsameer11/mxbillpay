import '../../../core/widget/time_formatter.dart';
import '../../../data/models/links_self_meta_model.dart';

class MessageWindowResponseModel {
  String? chatId;
  OtherUser? otherUser;
  List<MessageWindowData>? data;
  Meta? meta;
  int? status;

  MessageWindowResponseModel({this.chatId, this.otherUser, this.data, this.meta, this.status});

  MessageWindowResponseModel.fromJson(Map<String, dynamic> json) {
    print("object${json}");
    chatId = json['chat_id'];
    otherUser = json['other_user'] != null ? new OtherUser.fromJson(json['other_user']) : null;
    if (json['data'] != null) {
      data = <MessageWindowData>[];
      json['data'].forEach((v) {
        data!.add(new MessageWindowData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    if (this.otherUser != null) {
      data['other_user'] = this.otherUser!.toJson();
    }
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

class OtherUser {
  String? id;
  String? fullName;
  String? profilePic;

  OtherUser({this.id, this.fullName, this.profilePic});

  OtherUser.fromJson(Map<String, dynamic> json) {
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

class MessageWindowData {
  String? id;
  Sender? sender;
  Sender? receiver;
  String? message;
  dynamic messageType;
  dynamic messageFile;
  var createdOn;

  MessageWindowData({this.id, this.sender, this.receiver, this.message, this.createdOn, this.messageType});

  MessageWindowData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null ? new Sender.fromJson(json['receiver']) : null;
    message = json['message'];
    createdOn = json['created_on'] == null ? null : utcToLocalLatest(json['created_on']);
    messageFile = json['message_file'];
    messageType = json['message_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver!.toJson();
    }
    data['message'] = this.message;
    data['created_on'] = this.createdOn;
    data['message_type'] = this.messageType;
    data['message_file'] = this.messageFile;
    return data;
  }
}

class Sender {
  String? id;
  String? fullName;
  String? profilePic;

  Sender({this.fullName, this.profilePic});

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['id'] = this.fullName;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}
