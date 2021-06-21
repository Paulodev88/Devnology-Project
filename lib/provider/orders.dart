import 'dart:math';

import 'package:devnology/provider/cart.dart';
import 'package:flutter/material.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> vehicles;
  final DateTime date;

  Order({
    required this.id,
    required this.total,
    required this.vehicles,
    required this.date,
  });
}

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(Cart cart) {
    // final combine = (totalSum, i) => totalSum + i.valor;
    // final total = vehicles.fold(0.0, combine);
    _orders.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        vehicles: cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
