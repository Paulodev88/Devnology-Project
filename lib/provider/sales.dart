import 'dart:math';

import 'package:devnology/provider/cart.dart';
import 'package:flutter/material.dart';

class Sale {
  final String id;
  final double total;
  final double commission;
  final List<CartItem> vehicles;
  final DateTime date;

  Sale({
    required this.commission,
    required this.id,
    required this.total,
    required this.vehicles,
    required this.date,
  });
}

class Sales with ChangeNotifier {
  List<Sale> _items = [];

  List<Sale> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addSale(Cart cart) {
    _items.insert(
      0,
      Sale(
        id: Random().nextDouble().toString(),
        commission: cart.totalCommission,
        total: cart.totalAmount + cart.totalCommission,
        vehicles: cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
