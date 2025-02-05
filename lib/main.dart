import 'package:aml/feature/into_splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AmlQuran());
}

class AmlQuran extends StatelessWidget {
  const AmlQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
