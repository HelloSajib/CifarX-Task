import 'package:cifarx_task/config/routes/router_transition.dart';
import 'package:cifarx_task/features/presentation/pages/products_page.dart';
import 'package:go_router/go_router.dart';

class ProductsRouter {
  ProductsRouter._();

  static final List<GoRoute> routes = [

    /// Shop Page Route
    GoRoute(
      path: ProductsPage.path,
      name: ProductsPage.name,
      pageBuilder: (context,state ){
        return CustomTransitionPage<void>(
            key: state.pageKey,
            child: ProductsPage(),
            transitionsBuilder: routerTransition
        );
      },
    ),

  ];

}