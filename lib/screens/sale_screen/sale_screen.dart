import 'package:devnology/provider/sales.dart';
import 'package:devnology/widgets/drawer_widget/custom_drawer_widget.dart';
import 'package:devnology/widgets/sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalesScreen extends StatefulWidget {
  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    Provider.of<Sales>(context, listen: false).loadSales().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Sales sales = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Veículos Vendidos'),
      ),
      drawer: CustomDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: sales.itemsCount,
              itemBuilder: (context, i) => SaleWidget(sales.items[i]),
            ),
    );
  }
}
