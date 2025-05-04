import 'package:flutter/material.dart';
import 'package:seatme/presentation/screens/auth/sign_in.dart';
import 'package:seatme/presentation/screens/auth/sign_up.dart';


class RoutesManager {
  static const String signUpRoute = '/SignUp';
  static const String signInRoute = '/';



  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {


      case signUpRoute:
        {
          return MaterialPageRoute(
              builder: (context) =>SignUp());
        }

        case signInRoute:
        {
          return MaterialPageRoute(
              builder: (context) =>SignIn());
        }


    }
  }
}
