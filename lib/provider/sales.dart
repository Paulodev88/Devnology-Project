import 'dart:convert';
import 'package:devnology/provider/cart.dart';
import 'package:devnology/provider/sale.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Sales with ChangeNotifier {
  final _baseUrl =
      Uri.parse('https://devnology-flutter-default-rtdb.firebaseio.com/solds');
  List<Sale> _items = [];

  List<Sale> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addSale(Cart cart) async {
    final date = DateTime.now();
    final total = cart.totalAmount + cart.totalCommission;
    final response = await http.post(
      Uri.parse("$_baseUrl.json"),
      body: json.encode({
        'subTotal': cart.totalAmount,
        'commission': cart.totalCommission,
        'total': total,
        'date': date.toIso8601String(),
        'vehicles': cart.items.values
            .map((vehicleItem) => {
                  'id': vehicleItem.id,
                  'vehicleID': vehicleItem.vehicleID,
                  'modelo': vehicleItem.modelo,
                  'ano': vehicleItem.ano,
                  'valor': vehicleItem.valor,
                  'imageUrl': vehicleItem.imageUrl,
                })
            .toList(),
      }),
    );
    _items.insert(
      0,
      Sale(
        id: json.decode(response.body)['name'],
        subTotal: cart.totalAmount,
        commission: cart.totalCommission,
        total: cart.totalAmount + cart.totalCommission,
        vehicles: cart.items.values.toList(),
        date: date,
      ),
    );
    notifyListeners();
  }
}
