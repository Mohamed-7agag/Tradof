import 'package:go_router/go_router.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/features/auth/presentation/views/create_account_page_view.dart';
import 'package:tradof/features/auth/presentation/views/forget_password_page_view.dart';
import 'package:tradof/features/auth/presentation/views/login_view.dart';
import 'package:tradof/features/auth/presentation/views/verification_view.dart';
import 'package:tradof/features/freelancer/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';

import '../../welcome_view.dart';
import '../helpers/navigation_handler.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationHandler.navigatorKey,
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
      GoRoute(
        name: Routes.forgetPasswordPageViewRoute,
        path: '/forgetPasswordPageView',
        builder: (context, state) => ForgetPasswordPageView(),
      ),
      GoRoute(
        name: Routes.createAccountPageViewRoute,
        path: '/createAccountPageView',
        builder: (context, state) => CreateAccountPageView(),
      ),
      GoRoute(
        name: Routes.verificationViewRoute,
        path: '/verificationView',
        builder: (context, state) => VerificationView(),
      ),
      GoRoute(
        name: Routes.bottomNavBarViewRoute,
        path: '/bottomNavBarView',
        builder: (context, state) => BottomNavBarView(),
      ),
    ],
  );
}
