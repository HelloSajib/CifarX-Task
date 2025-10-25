import 'package:arafah/core/error/failure.dart';
import 'package:arafah/features/shop/domain/entities/campaigns_entity.dart';
import 'package:arafah/features/shop/domain/entities/categories_entity.dart';
import 'package:arafah/features/shop/domain/entities/products_entity.dart';
import 'package:arafah/features/shop/domain/entities/sub_categories_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ShopRepositories {

  Future<Either<Failure, CampaignsEntity>> getCampaigns();
  Future<Either<Failure, CategoriesEntity>> getCategories();
  Future<Either<Failure, SubCategoriesEntity>> getSubCategories({required String categoryId});
  Future<Either<Failure, ProductsEntity>> getProducts({required Map<String,dynamic> queryParams});

}