
import 'dart:developer';

import 'package:arafah/config/service_locator/service_locator.dart';
import 'package:arafah/core/constants/api_urls.dart';
import 'package:arafah/core/error/failure.dart';
import 'package:arafah/core/network/dio_client.dart';
import 'package:arafah/features/shop/data/models/campaigns_model.dart';
import 'package:arafah/features/shop/data/models/categories_model.dart';
import 'package:arafah/features/shop/data/models/produts_model.dart';
import 'package:arafah/features/shop/data/models/sub_categories_model.dart';
import 'package:arafah/features/shop/domain/entities/campaigns_entity.dart';
import 'package:arafah/features/shop/domain/entities/categories_entity.dart';
import 'package:arafah/features/shop/domain/entities/products_entity.dart';
import 'package:arafah/features/shop/domain/entities/sub_categories_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

sealed class ShopRemoteDatasource {
  Future<Either<Failure, CampaignsEntity>> getCampaigns();
  Future<Either<Failure, CategoriesEntity>> getCategories();
  Future<Either<Failure, SubCategoriesEntity>> getSubCategories({required String categoryId});
  Future<Either<Failure, ProductsEntity>> getProducts({required Map<String,dynamic> queryParams});
}

class ShopRemoteDatasourceImpl implements ShopRemoteDatasource{


  @override
  Future<Either<Failure, CampaignsEntity>> getCampaigns() async {
    try{

      Response response = await sl<DioClient>().get(
          ApiUrls.campaigns
      );

      CampaignsEntity campaignsEntity = CampaignsModel.fromJson(response.data).toEntity();
      return Right(campaignsEntity);

    }catch(error, stackTrace){
      log(
          "Shop Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }



  @override
  Future<Either<Failure, CategoriesEntity>> getCategories() async {
    try{

      Response response = await sl<DioClient>().get(
          ApiUrls.categories
      );

      CategoriesEntity categoriesEntity = CategoriesModel.fromJson(response.data).toEntity();
      return Right(categoriesEntity);

    }catch(error, stackTrace){
      log(
          "Shop Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, SubCategoriesEntity>> getSubCategories({required String categoryId}) async {
    try{

      Response response = await sl<DioClient>().get(
          ApiUrls.subCategories,
          queryParameters: {"category": categoryId}
      );

      SubCategoriesEntity subCategoriesEntity = SubCategoriesModel.fromJson(response.data).toEntity();
      return Right(subCategoriesEntity);

    }catch(error, stackTrace){
      log(
          "Shop Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, ProductsEntity>> getProducts({required Map<String, dynamic> queryParams}) async {
    try{
      Response response = await sl<DioClient>().get(
          ApiUrls.products,
          queryParameters: queryParams
      );
      ProductsEntity productsEntity = ProductsModel.fromJson(response.data).toEntity();
      return Right(productsEntity);

    }catch(error, stackTrace){
      log(
          "Shop Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


}