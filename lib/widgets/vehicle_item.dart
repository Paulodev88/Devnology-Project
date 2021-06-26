import 'package:devnology/provider/vehicle.dart';
import 'package:devnology/utils/app_routes.dart';
import 'package:flutter/material.dart';

class VehicleItem extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleItem(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(vehicle.imageUrl),
      ),
      title: Text(vehicle.modelo),
      subtitle: Text(vehicle.anoFabricacao.toString()),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.VEHICLES_FORM,
                  arguments: vehicle,
                );
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
