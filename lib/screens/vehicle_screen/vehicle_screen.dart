import 'package:devnology/provider/vehicles.dart';
import 'package:devnology/utils/app_routes.dart';
import 'package:devnology/widgets/drawer_widget/custom_drawer_widget.dart';
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
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.VEHICLES_FORM);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: CustomDrawer(),
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
