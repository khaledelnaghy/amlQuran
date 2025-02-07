import 'dart:async';
import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> navigate() async {
    await Future.delayed(Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    final bool? showOnBoarding = prefs.getBool(RoutesName.onBoarding);
    if (mounted) {
      if (showOnBoarding == null || !showOnBoarding) {
        context.go(RoutesName.onBoarding);
      } else {
        context.go(RoutesName.navigationView);
      }
    }
    await prefs.setBool(RoutesName.splash, true);
  }

  Timer? timer;
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();
    navigate();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          opacity = opacity == 1.0 ? 0.3 : 1.0;
        });
      }
    });
    // Timer.periodic(const Duration(milliseconds: 500), (timer) {
    //   setState(() {
    //     opacity = opacity == 1.0 ? 0.3 : 1.0;
    //   });
    // });
    // Timer(Duration(seconds: 3), () {
    //   context.push(RoutesName.onBoarding);
    // });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAsset.splahView,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: opacity,
            curve: Curves.ease,
            child: Image.asset(AppAsset.splahKa3ba),
          ),
        ],
      ),
    );
  }
}
