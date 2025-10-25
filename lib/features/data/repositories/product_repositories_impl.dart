import 'package:cifarx_task/config/service_locator/service_locator.dart';
import 'package:cifarx_task/core/error/failure.dart';
import 'package:cifarx_task/features/data/datasource/remote_datasource/products_remote_datasource.dart';
import 'package:cifarx_task/features/domain/entities/products_entity.dart';
import 'package:cifarx_task/features/domain/repositories/products_repositories.dart';
import 'package:dartz/dartz.dart';

class ProductsRepositoryIml implements ProductsRepositories{

  @override
  Future<Either<Failure, ProductsEntity>> getProducts({required Map<String, dynamic> queryParams}) async =>
      await sl<ProductsRemoteDatasource>().getProducts(queryParams: queryParams);

}