// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
  };
}
