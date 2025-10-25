
import 'package:cifarx_task/config/service_locator/service_locator.dart';
import 'package:cifarx_task/core/error/failure.dart';
import 'package:cifarx_task/core/usecase/usecase.dart';
import 'package:cifarx_task/features/products/domain/entities/products_entity.dart';
import 'package:cifarx_task/features/products/domain/repositories/products_repositories.dart';
import 'package:dartz/dartz.dart';

class SearchProductsUseCase extends UseCase<ProductsEntity, Map<String, dynamic>>{

  @override
  Future<Either<Failure, ProductsEntity>> call({Map<String, dynamic>? params}) async =>
      await sl<ProductsRepositories>().searchProducts(queryParams: params ?? {});

}