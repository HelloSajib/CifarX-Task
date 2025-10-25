import 'package:cifarx_task/config/routes/router_transition.dart';
import 'package:cifarx_task/features/auth/presentation/pages/sign_in_page.dart';
import 'package:go_router/go_router.dart';


class AuthRouter {
  AuthRouter._();

  static final List<GoRoute> routes = [


    /// LogIn Page Route
    GoRoute(
        path: SignInPage.path,
        name: SignInPage.name,
        pageBuilder: (context, state){
          return CustomTransitionPage(
              key: state.pageKey,
              child: SignInPage(),
              transitionsBuilder: routerTransition
          );
        }
    ),

  ];

}