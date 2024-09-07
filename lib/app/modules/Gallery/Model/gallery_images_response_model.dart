import '../../../data/models/links_self_meta_model.dart';

class GalleryListResponseModel {
  List<ImageListDataModel>? data;
  Meta? meta;
  int? status;

  GalleryListResponseModel({this.data, this.meta, this.status});

  GalleryListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ImageListDataModel>[];
      json['data'].forEach((v) {
        data!.add(new ImageListDataModel.fromJson(v));
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

class ImageListDataModel {
  String? id;
  String? image;

  ImageListDataModel({this.id, this.image});

  ImageListDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
