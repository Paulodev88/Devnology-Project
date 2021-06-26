import 'package:flutter/material.dart';

class VehicleFormScreen extends StatefulWidget {
  const VehicleFormScreen({Key? key}) : super(key: key);

  @override
  _VehicleFormScreenState createState() => _VehicleFormScreenState();
}

class _VehicleFormScreenState extends State<VehicleFormScreen> {
  void onImageSelected() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Modelo:'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Frabicante:'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Ano:'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Placa'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Cor'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Chassi'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Valor da Compra'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Valor da Venda'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        )),
      ),
    );
  }
}
