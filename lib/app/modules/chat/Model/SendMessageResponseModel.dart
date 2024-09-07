import 'package:EarlybazeWallet/app/modules/chat/Model/message_window_response_model.dart';

class SendMessageResponseModel {
  MessageWindowData? messages;
  String? message;

  SendMessageResponseModel({this.messages, this.message});

  SendMessageResponseModel.fromJson(Map<String, dynamic> json) {
    messages = json['messages'] != null
        ? new MessageWindowData.fromJson(json['messages'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}


