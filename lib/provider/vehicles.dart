import 'dart:convert';
import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Vehicles with ChangeNotifier {
  final _baseUrl = Uri.parse(
      'https://devnology-flutter-default-rtdb.firebaseio.com/vehicles');
  List<Vehicle> _items = [];

  List<Vehicle> get items => [..._items];

  Future<void> loadVehicles() async {
    final response = await http.get(Uri.parse("$_baseUrl.json"));
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
      Uri.parse("$_baseUrl.json"),
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

  Future<void> updateVehicle(Vehicle vehicle) async {
    if (vehicle.id == null) {
      return;
    }

    final index = _items.indexWhere((element) => element.id == element.id);

    if (index >= 0) {
      await http.patch(
        Uri.parse("$_baseUrl/${vehicle.id}.json"),
        body: json.encode(
          {
            'anoFabricacao': vehicle.anoFabricacao,
            'chassi': vehicle.chassi,
            'cor': vehicle.cor,
            'dataCompra': vehicle.dataCompra,
            'imageUrl': vehicle.imageUrl,
            'marca': vehicle.marca,
            'modelo': vehicle.modelo,
            'placa': vehicle.placa,
            'valorCompra': vehicle.valorCompra,
            'valorVenda': vehicle.valorVenda
          },
        ),
      );
      _items[index] = vehicle;
      notifyListeners();
    }
  }

  Future<void> deleteVehicle(String id) async {
    final index = _items.indexWhere((element) => element.id == element.id);
    if (index >= 0) {
      final vehicle = _items[index];
      final response =
          await http.delete(Uri.parse("$_baseUrl/${vehicle.id}.json"));
      if (response.statusCode >= 400) {
        print('Problema');
      } else {
        _items.remove(vehicle);
        notifyListeners();
      }
    }
  }
}
