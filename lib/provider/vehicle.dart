import 'package:flutter/material.dart';

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
  bool isSelected = false;

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

  void selected() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
