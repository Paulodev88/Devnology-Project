import 'dart:convert';
import 'package:devnology/provider/cart.dart';
import 'package:devnology/provider/sale.dart';
import 'package:devnology/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Sales with ChangeNotifier {
  final _baseUrl = Uri.parse('${Constants.BASE_API_URL}/solds');
  List<Sale> _items = [];

  List<Sale> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadSales() async {
    List<Sale> loadedItems = [];
    final response = await http.get(Uri.parse("$_baseUrl.json"));
    Map<String, dynamic>? data = json.decode(response.body);

    if (data != null) {
      data.forEach((id, saleData) {
        loadedItems.add(
          Sale(
            id: id,
            commission: saleData['commission'],
            date: DateTime.parse(saleData['date']),
            subTotal: saleData['subTotal'],
            valorCompra: saleData['valorCompra'],
            total: saleData['total'],
            vehicles: (saleData['vehicles'] as List<dynamic>).map((item) {
              return CartItem(
                ano: item['ano'],
                id: item['id'],
                imageUrl: item['imageUrl'],
                modelo: item['modelo'],
                valor: item['valor'],
                vehicleID: item['vehicleID'],
                valorCompra: item['valorCompra'],
                dataCompra: item['dataCompra'],
              );
            }).toList(),
          ),
        );
      });
      notifyListeners();
    }
    _items = loadedItems.reversed.toList();
    return Future.value();
  }

  Future<void> addSale(Cart cart) async {
    final date = DateTime.now();
    final total = cart.totalAmount + cart.totalCommission;
    final response = await http.post(
      Uri.parse("$_baseUrl.json"),
      body: json.encode({
        'valorCompra': cart.totalPushase,
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
                  'valorCompra': vehicleItem.valorCompra,
                  'dataCompra': vehicleItem.dataCompra,
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
        valorCompra: cart.totalPushase,
        total: cart.totalAmount + cart.totalCommission,
        vehicles: cart.items.values.toList(),
        date: date,
      ),
    );
    notifyListeners();
  }
}
