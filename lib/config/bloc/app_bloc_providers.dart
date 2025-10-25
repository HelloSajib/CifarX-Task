
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  const AppBlocProviders._();

  /// All Bloc Providers are created here
  static List<BlocProvider> get providers => [
    //BlocProvider<InternetConnectivityCubit>(create: (context)=> InternetConnectivityCubit()..connectivityChecker()),
    // BlocProvider<OnboardingCubit>(create: (context)=> OnboardingCubit()..userAlreadyOnboarded()),

    // BlocProvider<AuthBloc>(create: (context)=> AuthBloc()..add(GetAuthEntity()), lazy: false),
    // BlocProvider<AccountBloc>(create: (context)=> AccountBloc(), lazy: false),
    // BlocProvider<ShopBloc>(create: (context)=> ShopBloc()..add(InitialEvent()), lazy: false),
    // BlocProvider<ProductDetailsBloc>(create: (context)=> ProductDetailsBloc()),
    // BlocProvider<CartsBloc>(create: (context)=> CartsBloc()),
    // BlocProvider<FavouritesBloc>(create: (context)=> FavouritesBloc()..add(GetFavouriteProducts()), lazy: false),
    // BlocProvider<AccountBloc>(create: (context)=> AccountBloc()),
    // BlocProvider<ShippingAddressBloc>(create: (context)=> ShippingAddressBloc()..add(GetShippingAddresses())),
    // BlocProvider<CheckoutBloc>(create: (context)=> CheckoutBloc()),
    // BlocProvider<OrdersBloc>(create: (context)=> OrdersBloc()),
    // BlocProvider<NotificationsBloc>(create: (context)=> NotificationsBloc()),

  ];
}
