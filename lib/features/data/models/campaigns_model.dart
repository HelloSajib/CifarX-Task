import 'dart:convert';

import 'package:arafah/features/shop/domain/entities/campaigns_entity.dart';

class CampaignsModel {
  final List<Campaign>? campaigns;
  final String? message;
  final dynamic stack;
  final int? statusCode;

  CampaignsModel({
    this.campaigns,
    this.message,
    this.stack,
    this.statusCode,
  });

  CampaignsModel copyWith({
    List<Campaign>? campaigns,
    String? message,
    dynamic stack,
    int? statusCode,
  }) =>
      CampaignsModel(
        campaigns: campaigns ?? this.campaigns,
        message: message ?? this.message,
        stack: stack ?? this.stack,
        statusCode: statusCode ?? this.statusCode,
      );

  factory CampaignsModel.fromRawJson(String str) => CampaignsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CampaignsModel.fromJson(Map<String, dynamic> json) => CampaignsModel(
    campaigns: json["data"] == null ? [] : List<Campaign>.from(json["data"]!.map((x) => Campaign.fromJson(x))),
    message: json["message"],
    stack: json["stack"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": campaigns == null ? [] : List<dynamic>.from(campaigns!.map((x) => x.toJson())),
    "message": message,
    "stack": stack,
    "statusCode": statusCode,
  };

  CampaignsEntity toEntity()=> CampaignsEntity(
    campaigns: campaigns,
    message: message,
    stack: stack,
    statusCode: statusCode,
  );

}

class Campaign {
  final String? id;
  final String? title;
  final String? banner;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? type;
  final int? minSpent;
  final int? discountPercent;
  final String? status;
  final DateTime? createdAt;

  Campaign({
    this.id,
    this.title,
    this.banner,
    this.description,
    this.startDate,
    this.endDate,
    this.type,
    this.minSpent,
    this.discountPercent,
    this.status,
    this.createdAt,
  });

  Campaign copyWith({
    String? id,
    String? title,
    String? banner,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? type,
    int? minSpent,
    int? discountPercent,
    String? status,
    DateTime? createdAt,
  }) =>
      Campaign(
        id: id ?? this.id,
        title: title ?? this.title,
        banner: banner ?? this.banner,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        type: type ?? this.type,
        minSpent: minSpent ?? this.minSpent,
        discountPercent: discountPercent ?? this.discountPercent,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Campaign.fromRawJson(String str) => Campaign.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
    id: json["_id"],
    title: json["title"],
    banner: json["banner"],
    description: json["description"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    type: json["type"],
    minSpent: json["minSpent"],
    discountPercent: json["discountPercent"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "banner": banner,
    "description": description,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "type": type,
    "minSpent": minSpent,
    "discountPercent": discountPercent,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
  };
}
