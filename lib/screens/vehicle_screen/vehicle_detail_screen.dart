import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Vehicle vehicle =
        ModalRoute.of(context)!.settings.arguments as Vehicle;
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicle.modelo),
      ),
    );
  }
}
