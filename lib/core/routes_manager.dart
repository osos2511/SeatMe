import 'package:flutter/material.dart';
import 'package:seatme/presentation/screens/auth/enter_email_phone.dart';
import 'package:seatme/presentation/screens/auth/otp.dart';
import 'package:seatme/presentation/screens/auth/reset_pass.dart';
import 'package:seatme/presentation/screens/auth/sign_in.dart';
import 'package:seatme/presentation/screens/auth/sign_up.dart';


class RoutesManager {
  static const String signUpRoute = '/SignUp';
  static const String signInRoute = '/';
    static const String otpRoute = '/otp';
      static const String enter_email_code_Route = '/enter_email_code';
            static const String reset_pass_Route = '/reset_pass_code';




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
          case enter_email_code_Route:
        {
          return MaterialPageRoute(
              builder: (context) =>enteremailorpass());
        }
        case otpRoute:
        {
          return MaterialPageRoute(
              builder: (context) =>Otp());
        }
         case reset_pass_Route:
        {
          return MaterialPageRoute(
              builder: (context) =>ResetPass());
        }

       
        

    }
    return null;
    
  }
}
