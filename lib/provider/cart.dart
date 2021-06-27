import 'dart:math';
import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String vehicleID;
  final String modelo;
  final String ano;
  final double valor;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.vehicleID,
    required this.modelo,
    required this.ano,
    required this.valor,
    required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.valor;
    });
    return total;
  }

  double get totalCommission {
    double commission = totalAmount * 0.10;
    return commission;
  }

  void addItem(Vehicle vehicle) {
    if (_items.containsKey(vehicle.id)) {
      _items.remove(vehicle.id);
    } else {
      _items.putIfAbsent(
          vehicle.id!,
          () => CartItem(
              id: Random().nextDouble().toString(),
              vehicleID: vehicle.id!,
              modelo: vehicle.modelo,
              valor: vehicle.valorVenda,
              ano: vehicle.anoFabricacao.toString(),
              imageUrl: vehicle.imageUrl));
    }
    notifyListeners();
  }

  void removeItem(String vehicleID) {
    _items.remove(vehicleID);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
