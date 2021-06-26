import 'package:devnology/provider/cart.dart';
import 'package:devnology/utils/app_routes.dart';
import 'package:devnology/widgets/badge.dart';
import 'package:devnology/widgets/drawer_widget/custom_drawer_widget.dart';
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
              value: cart.itemsCount.toString(),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
                icon: Icon(Icons.shopping_cart_rounded),
              ),
            ),
          )
        ],
      ),
      body: VehicleGrid(),
      drawer: CustomDrawer(),
    );
  }
}
