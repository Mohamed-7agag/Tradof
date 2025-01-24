import 'package:go_router/go_router.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/features/auth/presentation/views/login_view.dart';

import '../../welcome_view.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/welcomeView',
    routes: [
      GoRoute(
        name: Routes.welcomeViewRoute,
        path: '/welcomeView',
        builder: (context, state) => WelcomeView(),
      ),
      GoRoute(
        name: Routes.loginViewRoute,
        path: '/loginView',
        builder: (context, state) => LoginView(),
      ),
    ],
  );
}
