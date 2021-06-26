import 'dart:convert';
import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'package:http/http.dart' as http;

class Vehicles with ChangeNotifier {
  List<Vehicle> _items = DUMMY_VEHICLE;

  List<Vehicle> get items => [..._items];

  Future<void> addVehicle(Vehicle newVehicle) async {
    final url = Uri.parse(
        'https://devnology-flutter-default-rtdb.firebaseio.com/vehicles.json');
    return http
        .post(
      url,
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
