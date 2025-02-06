import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/feature/into_splash/presentation/view/splash_view.dart';
import 'package:aml/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutesName.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RoutesName.onBoarding,
      builder: (context, state) => const OnBoardingView(),
    ),
  ],
);
