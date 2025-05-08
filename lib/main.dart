import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seatme/core/routes_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor:  Colors.white,appBarTheme: AppBarTheme(color: Colors.white)),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.mainTabsRoute,
      onGenerateRoute: RoutesManager.router,
    );
  });
}
}
