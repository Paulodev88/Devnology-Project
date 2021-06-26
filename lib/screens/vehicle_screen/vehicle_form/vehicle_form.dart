import 'package:devnology/provider/vehicle.dart';
import 'package:devnology/provider/vehicles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _imageURLFocusNode.addListener(_updateImageUrl);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final vehicle = ModalRoute.of(context)!.settings.arguments as dynamic;

      if (vehicle != null) {
        _formData['id'] = vehicle.id;
        _formData['modelo'] = vehicle.modelo;
        _formData['marca'] = vehicle.marca;
        _formData['anoFabricacao'] = vehicle.anoFabricacao;
        _formData['placa'] = vehicle.placa;
        _formData['cor'] = vehicle.cor;
        _formData['chassi'] = vehicle.chassi;
        _formData['valorCompra'] = vehicle.valorCompra;
        _formData['valorVenda'] = vehicle.valorVenda;
        _formData['imageUrl'] = vehicle.imageUrl;

        _imageURLController.text = _formData['imageUrl'];
      } else {
        _formData['anoFabricacao'] = '';
        _formData['valorCompra'] = '';
        _formData['valorVenda'] = '';
      }
    }
  }

  void _updateImageUrl() {
    if (isValidImageUrl(_imageURLController.text)) {
      setState(() {});
    }
  }

  bool isValidImageUrl(String url) {
    bool isValidProtocol = url.toLowerCase().startsWith('http://') ||
        url.toLowerCase().startsWith('https://');

    return isValidProtocol;
  }

  @override
  void dispose() {
    super.dispose();
    _imageURLFocusNode.removeListener(_updateImageUrl);
    _imageURLFocusNode.dispose();
  }

  void _saveForm() {
    bool isValid = _form.currentState!.validate();
    if (!isValid) {
      print('Aqui');
      return;
    }
    _form.currentState!.save();
    final vehicle = Vehicle(
      id: _formData['id'],
      modelo: _formData['modelo'],
      marca: _formData['marca'],
      anoFabricacao: _formData['anoFabricacao'],
      placa: _formData['placa'],
      cor: _formData['cor'],
      chassi: _formData['chassi'],
      dataCompra: DateTime.now().toString(),
      valorCompra: _formData['valorCompra'],
      valorVenda: _formData['valorVenda'],
      imageUrl: _formData['imageUrl'],
    );

    setState(() {
      _isLoading = true;
    });

    final vehicles = Provider.of<Vehicles>(context, listen: false);
    if (_formData['id'] == null) {
      vehicles.addVehicle(vehicle).then((_) {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      });
    } else {
      vehicles.updateVehicle(vehicle);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    }
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                              decoration:
                                  InputDecoration(labelText: 'URL da Imagem'),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              focusNode: _imageURLFocusNode,
                              controller: _imageURLController,
                              onSaved: (value) => _formData['imageUrl'] = value,
                              validator: (value) {
                                bool emptyUrl = value!.trim().isEmpty;
                                bool invalidUrl = !isValidImageUrl(value);
                                if (emptyUrl || invalidUrl) {
                                  return 'Informe uma URL válida!';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: _imageURLController.text.isEmpty
                                ? Text('Informe a URL')
                                : Image.network(
                                    _imageURLController.text,
                                    fit: BoxFit.cover,
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
                        initialValue: _formData['modelo'],
                        decoration: InputDecoration(labelText: 'Modelo:'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) => _formData['modelo'] = value,
                        validator: (value) {
                          bool isEmpty = value!.trim().isEmpty;
                          bool isInvalid = value.trim().length < 3;
                          if (isEmpty || isInvalid) {
                            return 'Informe um modelo válido!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['marca'],
                        decoration: InputDecoration(labelText: 'Frabicante:'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) => _formData['marca'] = value,
                        validator: (value) {
                          bool isEmpty = value!.trim().isEmpty;
                          bool isInvalid = value.trim().length < 3;
                          if (isEmpty || isInvalid) {
                            return 'Informe um fabricante válido!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['anoFabricacao'].toString(),
                        decoration: InputDecoration(labelText: 'Ano:'),
                        textInputAction: TextInputAction.next,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onSaved: (value) =>
                            _formData['anoFabricacao'] = int.parse(value!),
                        validator: (value) {
                          bool isEmpty = value!.trim().isEmpty;
                          bool isInvalid = value.trim().length < 3;
                          if (isEmpty || isInvalid) {
                            return 'Informe um ano válido!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['placa'],
                        decoration: InputDecoration(labelText: 'Placa'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) => _formData['placa'] = value,
                        validator: (value) {
                          bool isEmpty = value!.trim().isEmpty;
                          bool isInvalid = value.trim().length < 3;
                          if (isEmpty || isInvalid) {
                            return 'Informe uma placa válida!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['cor'],
                        decoration: InputDecoration(labelText: 'Cor'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) => _formData['cor'] = value,
                        validator: (value) {
                          bool isEmpty = value!.trim().isEmpty;
                          bool isInvalid = value.trim().length < 3;
                          if (isEmpty || isInvalid) {
                            return 'Informe uma cor válida!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['chassi'],
                        decoration: InputDecoration(labelText: 'Chassi'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) => _formData['chassi'] = value,
                        validator: (value) {
                          bool isEmpty = value!.trim().isEmpty;
                          bool isInvalid = value.trim().length < 3;
                          if (isEmpty || isInvalid) {
                            return 'Informe um chassi válido!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['valorCompra'].toString(),
                        decoration:
                            InputDecoration(labelText: 'Valor da Compra'),
                        textInputAction: TextInputAction.next,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onSaved: (value) =>
                            _formData['valorCompra'] = double.parse(value!),
                        validator: (value) {
                          bool isEmpty = value!.trim().isEmpty;
                          var newPrice = double.tryParse(value);
                          bool isInvalid = newPrice == null || newPrice <= 0;
                          if (isEmpty || isInvalid) {
                            return 'Informe um valor de compra válido!';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: _formData['valorVenda'].toString(),
                        decoration:
                            InputDecoration(labelText: 'Valor da Venda'),
                        textInputAction: TextInputAction.next,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onSaved: (value) =>
                            _formData['valorVenda'] = double.parse(value!),
                        validator: (value) {
                          bool isEmpty = value!.trim().isEmpty;
                          var newPrice = double.tryParse(value);
                          bool isInvalid = newPrice == null || newPrice <= 0;
                          if (isEmpty || isInvalid) {
                            return 'Informe um valor de venda válido!';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ),
    );
  }
}
