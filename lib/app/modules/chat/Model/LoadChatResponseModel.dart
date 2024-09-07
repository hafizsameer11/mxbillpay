
import '../../../data/models/links_self_meta_model.dart';
import 'message_window_response_model.dart';

class LoadChatResponseModel {
  String? chatId;
  OtherUser? otherUser;
  List<MessageWindowData>? messages;
  Meta? meta;
  int? status;
  int? chatStatus;

  LoadChatResponseModel(
      {this.chatId, this.otherUser, this.messages, this.meta, this.status, this.chatStatus});

  LoadChatResponseModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    otherUser = json['other_user'] != null
        ? new OtherUser.fromJson(json['other_user'])
        : null;
    if (json['data'] != null) {
      messages = <MessageWindowData>[];
      json['data'].forEach((v) {
        messages!.add(new MessageWindowData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
    chatStatus = json['chat_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    if (this.otherUser != null) {
      data['other_user'] = this.otherUser!.toJson();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
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


