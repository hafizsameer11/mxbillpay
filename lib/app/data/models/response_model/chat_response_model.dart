import '../links_self_meta_model.dart';

class ChatResponseModel {
  List<Null>? data;
  Meta? meta;
  int? status;

  ChatResponseModel({this.data, this.meta, this.status});

  ChatResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Null>[];
      json['data'].forEach((v) {
      // /  data!.add(new Null.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      // data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
