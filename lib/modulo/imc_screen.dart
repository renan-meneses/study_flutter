import 'package:flutter/material.dart';

class ImcScreen extends StatefulWidget {
  @override
  _ImcScreenState createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  double _imc = 0;

  void _calcularImc() {
    setState(() {
      double peso = double.tryParse(_pesoController.text) ?? 0;
      double altura = double.tryParse(_alturaController.text) ?? 0;

      if (altura != 0) {
        _imc = peso / (altura * altura);
      } else {
        _imc = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _pesoController,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _alturaController,
              decoration: InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _calcularImc,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 32.0),
            Text(
              'IMC: ${_imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
