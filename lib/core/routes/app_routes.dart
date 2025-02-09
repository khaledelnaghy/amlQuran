import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/widget/navigator_home.dart';
import 'package:aml/feature/hadith/presentation/view/hadith_details_view.dart';
import 'package:aml/feature/home/presentation/view/home_view.dart';
import 'package:aml/feature/into_splash/presentation/view/splash_view.dart';
import 'package:aml/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:aml/feature/sura_details/sura_details.dart';
import 'package:go_router/go_router.dart';

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
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      // name: 'suraDetails',
      path: RoutesName.suradetails,
      builder: (context, state) => const SuraDetailsView(),
    ),
      GoRoute(
       
      path: RoutesName.hadithDetailsView,
      builder: (context, state) => const HadithDetailsView(),
    ),
  ],
  // builder: (context, state) {
  //    print("Received extra: ${state.extra}");
  //   if (state.extra is SuraModel) {
  //     final SuraModel suraModel = state.extra as SuraModel;
  //     return SuraDetailsView(suraModel: suraModel);
  //   } else {
  //     return const Scaffold(
  //       body: Center(child: Text("حدث خطأ! البيانات غير متوفرة")),
  //     );
  //   }
  // }),
  // redirect: (context, state) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final bool showOnBoarding = prefs.getBool(RoutesName.onBoarding) ?? false;
  //   final bool hasSeenSplash = prefs.getBool(RoutesName.splash) ?? false;
  //   if (!hasSeenSplash) {
  //     return RoutesName.splash;
  //   } else if (!showOnBoarding) {
  //     return RoutesName.onBoarding;
  //   } else {
  //     return RoutesName.navigationView;
  //   }
  // },
);
