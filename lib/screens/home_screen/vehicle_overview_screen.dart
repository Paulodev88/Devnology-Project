import 'package:devnology/provider/cart.dart';
import 'package:devnology/widgets/badge.dart';
import 'package:devnology/widgets/vehicle_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja de Veículos'),
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, child) => Badge(
              value: cart.itemCount.toString(),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_rounded),
              ),
            ),
          )
        ],
      ),
      body: VehicleGrid(),
    );
  }
}
