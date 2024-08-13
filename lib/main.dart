import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_review/utils/routes/routes_manage.dart';
import 'package:movie_review/utils/routes/routes_name.dart';
import 'package:movie_review/utils/theme/theme_config.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.darkThemeConfig,
      title: "StreamVibe",
      themeMode: ThemeMode.dark,
      onGenerateRoute: RoutesManage.onGenerateRoutes,
      initialRoute: RoutesName.homeScreen,
    );
  }
}
