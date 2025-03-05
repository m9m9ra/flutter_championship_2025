import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/screens/build_screen.dart';
import 'package:matule/layers/presentation/screens/details_screen.dart';
import 'package:matule/layers/presentation/screens/favorite_screen.dart';
import 'package:matule/layers/presentation/screens/home_screen.dart';
import 'package:matule/layers/presentation/screens/notification_screen.dart';
import 'package:matule/layers/presentation/screens/onboarding_screen.dart';
import 'package:matule/layers/presentation/screens/popular_screen.dart';
import 'package:matule/layers/presentation/screens/search_screen.dart';
import 'package:matule/layers/presentation/screens/signin_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RouterAppConfig {
  bool isInit = false;
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final supabase = Supabase.instance.client;
  // final NavigatorState _sectionANavigatorKey = NavigatorState();

  GoRouter get router => GoRouter(
          initialLocation: "/onboarding",
          navigatorKey: _rootNavigatorKey,
          redirect: (context, state) {
            if (!isInit) {
              isInit = true;
              if (supabase.auth.currentUser != null) {
                print(supabase.auth.currentUser);
                // return '/details';
                return '/home';
              }
            }
            return state.fullPath;
          },
          routes: [
            StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) => BuildScreen(
                      navigationShell: navigationShell,
                    ),
                branches: [
                  StatefulShellBranch(routes: [
                    GoRoute(
                      path: '/home',
                      builder: (context, state) => const HomeScreen(),
                    )
                  ]),StatefulShellBranch(routes: [
                    GoRoute(
                      path: '/favorite',
                      builder: (context, state) => const FavoriteScreen(),
                    )
                  ]),StatefulShellBranch(routes: [
                    GoRoute(
                      path: '/notification',
                      builder: (context, state) => const NotificationScreen(),
                    )
                  ]),StatefulShellBranch(routes: [
                    GoRoute(
                      path: '/profile',
                      builder: (context, state) => const HomeScreen(),
                    )
                  ]),
                ]),
            GoRoute(
              path: '/onboarding',
              builder: (context, state) => const OnboardingScreen(),
            ),
            GoRoute(
              path: '/signin',
              builder: (context, state) => const SigninScreen(),
            ),
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchScreen(),
            ),
            GoRoute(
              path: '/popular',
              builder: (context, state) => const PopularScreen(),
            ),
            GoRoute(
              path: '/details',
              builder: (context, state) => const DetailsScreen(),
            ),
          ]);
}
