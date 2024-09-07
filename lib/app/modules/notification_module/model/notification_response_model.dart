import '../../../core/widget/time_formatter.dart';

class NotificationResponseModel {
  List<NotificationData>? data;
  Meta? meta;
  int? status;

  NotificationResponseModel({this.data, this.meta, this.status});

  NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
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

class NotificationData {
  String? id;
  Announcement? announcement;
  String? title;
  String? description;
  bool? isRead;
  int? notificationType;
  String? createdOn;
  var objectId;
  String? createdBy;
  String? createdFor;

  NotificationData({this.id, this.announcement, this.title, this.description, this.isRead, this.notificationType, this.createdOn, this.objectId, this.createdBy, this.createdFor});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    announcement = json['announcement'] != null ? new Announcement.fromJson(json['announcement']) : null;
    title = json['title'];
    description = json['description'];
    isRead = json['is_read'];
    notificationType = json['notification_type'];
    createdOn = json['created_on'] == null ? null : utcToLocalLatest(json['created_on']);
    objectId = json['object_id'];
    createdBy = json['created_by'];
    createdFor = json['created_for'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.announcement != null) {
      data['announcement'] = this.announcement!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['is_read'] = this.isRead;
    data['notification_type'] = this.notificationType;
    data['created_on'] = this.createdOn;
    data['object_id'] = this.objectId;
    data['created_by'] = this.createdBy;
    data['created_for'] = this.createdFor;
    return data;
  }
}

class Announcement {
  String? id;
  String? createdOn;
  String? updatedOn;
  String? title;
  String? image;
  bool? isNotified;
  String? description;
  String? createdBy;

  Announcement({this.id, this.createdOn, this.updatedOn, this.title, this.image, this.isNotified, this.description, this.createdBy});

  Announcement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    title = json['title'];
    image = json['image'];
    isNotified = json['is_notified'];
    description = json['description'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['title'] = this.title;
    data['image'] = this.image;
    data['is_notified'] = this.isNotified;
    data['description'] = this.description;
    data['created_by'] = this.createdBy;
    return data;
  }
}

class Meta {
  int? pageCount;
  int? totalResults;
  int? currentPageNo;
  int? limit;
  bool? lastPage;

  Meta({this.pageCount, this.totalResults, this.currentPageNo, this.limit, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    pageCount = json['page_count'];
    totalResults = json['total_results'];
    currentPageNo = json['current_page_no'];
    limit = json['limit'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_count'] = this.pageCount;
    data['total_results'] = this.totalResults;
    data['current_page_no'] = this.currentPageNo;
    data['limit'] = this.limit;
    data['last_page'] = this.lastPage;
    return data;
  }
}
