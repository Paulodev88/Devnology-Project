import 'package:devnology/provider/sales.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleWidget extends StatefulWidget {
  final Sale sale;

  const SaleWidget(this.sale);

  @override
  _SaleWidgetState createState() => _SaleWidgetState();
}

class _SaleWidgetState extends State<SaleWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.sale.total.toStringAsFixed(2)}'),
            subtitle:
                Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.sale.date)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Column(
              children: [
                Container(
                  height: (widget.sale.vehicles.length * 25.0) + 10,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: ListView(
                    children: widget.sale.vehicles.map((vehicle) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            vehicle.modelo,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            vehicle.ano,
                          ),
                          Spacer(),
                          Text(
                            vehicle.valor.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
