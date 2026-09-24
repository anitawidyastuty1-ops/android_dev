// To parse this JSON data, do
//
//     final productModels = productModelsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

import 'dart:convert';

part 'product_models.g.dart';

ProductModels productModelsFromJson(String str) =>
    ProductModels.fromJson(json.decode(str));

String productModelsToJson(ProductModels data) => json.encode(data.toJson());

@JsonSerializable()
class ProductModels {
  @JsonKey(name: "products")
  final List<Product>? products;
  @JsonKey(name: "total")
  final int? total;
  @JsonKey(name: "skip")
  final int? skip;
  @JsonKey(name: "limit")
  final int? limit;

  ProductModels({this.products, this.total, this.skip, this.limit});

  factory ProductModels.fromJson(Map<String, dynamic> json) =>
      _$ProductModelsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelsToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "category")
  final Category? category;
  @JsonKey(name: "price")
  final double? price;
  @JsonKey(name: "discountPercentage")
  final double? discountPercentage;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "stock")
  final int? stock;
  @JsonKey(name: "tags")
  final List<String>? tags;
  @JsonKey(name: "brand")
  final String? brand;
  @JsonKey(name: "sku")
  final String? sku;
  @JsonKey(name: "weight")
  final int? weight;
  @JsonKey(name: "dimensions")
  final Dimensions? dimensions;
  @JsonKey(name: "warrantyInformation")
  final String? warrantyInformation;
  @JsonKey(name: "shippingInformation")
  final String? shippingInformation;
  @JsonKey(name: "availabilityStatus")
  final AvailabilityStatus? availabilityStatus;
  @JsonKey(name: "reviews")
  final List<Review>? reviews;
  @JsonKey(name: "returnPolicy")
  final ReturnPolicy? returnPolicy;
  @JsonKey(name: "minimumOrderQuantity")
  final int? minimumOrderQuantity;
  @JsonKey(name: "meta")
  final Meta? meta;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "thumbnail")
  final String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

enum AvailabilityStatus {
  @JsonValue("In Stock")
  IN_STOCK,
  @JsonValue("Low Stock")
  LOW_STOCK,
}

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.IN_STOCK,
  "Low Stock": AvailabilityStatus.LOW_STOCK,
});

enum Category {
  @JsonValue("beauty")
  BEAUTY,
  @JsonValue("fragrances")
  FRAGRANCES,
  @JsonValue("furniture")
  FURNITURE,
  @JsonValue("groceries")
  GROCERIES,
}

final categoryValues = EnumValues({
  "beauty": Category.BEAUTY,
  "fragrances": Category.FRAGRANCES,
  "furniture": Category.FURNITURE,
  "groceries": Category.GROCERIES,
});

@JsonSerializable()
class Dimensions {
  @JsonKey(name: "width")
  final double? width;
  @JsonKey(name: "height")
  final double? height;
  @JsonKey(name: "depth")
  final double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "barcode")
  final String? barcode;
  @JsonKey(name: "qrCode")
  final String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

enum ReturnPolicy {
  @JsonValue("No return policy")
  NO_RETURN_POLICY,
  @JsonValue("30 days return policy")
  THE_30_DAYS_RETURN_POLICY,
  @JsonValue("60 days return policy")
  THE_60_DAYS_RETURN_POLICY,
  @JsonValue("7 days return policy")
  THE_7_DAYS_RETURN_POLICY,
  @JsonValue("90 days return policy")
  THE_90_DAYS_RETURN_POLICY,
}

final returnPolicyValues = EnumValues({
  "No return policy": ReturnPolicy.NO_RETURN_POLICY,
  "30 days return policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
  "60 days return policy": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
  "7 days return policy": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
  "90 days return policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY,
});

@JsonSerializable()
class Review {
  @JsonKey(name: "rating")
  final int? rating;
  @JsonKey(name: "comment")
  final String? comment;
  @JsonKey(name: "date")
  final DateTime? date;
  @JsonKey(name: "reviewerName")
  final String? reviewerName;
  @JsonKey(name: "reviewerEmail")
  final String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
