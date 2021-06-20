import 'package:devnology/models/vehicle.dart';
import 'package:devnology/utils/app_routes.dart';
import 'package:flutter/material.dart';

class VehicleItem extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleItem(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.VEHICLE_DETAIL,
              arguments: vehicle,
            );
          },
          child: Image.network(
            vehicle.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            vehicle.modelo,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
