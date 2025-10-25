import 'dart:convert';

import 'package:arafah/features/shop/domain/entities/products_entity.dart';


class ProductsModel {
  final ProductsData? productsData;
  final String? message;
  final dynamic stack;
  final int? statusCode;

  ProductsModel({
    this.productsData,
    this.message,
    this.stack,
    this.statusCode,
  });

  ProductsModel copyWith({
    ProductsData? productsData,
    dynamic message,
    dynamic stack,
    int? statusCode,
  }) =>
      ProductsModel(
        productsData: productsData ?? this.productsData,
        message: message ?? this.message,
        stack: stack ?? this.stack,
        statusCode: statusCode ?? this.statusCode,
      );

  factory ProductsModel.fromRawJson(String str) => ProductsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    productsData: json["data"] == null ? null : ProductsData.fromJson(json["data"]),
    message: json["message"],
    stack: json["stack"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": productsData?.toJson(),
    "message": message,
    "stack": stack,
    "statusCode": statusCode,
  };

  ProductsEntity toEntity()=> ProductsEntity(
    productsData: productsData,
    message: message,
    stack: stack,
    statusCode: statusCode,
  );

}

class ProductsData {
  final List<Product>? products;
  final Meta? meta;

  ProductsData({
    this.products,
    this.meta,
  });

  ProductsData copyWith({
    List<Product>? products,
    Meta? meta,
  }) =>
      ProductsData(
        products: products ?? this.products,
        meta: meta ?? this.meta,
      );

  factory ProductsData.fromRawJson(String str) => ProductsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
    products: json["items"] == null ? [] : List<Product>.from(json["items"]!.map((x) => Product.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "items": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Product {
  final String? id;
  final String? seller;
  final String? name;
  final String? description;
  final List<String>? images;
  final int? totalStock;
  final double? averageRating;
  final int? numReviews;
  final String? category;
  final String? subCategory;
  final String? status;
  final double? minPrice;
  final double? baseMinPrice;
  final int? discount;
  final String? slug;
  final bool? isFreeDelivery;
  final DateTime? createdAt;

  Product({
    this.id,
    this.seller,
    this.name,
    this.description,
    this.images,
    this.totalStock,
    this.averageRating,
    this.numReviews,
    this.category,
    this.subCategory,
    this.status,
    this.minPrice,
    this.baseMinPrice,
    this.discount,
    this.slug,
    this.isFreeDelivery,
    this.createdAt,
  });

  Product copyWith({
    String? id,
    String? seller,
    String? name,
    String? description,
    List<String>? images,
    int? totalStock,
    double? averageRating,
    int? numReviews,
    String? category,
    String? subCategory,
    String? status,
    double? minPrice,
    double? baseMinPrice,
    int? discount,
    String? slug,
    bool? isFreeDelivery,
    DateTime? createdAt,
  }) =>
      Product(
        id: id ?? this.id,
        seller: seller ?? this.seller,
        name: name ?? this.name,
        description: description ?? this.description,
        images: images ?? this.images,
        totalStock: totalStock ?? this.totalStock,
        averageRating: averageRating ?? this.averageRating,
        numReviews: numReviews ?? this.numReviews,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        status: status ?? this.status,
        minPrice: minPrice ?? this.minPrice,
        baseMinPrice: baseMinPrice ?? this.baseMinPrice,
        discount: discount ?? this.discount,
        slug: slug ?? this.slug,
        isFreeDelivery: isFreeDelivery ?? this.isFreeDelivery,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    seller: json["seller"],
    name: json["name"],
    description: json["description"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    totalStock: json["totalStock"],
    averageRating: json["averageRating"]?.toDouble(),
    numReviews: json["numReviews"],
    category: json["category"],
    subCategory: json["subCategory"],
    status: json["status"],
    minPrice: json["minPrice"]?.toDouble(),
    baseMinPrice: json["baseMinPrice"]?.toDouble(),
    discount: json["discount"],
    slug: json["slug"],
    isFreeDelivery: json["isFreeDelivery"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "seller": seller,
    "name": name,
    "description": description,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "totalStock": totalStock,
    "averageRating": averageRating,
    "numReviews": numReviews,
    "category": category,
    "subCategory": subCategory,
    "status": status,
    "minPrice": minPrice,
    "baseMinPrice": baseMinPrice,
    "discount": discount,
    "slug": slug,
    "isFreeDelivery": isFreeDelivery,
    "createdAt": createdAt?.toIso8601String(),
  };
}

class Meta {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPages;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPages,
  });

  Meta copyWith({
    int? page,
    int? limit,
    int? total,
    int? totalPages,
  }) =>
      Meta(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        total: total ?? this.total,
        totalPages: totalPages ?? this.totalPages,
      );

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPages": totalPages,
  };
}
