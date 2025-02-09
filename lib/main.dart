import 'package:aml/core/routes/app_routes.dart';
import 'package:aml/core/routes/routes_name.dart';
import 'package:aml/core/services/sura_services.dart';
import 'package:aml/core/theme/app_theme.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SuraServices.getMostRecently();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(RoutesName.splash)) {
    await prefs.setBool(RoutesName.splash, false);
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(const AmlQuran());
}

class AmlQuran extends StatelessWidget {
  const AmlQuran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
