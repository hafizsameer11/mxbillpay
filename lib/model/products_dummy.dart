class ProductsDummy{
  var id;
  var value;
  String? image;
  String? title;
  String? subtitle;
  String? productName;
  String? productPrice;
  String? productSpecs;


  ProductsDummy(this.id, this.value, this.image, this.title, this.subtitle,
      this.productName, this.productPrice, this.productSpecs);

  ProductsDummy.fromJson(Map json) {
    id = json['id'];
    value = json['value'];
    image = json['image'];
    title = json['title'];
    subtitle    = json['subtitle'];
    productName =json['productName'];
    productPrice=json['productPrice'];
    productSpecs=json['productSpecs'];
  }

  Map toJson() {
    final Map data = new Map();
    data['id'] = this.id;
    data['value'] = this.value;
    data['image'] = this.image;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['productName']=this.productName;
    data['productPrice']=this.productPrice;
    data['productSpecs']=this.productSpecs;
    return data;
  }
}