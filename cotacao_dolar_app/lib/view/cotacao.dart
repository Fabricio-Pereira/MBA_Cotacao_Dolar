import 'package:flutter/material.dart';

class Cotacao extends StatefulWidget {
  @override
  _CotacaoState createState() => _CotacaoState();
}

class _CotacaoState extends State<Cotacao> {
  var _reaisController = TextEditingController();
  var _dolarController = TextEditingController();

  var _resultado = 0.0;
  String retornoTela = " ------ ";

  onTapBottom(index) {
    if (index == 0) {
      setState(() {
        _reaisController.text = "";
        _dolarController.text = "";
        retornoTela = ' ------ ';
      });
    } else {
      var reais = double.parse(_reaisController.text);
      var dolar = double.parse(_dolarController.text);

      setState(() {
        _resultado = reais / dolar;
        retornoTela = 'Com RS ${_reaisController.text} reais é possível comprar ${_resultado.toStringAsFixed(2)} dólares a RS: ${_dolarController.text} cada.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotação - Reais para Dólares'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("images/cotacao.png", width: 90.0),
            TextField(
              controller: _reaisController,
              decoration: InputDecoration(
                  hintText: "Quantidade em Reais",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _dolarController,
              decoration: InputDecoration(
                  hintText: "Cotação do Dolar",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              keyboardType: TextInputType.number,
            ),

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('$retornoTela',
                        style: TextStyle(fontSize: 20.0)),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.clear), label: "Limpar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), label: "Calcular")
        ],
        onTap: onTapBottom,
      ),
    );
  }
}
