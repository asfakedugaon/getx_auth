// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<ProductStoreModel> userModelFromJson(String str) => List<ProductStoreModel>.from(json.decode(str).map((x) => ProductStoreModel.fromJson(x)));

String userModelToJson(List<ProductStoreModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductStoreModel {
  String? image;
  String? title;
  String? price;
  String? description;

  ProductStoreModel({
    this.image,
    this.title,
    this.price,
    this.description,
  });

  factory ProductStoreModel.fromJson(Map<String, dynamic> json) => ProductStoreModel(
    image: json["image"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
    "price": price,
    "description": description,
  };
}
