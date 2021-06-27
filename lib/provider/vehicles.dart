import 'dart:convert';
import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Vehicles with ChangeNotifier {
  final _url = Uri.parse(
      'https://devnology-flutter-default-rtdb.firebaseio.com/vehicles.json');
  List<Vehicle> _items = [];

  List<Vehicle> get items => [..._items];

  Future<void> loadVehicles() async {
    final response = await http.get(_url);
    Map<String, dynamic>? data = json.decode(response.body);
    _items.clear();

    if (data != null) {
      data.forEach((id, productData) {
        _items.add(
          Vehicle(
            id: id,
            anoFabricacao: productData['anoFabricacao'],
            chassi: productData['chassi'],
            cor: productData['cor'],
            dataCompra: productData['dataCompra'],
            imageUrl: productData['imageUrl'],
            marca: productData['marca'],
            modelo: productData['modelo'],
            placa: productData['placa'],
            valorCompra: productData['valorCompra'],
            valorVenda: productData['valorVenda'],
          ),
        );
      });
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> addVehicle(Vehicle newVehicle) async {
    return http
        .post(
      _url,
      body: json.encode({
        'anoFabricacao': newVehicle.anoFabricacao,
        'chassi': newVehicle.chassi,
        'cor': newVehicle.cor,
        'dataCompra': newVehicle.dataCompra,
        'imageUrl': newVehicle.imageUrl,
        'marca': newVehicle.marca,
        'modelo': newVehicle.modelo,
        'placa': newVehicle.placa,
        'valorCompra': newVehicle.valorCompra,
        'valorVenda': newVehicle.valorVenda
      }),
    )
        .then((response) {
      _items.add(
        Vehicle(
            id: json.decode(response.body)['name'],
            anoFabricacao: newVehicle.anoFabricacao,
            chassi: newVehicle.chassi,
            cor: newVehicle.cor,
            dataCompra: newVehicle.dataCompra,
            imageUrl: newVehicle.imageUrl,
            marca: newVehicle.marca,
            modelo: newVehicle.modelo,
            placa: newVehicle.placa,
            valorCompra: newVehicle.valorCompra,
            valorVenda: newVehicle.valorVenda),
      );
      notifyListeners();
    }).catchError((error) {
      throw error;
    });
  }

  int get vehiclesCount {
    return _items.length;
  }

  void updateVehicle(Vehicle vehicle) {
    if (vehicle.id == null) {
      return;
    }

    final index = _items.indexWhere((element) => element.id == element.id);

    if (index >= 0) {
      _items[index] = vehicle;
      notifyListeners();
    }
  }

  void deleteVehicle(String id) {
    final index = _items.indexWhere((element) => element.id == element.id);
    if (index >= 0) {
      _items.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
}
