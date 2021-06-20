import 'package:devnology/provider/vehicles.dart';
import 'package:devnology/widgets/vehicle_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vehiclesProvider = Provider.of<Vehicles>(context);
    final vehicles = vehiclesProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: vehicles.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (BuildContext context) => vehicles[i], child: VehicleItem()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
