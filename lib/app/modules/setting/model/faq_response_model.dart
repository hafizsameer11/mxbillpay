import '../../../data/models/links_self_meta_model.dart';
import 'faq_data_model.dart';

class FaqResponseModel {
  List<FaqDataModel>? data;
  Meta? meta;
  int? status;

  FaqResponseModel({this.data, this.meta, this.status});

  FaqResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FaqDataModel>[];
      json['data'].forEach((v) {
        data!.add(new FaqDataModel.fromJson(v));
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