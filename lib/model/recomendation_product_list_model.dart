class RecomendationProductListModel {
  final int? id;
  final String? productImage;
  final String? productName;
  final String? productType;

  RecomendationProductListModel({
    this.id,
    this.productImage,
    this.productName,
    this.productType,
  });

  factory RecomendationProductListModel.fromJson(Map<String, dynamic> json) => RecomendationProductListModel(
    id: json["id"],
    productImage: json["product_image"],
    productName: json["product_name"],
    productType: json["product_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_image": productImage,
    "product_name": productName,
    "product_type": productType,
  };
}
