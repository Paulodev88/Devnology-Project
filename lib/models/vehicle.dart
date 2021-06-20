// Cadastrar a compra de um veículo; modelo; marca; ano de fabricação;
// placa; cor; chassi; data da compra e valor da compra.
class Vehicle {
  final String id;
  final String modelo;
  final String marca;
  final int anoFabricacao;
  final String placa;
  final String cor;
  final String chassi;
  final DateTime dataCompra;
  final double valorCompra;
  final String imageUrl;

  Vehicle({
    required this.id,
    required this.modelo,
    required this.marca,
    required this.anoFabricacao,
    required this.placa,
    required this.cor,
    required this.chassi,
    required this.dataCompra,
    required this.valorCompra,
    required this.imageUrl,
  });
}
