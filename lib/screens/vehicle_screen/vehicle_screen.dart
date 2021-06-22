import 'package:devnology/provider/vehicles.dart';
import 'package:devnology/widgets/app_drawer.dart';
import 'package:devnology/widgets/vehicle_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehiclesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vehiclesData = Provider.of<Vehicles>(context);
    final vehicle = vehiclesData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Veículos'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: vehiclesData.vehiclesCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              VehicleItem(vehicle[i]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
