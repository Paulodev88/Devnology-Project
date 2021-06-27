import 'package:devnology/widgets/drawer_widget/custom_drawer_widget.dart';
import 'package:flutter/material.dart';

class CashScreen extends StatefulWidget {
  const CashScreen({Key? key}) : super(key: key);

  @override
  _CashScreenState createState() => _CashScreenState();
}

class _CashScreenState extends State<CashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caixa'),
      ),
      drawer: CustomDrawer(),
    );
  }
}
