import 'dart:convert';

import 'package:arafah/features/shop/domain/entities/categories_entity.dart';


class CategoriesModel {
  final List<Category>? categories;
  final String? message;
  final dynamic stack;
  final int? statusCode;

  CategoriesModel({
    this.categories,
    this.message,
    this.stack,
    this.statusCode,
  });

  CategoriesModel copyWith({
    List<Category>? categories,
    String? message,
    dynamic stack,
    int? statusCode,
  }) =>
      CategoriesModel(
        categories: categories ?? this.categories,
        message: message ?? this.message,
        stack: stack ?? this.stack,
        statusCode: statusCode ?? this.statusCode,
      );

  factory CategoriesModel.fromRawJson(String str) => CategoriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    categories: json["data"] == null ? [] : List<Category>.from(json["data"]!.map((x) => Category.fromJson(x))),
    message: json["message"],
    stack: json["stack"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "message": message,
    "stack": stack,
    "statusCode": statusCode,
  };

  CategoriesEntity toEntity()=> CategoriesEntity(
    categories: categories,
    message: message,
    stack: stack,
    statusCode: statusCode,
  );

}

class Category {
  final String? id;
  final String? name;
  final String? icon;
  final String? status;
  final DateTime? createdAt;

  Category({
    this.id,
    this.name,
    this.icon,
    this.status,
    this.createdAt,
  });

  Category copyWith({
    String? id,
    String? name,
    String? icon,
    String? status,
    DateTime? createdAt,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    icon: json["icon"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "icon": icon,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
  };
}
