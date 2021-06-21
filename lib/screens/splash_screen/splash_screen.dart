import 'package:devnology/screens/overview_screen/vehicle_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: VehicleOverviewScreen(),
      duration: 4000,
      imageSize: 130,
      imageSrc: "assets/images/devnology.png",
      text: "Devnology Car",
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
        color: Colors.grey[600],
      ),
      backgroundColor: Colors.white,
    );
  }
}
