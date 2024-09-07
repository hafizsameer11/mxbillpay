class NotificationToggleResponseModel {
  String? message;
  Data? data;
  int? status;

  NotificationToggleResponseModel({this.message, this.data, this.status});

  NotificationToggleResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? id;
  bool? notification;

  Data({this.id, this.notification});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notification = json['notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification'] = this.notification;
    return data;
  }
}
