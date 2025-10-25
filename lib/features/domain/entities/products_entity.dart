
import 'package:arafah/features/shop/data/models/produts_model.dart';

class ProductsEntity {
  final ProductsData? productsData;
  final String? message;
  final dynamic stack;
  final int? statusCode;

  ProductsEntity({
    this.productsData,
    this.message,
    this.stack,
    this.statusCode,
  });
}