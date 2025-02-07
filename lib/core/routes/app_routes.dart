import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/widget/navigator_home.dart';
import 'package:aml/feature/home/presentation/view/home_view.dart';
import 'package:aml/feature/into_splash/presentation/view/splash_view.dart';
import 'package:aml/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutesName.splash,
  routes: [
    GoRoute(
      path: RoutesName.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutesName.onBoarding,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: RoutesName.navigationView,
      builder: (context, state) => const NavigatorView(),
    ),
    GoRoute(
      path: RoutesName.homeView,
      builder: (context, state) =>   HomeView(),
    ),
  ],
  redirect: (context, state) async {
    final prefs = await SharedPreferences.getInstance();
    final bool showOnBoarding = prefs.getBool(RoutesName.onBoarding) ?? false;
    final bool hasSeenSplash = prefs.getBool(RoutesName.splash) ?? false;
    if (!hasSeenSplash) {
      return RoutesName.splash;
    } else if (!showOnBoarding) {
      return RoutesName.onBoarding;
    } else {
      return RoutesName.navigationView;
    }
  },
);
