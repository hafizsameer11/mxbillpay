import 'package:EarlybazeWallet/app/modules/chat/Model/chat_list_response_model.dart';

class SelectedServiceResponseModel {
  String? message;
  ReceiverData? selectedAgentData;

  SelectedServiceResponseModel({this.message, this.selectedAgentData});

  SelectedServiceResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    selectedAgentData = json['data'] != null ? new ReceiverData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.selectedAgentData != null) {
      data['data'] = this.selectedAgentData!.toJson();
    }
    return data;
  }
}

