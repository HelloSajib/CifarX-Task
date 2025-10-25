
import 'package:cifarx_task/core/network/dio_client.dart';
import 'package:cifarx_task/features/products/data/datasource/remote_datasource/products_remote_datasource.dart';
import 'package:cifarx_task/features/products/data/repositories/product_repositories_impl.dart';
import 'package:cifarx_task/features/products/domain/repositories/products_repositories.dart';
import 'package:cifarx_task/features/products/domain/usecases/get_products_usecase.dart';
import 'package:cifarx_task/features/products/domain/usecases/search_products_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());

  /// Remote DataSource
  sl.registerLazySingleton<ProductsRemoteDatasource>(()=> ProductsRemoteDatasourceImpl());

  /// Repositories
  sl.registerLazySingleton<ProductsRepositories>(()=> ProductsRepositoryIml());

  /// UseCases
  /// Shop UseCases
  sl.registerLazySingleton<GetProductsUseCase>(()=> GetProductsUseCase());
  sl.registerLazySingleton<SearchProductsUseCase>(()=> SearchProductsUseCase());

}