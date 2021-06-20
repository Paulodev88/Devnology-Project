import 'package:devnology/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import '../screens/vehicle_screen/vehicle_detail_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreenAccent,
        fontFamily: 'Lato',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {AppRoutes.VEHICLE_DETAIL: (ctx) => VehicleDetailScreen()},
    );
  }
}
