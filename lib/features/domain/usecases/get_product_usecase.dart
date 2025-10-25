import 'package:arafah/config/service_locator/service_locator.dart';
import 'package:arafah/core/error/failure.dart';
import 'package:arafah/core/usecase/usecase.dart';
import 'package:arafah/features/shop/domain/entities/products_entity.dart';
import 'package:arafah/features/shop/domain/repositories/shop_repositories.dart';
import 'package:dartz/dartz.dart';

class GetProductUseCase extends UseCase<ProductsEntity, Map<String, dynamic>>{
  @override
  Future<Either<Failure, ProductsEntity>> call({Map<String, dynamic>? params}) async =>
      await sl<ShopRepositories>().getProducts(queryParams: params ?? {});
}