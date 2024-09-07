


class ItemDataModel {
  var id;
  var value;
  String? image;
  String? title;
  String? subtitle;

  ItemDataModel({this.id, this.value, this.image, this.title, this.subtitle});

  ItemDataModel.fromJson(Map json) {
    id = json['id'];
    value = json['value'];
    image = json['image'];
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map toJson() {
    final Map data = new Map();
    data['id'] = this.id;
    data['value'] = this.value;
    data['image'] = this.image;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    return data;
  }
}

