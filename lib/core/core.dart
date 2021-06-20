import 'package:devnology/provider/cart.dart';
import 'package:devnology/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_routes.dart';
import '../screens/vehicle_screen/vehicle_detail_screen.dart';
import '../provider/vehicles.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Vehicles(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.lightGreenAccent,
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {AppRoutes.VEHICLE_DETAIL: (ctx) => VehicleDetailScreen()},
      ),
    );
  }
}
