import 'package:arafah/config/service_locator/service_locator.dart';
import 'package:arafah/core/error/failure.dart';
import 'package:arafah/core/usecase/usecase.dart';
import 'package:arafah/features/shop/domain/entities/sub_categories_entity.dart';
import 'package:arafah/features/shop/domain/repositories/shop_repositories.dart';
import 'package:dartz/dartz.dart';

class GetSubCategoriesUseCase extends UseCase<SubCategoriesEntity, String>{

  @override
  Future<Either<Failure, SubCategoriesEntity>> call({String? params}) async =>
      await sl<ShopRepositories>().getSubCategories(categoryId: params ?? "");

}