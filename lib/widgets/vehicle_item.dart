import 'package:devnology/provider/cart.dart';
import 'package:devnology/provider/vehicle.dart';
import 'package:devnology/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Vehicle vehicle = Provider.of<Vehicle>(context, listen: true);
    final Cart cart = Provider.of<Cart>(context, listen: false);

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
            icon: Icon(vehicle.isSelected
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined),
            onPressed: () {
              vehicle.selected();
              cart.addItem(vehicle);
              print(cart.itemsCount);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
