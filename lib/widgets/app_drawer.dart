import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bem vindo Devnology!'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.Home);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Vendidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.SALES);
            },
          ),
        ],
      ),
    );
  }
}
