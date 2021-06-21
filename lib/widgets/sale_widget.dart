import 'package:devnology/provider/sales.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleWidget extends StatelessWidget {
  final Sale sale;

  const SaleWidget(this.sale);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('R\$ ${sale.total}'),
        subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(sale.date)),
        trailing: IconButton(
          icon: Icon(Icons.expand_more),
          onPressed: () {},
        ),
      ),
    );
  }
}
