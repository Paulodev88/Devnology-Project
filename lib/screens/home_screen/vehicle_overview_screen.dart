import 'package:devnology/models/vehicle.dart';
import 'package:devnology/widgets/vehicle_item.dart';
import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class VehicleOverviewScreen extends StatelessWidget {
  final List<Vehicle> loadedVehicles = DUMMY_VEHICLE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja de Veículos'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedVehicles.length,
        itemBuilder: (ctx, i) => VehicleItem(loadedVehicles[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
