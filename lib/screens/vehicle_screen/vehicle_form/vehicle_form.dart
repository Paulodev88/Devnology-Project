import 'dart:math';

import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleFormScreen extends StatefulWidget {
  const VehicleFormScreen({Key? key}) : super(key: key);

  @override
  _VehicleFormScreenState createState() => _VehicleFormScreenState();
}

class _VehicleFormScreenState extends State<VehicleFormScreen> {
  final _imageURLFocusNode = FocusNode();
  final _imageURLController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, dynamic>();

  @override
  void initState() {
    super.initState();
    _imageURLFocusNode.addListener(_updateImageUrl);
  }

  void _updateImageUrl() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _imageURLFocusNode.removeListener(_updateImageUrl);
    _imageURLFocusNode.dispose();
  }

  void _saveForm() {
    _form.currentState!.save();
    final newVehicle = Vehicle(
      id: Random().nextDouble().toString(),
      modelo: _formData['modelo'],
      marca: _formData['marca'],
      anoFabricacao: _formData['anoFabricacao'],
      placa: _formData['placa'],
      cor: _formData['cor'],
      chassi: _formData['chassi'],
      dataCompra: DateTime.now(),
      valorCompra: _formData['valorCompra'],
      valorVenda: _formData['valorVenda'],
      imageUrl: _formData['imageUrl'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Veículo'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveForm();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'URL da Imagem'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        focusNode: _imageURLFocusNode,
                        controller: _imageURLController,
                        onSaved: (value) => _formData['imageUrl'] = value,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: _imageURLController.text.isEmpty
                          ? Text('Informe a URL')
                          : FittedBox(
                              child: Image.network(
                                _imageURLController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                      margin: EdgeInsets.only(left: 10),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                    )
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Modelo:'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _formData['modelo'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Frabicante:'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _formData['marca'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Ano:'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: (value) =>
                      _formData['anoFabricacao'] = int.parse(value!),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Placa'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _formData['placa'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Cor'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _formData['cor'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Chassi'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _formData['chassi'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Valor da Compra'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: (value) =>
                      _formData['valorCompra'] = double.parse(value!),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Valor da Venda'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: (value) =>
                      _formData['valorVenda'] = double.parse(value!),
                ),
              ],
            )),
      ),
    );
  }
}
