
import 'package:cifarx_task/core/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());
  //sl.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker.instance);
  //sl.registerSingleton<PushNotificationService>(PushNotificationServiceImpl());

  /// Remote DataSource
  //sl.registerLazySingleton<AuthRemoteDatasource>(()=> AuthRemoteDatasourceImpl());

  /// Local DataSource
  //sl.registerSingleton<AuthLocalDatasource>(AuthLocalDatasourceImpl());

  /// Repositories
  // sl.registerLazySingleton<AuthRepositories>(()=> AuthRepositoryIml());
  // sl.registerLazySingleton<AccountRepositories>(()=> AccountRepositoryIml());

  /// UseCases

  /// Shop UseCases
  //sl.registerLazySingleton<GetCampaignsUseCase>(()=> GetCampaignsUseCase());

}