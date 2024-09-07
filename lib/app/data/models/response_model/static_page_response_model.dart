class StaticPageResponseModel {
  Data? data;
  int? status;

  StaticPageResponseModel({this.data, this.status});

  StaticPageResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? content;
  int? typeId;
  String? createdOn;
  String? updatedOn;

  Data(
      {this.id,
        this.title,
        this.content,
        this.typeId,
        this.createdOn,
        this.updatedOn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    typeId = json['type_id'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    return data;
  }
}
