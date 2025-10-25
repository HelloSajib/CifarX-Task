
import 'package:cifarx_task/features/data/models/produts_model.dart';

class ProductsEntity {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductsEntity({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });
}