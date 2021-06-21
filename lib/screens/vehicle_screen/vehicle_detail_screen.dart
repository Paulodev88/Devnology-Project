import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Vehicle vehicle =
        ModalRoute.of(context)!.settings.arguments as Vehicle;
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicle.modelo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                vehicle.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'R\$ ${vehicle.valorVenda}',
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            //Caso o Chassi seja muito grande foi tomado essa medida de segurança com padding para nao quebrar a tela
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text('Chassi: ${vehicle.chassi}'),
            )
          ],
        ),
      ),
    );
  }
}
