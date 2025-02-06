import 'dart:async';

import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        opacity = opacity == 1.0 ? 0.3 : 1.0;
      });
    });
    Timer(Duration(seconds: 3), () {
      context.push(RoutesName.onBoarding);
    });
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
