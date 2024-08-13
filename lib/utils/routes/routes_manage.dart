import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/utils/routes/routes_name.dart';
import 'package:movie_review/views/home/screen/home_screen.dart';

class RoutesManage {
  RoutesManage._();

  static Map<String, WidgetBuilder> routes({Object? args}) => {
        RoutesName.homeScreen: (context) => const HomeScreen(),
      };

  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    final builder = routes(args: routeSettings.arguments)[routeSettings.name];

    if (builder != null) {
      return MaterialPageRoute(builder: (context) => builder(context));
    } else {
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text(
              "No Such Page",
            ),
          ),
        ),
      );
    }
  }
}
