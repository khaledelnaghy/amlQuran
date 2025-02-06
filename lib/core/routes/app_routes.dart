import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/feature/home/presentation/view/home_view.dart';
import 'package:aml/feature/into_splash/presentation/view/splash_view.dart';
import 'package:aml/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutesName.splash,
  redirect: (context, state) async {
    final prefs = await SharedPreferences.getInstance();
    final bool? showOnBoarding = prefs.getBool(RoutesName.onBoarding);
    print("showOnBoarding: $showOnBoarding");
    if (showOnBoarding == null || !showOnBoarding) {
      return RoutesName.onBoarding;
    }
    return RoutesName.homeView;
  },
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
      path: RoutesName.homeView,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
