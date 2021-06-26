import 'package:devnology/provider/sales.dart';
import 'package:devnology/widgets/drawer_widget/custom_drawer_widget.dart';
import 'package:devnology/widgets/sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Sales sales = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Veículos Vendidos'),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: sales.itemsCount,
        itemBuilder: (context, i) => SaleWidget(sales.items[i]),
      ),
    );
  }
}
