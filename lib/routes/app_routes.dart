import 'package:flutter/material.dart';
import 'package:delivery_manager/pages/login_screen.dart';
import 'package:delivery_manager/pages/home_screen.dart';
import 'package:delivery_manager/pages/register_screen.dart';

class AppRoutes {
  static const initialRoute = '/login';

  static final routes = <String, WidgetBuilder>{
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/register': (context) => const RegisterScreen(),
  };
}
