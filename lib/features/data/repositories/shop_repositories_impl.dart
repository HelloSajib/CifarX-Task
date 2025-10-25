import 'package:arafah/config/service_locator/service_locator.dart';
import 'package:arafah/core/error/failure.dart';
import 'package:arafah/features/shop/data/datasource/remote_datasource/shop_remote_datasource.dart';
import 'package:arafah/features/shop/domain/entities/campaigns_entity.dart';
import 'package:arafah/features/shop/domain/entities/categories_entity.dart';
import 'package:arafah/features/shop/domain/entities/products_entity.dart';
import 'package:arafah/features/shop/domain/entities/sub_categories_entity.dart';
import 'package:arafah/features/shop/domain/repositories/shop_repositories.dart';
import 'package:dartz/dartz.dart';

class ShopRepositoryIml implements ShopRepositories{

  @override
  Future<Either<Failure, CampaignsEntity>> getCampaigns() async =>
      await sl<ShopRemoteDatasource>().getCampaigns();

  @override
  Future<Either<Failure, CategoriesEntity>> getCategories() async =>
      await sl<ShopRemoteDatasource>().getCategories();

  @override
  Future<Either<Failure, SubCategoriesEntity>> getSubCategories({required String categoryId}) async =>
      await sl<ShopRemoteDatasource>().getSubCategories(categoryId: categoryId);


  @override
  Future<Either<Failure, ProductsEntity>> getProducts({required Map<String, dynamic> queryParams}) async =>
      await sl<ShopRemoteDatasource>().getProducts(queryParams: queryParams);


}