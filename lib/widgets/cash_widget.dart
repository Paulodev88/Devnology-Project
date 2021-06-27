import 'package:devnology/provider/sales.dart';
import 'package:flutter/material.dart';

class CashWidget extends StatefulWidget {
  final Sales sale;
  const CashWidget({
    Key? key,
    required this.sale,
  }) : super(key: key);

  @override
  _CashWidgetState createState() => _CashWidgetState();
}

class _CashWidgetState extends State<CashWidget> {
  bool _expanded = false;

  var _mes = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];
  var _itemSelecionado = 'Janeiro';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Caixa Total da Devnology',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 46,
              ),
              Row(
                children: [
                  Text(
                    'Total Líquido:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'R\$ ${totalLiquido().toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 16,
                        color: totalLiquido() >= 0
                            ? Colors.blue[900]
                            : Colors.red),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'Total Vendas:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'R\$ ${totalVendas().toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 16,
                        color:
                            totalVendas() >= 0 ? Colors.blue[900] : Colors.red),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'Total Compras:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'R\$ ${totalCompras().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'Total Comissão:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'R\$ ${totalComission().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          _expanded
                              ? Text(
                                  'Voltar',
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  'Filtrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                          _expanded
                              ? Icon(Icons.arrow_drop_up, color: Colors.white)
                              : Icon(Icons.filter_alt_outlined,
                                  color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              if (_expanded)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Selecione o mês:'),
                        Spacer(),
                        DropdownButton<String>(
                          items: _mes.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String? novoItemSelecionado) {
                            _dropDownItemSelected(novoItemSelecionado!);
                            setState(
                              () {
                                this._itemSelecionado = novoItemSelecionado;
                              },
                            );
                          },
                          value: _itemSelecionado,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            '$_itemSelecionado',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 46,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total Líquido do mês:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'R\$ ${totalLiquidoMes().toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: totalLiquido() >= 0
                                      ? Colors.blue[900]
                                      : Colors.red),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text(
                              'Total Vendas do mês:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'R\$ ${totalVendasMes().toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: totalVendas() >= 0
                                      ? Colors.blue[900]
                                      : Colors.red),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text(
                              'Total Compras do mês:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'R\$ ${totalComprasMes().toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text(
                              'Total Comissão do mês:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'R\$ ${totalComissionMes().toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  int mesAtual() {
    final _index = _mes.indexWhere((element) => element == _itemSelecionado);
    return _index + 1;
  }

  double totalLiquido() {
    double total = totalVendas() - (totalComission() + totalCompras());

    return total;
  }

  double totalComission() {
    double total = 0.0;
    widget.sale.items.forEach((element) {
      total += element.commission;
    });
    return total;
  }

  double totalVendas() {
    double total = 0.0;
    widget.sale.items.forEach((element) {
      total += element.total;
    });
    return total;
  }

  double totalCompras() {
    double total = 0.0;
    widget.sale.items.forEach((element) {
      total += element.valorCompra;
    });
    return total;
  }

  double totalLiquidoMes() {
    double total = totalVendasMes() - (totalComissionMes() + totalComprasMes());

    return total;
  }

  double totalComissionMes() {
    double total = 0.0;

    widget.sale.items.forEach((element) {
      DateTime date = element.date;
      if (date.month == mesAtual()) {
        total += element.commission;
      }
    });

    return total;
  }

  double totalVendasMes() {
    double total = 0.0;

    widget.sale.items.forEach((element) {
      DateTime date = element.date;
      if (date.month == mesAtual()) {
        total += element.total;
      }
    });

    return total;
  }

  double totalComprasMes() {
    double total = 0.0;

    widget.sale.items.forEach((element) {
      DateTime date = element.date;
      if (date.month == mesAtual()) {
        total += element.valorCompra;
      }
    });

    return total;
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }
}
