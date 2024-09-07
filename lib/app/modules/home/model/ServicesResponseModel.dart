class ServicesResponseModel {
  List<ServiceDataModel>? serviceDataModel;
  Meta? meta;
  int? status;

  ServicesResponseModel({this.serviceDataModel, this.meta, this.status});

  ServicesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      serviceDataModel = <ServiceDataModel>[];
      json['data'].forEach((v) {
        serviceDataModel!.add(new ServiceDataModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceDataModel != null) {
      data['ServiceDataModel'] =
          this.serviceDataModel!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class ServiceDataModel {
  String? id;
  String? title;
  SupportType? supportType;
  int? minTime;
  int? maxTime;
  String? image;
  String? createdOn;
  String? updatedOn;

  ServiceDataModel(
      {this.id,
        this.title,
        this.supportType,
        this.minTime,
        this.maxTime,
        this.image,
        this.createdOn,
        this.updatedOn});

  ServiceDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    supportType = json['support_type'] != null
        ? new SupportType.fromJson(json['support_type'])
        : null;
    minTime = json['min_time'];
    maxTime = json['max_time'];
    image = json['image'];
    print(image);
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.supportType != null) {
      data['support_type'] = this.supportType!.toJson();
    }
    data['min_time'] = this.minTime;
    data['max_time'] = this.maxTime;
    data['image'] = this.image;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    return data;
  }
}

class SupportType {
  String? id;
  String? title;
  String? createdOn;

  SupportType({this.id, this.title, this.createdOn});

  SupportType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['created_on'] = this.createdOn;
    return data;
  }
}

class Meta {
  int? pageCount;
  int? totalResults;
  int? currentPageNo;
  int? limit;
  bool? lastPage;

  Meta(
      {this.pageCount,
        this.totalResults,
        this.currentPageNo,
        this.limit,
        this.lastPage});

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
