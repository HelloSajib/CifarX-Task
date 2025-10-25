import 'package:arafah/config/service_locator/service_locator.dart';
import 'package:arafah/core/error/failure.dart';
import 'package:arafah/core/usecase/usecase.dart';
import 'package:arafah/features/shop/domain/entities/categories_entity.dart';
import 'package:arafah/features/shop/domain/repositories/shop_repositories.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUseCase extends UseCase<CategoriesEntity, dynamic>{

  @override
  Future<Either<Failure, CategoriesEntity>> call({params}) async =>
      await sl<ShopRepositories>().getCategories();

}