import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(builder: (_) => OnBoardScreen());
      case '/login':
        // return MaterialPageRoute(builder: (_) => Register());
      case '/moredetails':
        // return MaterialPageRoute(builder: (_) => HomeScreen());


        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Text('No available routes');
    });
  }
}
