import 'package:devnology/provider/sales.dart';
import 'package:devnology/widgets/cash_widget.dart';
import 'package:devnology/widgets/drawer_widget/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CashScreen extends StatefulWidget {
  const CashScreen({Key? key}) : super(key: key);

  @override
  _CashScreenState createState() => _CashScreenState();
}

class _CashScreenState extends State<CashScreen> {
  bool _isLoading = true;

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
    final Sales sales = Provider.of<Sales>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Caixa'),
      ),
      drawer: CustomDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CashWidget(
              sale: sales,
            ),
    );
  }
}
