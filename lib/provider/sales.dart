import 'dart:math';

import 'package:devnology/provider/cart.dart';
import 'package:flutter/material.dart';

class Sale {
  final String id;
  final double total;
  final List<CartItem> vehicles;
  final DateTime date;

  Sale({
    required this.id,
    required this.total,
    required this.vehicles,
    required this.date,
  });
}

class Sales with ChangeNotifier {
  List<Sale> _sales = [];

  List<Sale> get sales {
    return [..._sales];
  }

  void addSale(Cart cart) {
    // final combine = (totalSum, i) => totalSum + i.valor;
    // final total = vehicles.fold(0.0, combine);
    _sales.insert(
      0,
      Sale(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        vehicles: cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
