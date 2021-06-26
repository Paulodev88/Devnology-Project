import 'dart:math';
import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class Vehicles with ChangeNotifier {
  List<Vehicle> _items = DUMMY_VEHICLE;

  List<Vehicle> get items => [..._items];

  void addVehicle(Vehicle newVehicle) {
    _items.add(
      Vehicle(
          id: Random().nextDouble().toString(),
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
