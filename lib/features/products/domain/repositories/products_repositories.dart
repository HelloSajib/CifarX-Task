import 'package:cifarx_task/core/error/failure.dart';
import 'package:cifarx_task/features/products/domain/entities/products_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepositories {
  Future<Either<Failure, ProductsEntity>> getProducts({required Map<String,dynamic> queryParams});
  Future<Either<Failure, ProductsEntity>> searchProducts({required Map<String,dynamic> queryParams});
}