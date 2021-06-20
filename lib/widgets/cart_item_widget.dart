import 'package:devnology/provider/cart.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({required this.cartItem});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              cartItem.imageUrl,
            ),
            backgroundColor: Colors.transparent,
          ),
          title: Text(cartItem.modelo),
          subtitle: Text('ano: ${cartItem.ano}'),
          trailing: Text('valor: R\$ ${cartItem.valor}'),
        ),
      ),
    );
  }
}
