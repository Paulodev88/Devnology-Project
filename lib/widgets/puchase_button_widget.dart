import 'package:devnology/provider/cart.dart';
import 'package:devnology/provider/sales.dart';
import 'package:devnology/provider/vehicles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseButton extends StatefulWidget {
  const PurchaseButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _PurchaseButtonState createState() => _PurchaseButtonState();
}

class _PurchaseButtonState extends State<PurchaseButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: _isLoading
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Text('COMPRAR'),
      style: TextButton.styleFrom(
        primary: widget.cart.totalAmount == 0
            ? Theme.of(context).primaryColor
            : Colors.white,
        backgroundColor: widget.cart.totalAmount == 0
            ? Colors.white
            : Theme.of(context).primaryColor,
        onSurface: Colors.grey,
      ),
      onPressed: widget.cart.totalAmount == 0
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });

              widget.cart.items.forEach((key, value) async {
                await Provider.of<Vehicles>(context, listen: false)
                    .deleteVehicle(value.vehicleID);
              });

              await Provider.of<Sales>(context, listen: false)
                  .addSale(widget.cart);
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
            },
    );
  }
}
