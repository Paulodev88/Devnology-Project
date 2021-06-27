import 'dart:convert';

import 'package:devnology/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Vehicle with ChangeNotifier {
  final String? id;
  final String modelo;
  final String marca;
  final int anoFabricacao;
  final String placa;
  final String cor;
  final String chassi;
  final String dataCompra;
  final double valorCompra;
  final double valorVenda;
  final String imageUrl;
  bool isSold = false;

  Vehicle({
    this.id,
    required this.modelo,
    required this.marca,
    required this.anoFabricacao,
    required this.placa,
    required this.cor,
    required this.chassi,
    required this.dataCompra,
    required this.valorCompra,
    required this.valorVenda,
    required this.imageUrl,
  });

  void _sold() {
    isSold = !isSold;
    notifyListeners();
  }

  Future<void> sold() async {
    _sold();
    try {
      final url = Uri.parse('${Constants.BASE_API_URL}/vehicles');
      final response = await http.patch(
        url,
        body: json.encode(
          {
            'isSold': isSold,
          },
        ),
      );
      if (response.statusCode >= 400) {
        _sold();
      }
    } catch (error) {
      _sold();
    }
  }
}
