
import 'dart:developer';
import 'package:cifarx_task/config/service_locator/service_locator.dart';
import 'package:cifarx_task/core/constants/api_urls.dart';
import 'package:cifarx_task/core/error/failure.dart';
import 'package:cifarx_task/core/network/dio_client.dart';
import 'package:cifarx_task/features/data/models/produts_model.dart';
import 'package:cifarx_task/features/domain/entities/products_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

sealed class ProductsRemoteDatasource {

  Future<Either<Failure, ProductsEntity>> getProducts({required Map<String,dynamic> queryParams});

}

class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource{


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
          "Products Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }



}