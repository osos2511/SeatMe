import 'package:flutter/material.dart';
import 'package:seatme/core/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.signInRoute,
      onGenerateRoute: RoutesManager.router,
    );
  }
}

