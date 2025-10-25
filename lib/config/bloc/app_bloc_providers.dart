
import 'package:cifarx_task/features/presentation/bloc/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  const AppBlocProviders._();

  /// All Bloc Providers are created here
  static List<BlocProvider> get providers => [
    BlocProvider<ProductsBloc>(create: (context)=> ProductsBloc()),
  ];

}
