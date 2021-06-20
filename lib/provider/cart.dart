import 'dart:math';
import 'package:devnology/provider/vehicle.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String modelo;
  final double valor;

  CartItem({
    required this.id,
    required this.modelo,
    required this.valor,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(Vehicle vehicle) {
    if (_items.containsKey(vehicle.id)) {
      _items.remove(vehicle.id);
    } else {
      _items.putIfAbsent(
          vehicle.id,
          () => CartItem(
              id: Random().nextDouble().toString(),
              modelo: vehicle.modelo,
              valor: vehicle.valorVenda));
    }
    notifyListeners();
  }
}
