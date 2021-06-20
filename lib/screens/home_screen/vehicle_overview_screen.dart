import 'package:devnology/widgets/vehicle_grid.dart';
import 'package:flutter/material.dart';

class VehicleOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja de Veículos'),
      ),
      body: VehicleGrid(),
    );
  }
}
