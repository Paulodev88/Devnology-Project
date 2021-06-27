import 'package:devnology/provider/cart.dart';

class Sale {
  final String id;
  final double total;
  final double subTotal;
  final double valorCompra;
  final double commission;
  final List<CartItem> vehicles;
  final DateTime date;

  Sale({
    required this.commission,
    required this.id,
    required this.total,
    required this.subTotal,
    required this.valorCompra,
    required this.vehicles,
    required this.date,
  });
}
