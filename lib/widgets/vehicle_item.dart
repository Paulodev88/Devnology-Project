import 'package:devnology/provider/vehicle.dart';
import 'package:devnology/provider/vehicles.dart';
import 'package:devnology/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Tem certeza?'),
                    content: Text('Quer remover o veículo?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<Vehicles>(context, listen: false)
                              .deleteVehicle(vehicle.id!);
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          'Sim',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
