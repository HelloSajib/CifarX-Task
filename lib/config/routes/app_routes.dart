import 'package:cifarx_task/config/routes/route_error_page.dart';
import 'package:cifarx_task/features/products/presentation/pages/products_page.dart';
import 'package:cifarx_task/features/products/products_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class AppRouter {
  AppRouter._(); // Private constructor to prevent instantiation

  /// Create GoRouter instance
  static final GoRouter routes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: ProductsPage.path, // Default route
    debugLogDiagnostics: true,
    errorBuilder: (context,state)=> ErrorPage(state: state),
    redirect: (BuildContext context, GoRouterState state){
      return null;
    },
    routes: [

      /// Products Routes
      ...ProductsRouter.routes,

    ]
  );
}
