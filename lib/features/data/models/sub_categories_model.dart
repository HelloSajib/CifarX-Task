import 'dart:convert';

import 'package:arafah/features/shop/domain/entities/sub_categories_entity.dart';


class SubCategoriesModel {
  final List<SubCategory>? subCategories;
  final String? message;
  final dynamic stack;
  final int? statusCode;

  SubCategoriesModel({
    this.subCategories,
    this.message,
    this.stack,
    this.statusCode,
  });

  SubCategoriesModel copyWith({
    List<SubCategory>? subCategories,
    String? message,
    dynamic stack,
    int? statusCode,
  }) =>
      SubCategoriesModel(
        subCategories: subCategories ?? this.subCategories,
        message: message ?? this.message,
        stack: stack ?? this.stack,
        statusCode: statusCode ?? this.statusCode,
      );

  factory SubCategoriesModel.fromRawJson(String str) => SubCategoriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) => SubCategoriesModel(
    subCategories: json["data"] == null ? [] : List<SubCategory>.from(json["data"]!.map((x) => SubCategory.fromJson(x))),
    message: json["message"],
    stack: json["stack"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
    "message": message,
    "stack": stack,
    "statusCode": statusCode,
  };

  SubCategoriesEntity toEntity()=> SubCategoriesEntity(
    subCategories: subCategories,
    message: message,
    stack: stack,
    statusCode: statusCode,
  );

}

class SubCategory {
  final String? id;
  final String? category;
  final String? name;
  final String? icon;
  final String? status;
  final DateTime? createdAt;

  SubCategory({
    this.id,
    this.category,
    this.name,
    this.icon,
    this.status,
    this.createdAt,
  });

  SubCategory copyWith({
    String? id,
    String? category,
    String? name,
    String? icon,
    String? status,
    DateTime? createdAt,
  }) =>
      SubCategory(
        id: id ?? this.id,
        category: category ?? this.category,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );

  factory SubCategory.fromRawJson(String str) => SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["_id"],
    category: json["category"],
    name: json["name"],
    icon: json["icon"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category,
    "name": name,
    "icon": icon,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
  };
}
