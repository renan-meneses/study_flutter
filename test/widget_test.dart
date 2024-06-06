import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:study_flutter/modulo/imc_screen.dart';

void main() {
  testWidgets('Calculadora de IMC deve exibir o IMC correto', (WidgetTester tester) async {
    // Arrange (Configurar o ambiente de teste)
    await tester.pumpWidget(ImcScreen());

    // Act (Interagir com a interface do usuário)
    final pesoController = await tester.findWidget(byType(TextField)).first.controller;
    pesoController.text = '70';
    await tester.pumpWidget(ImcScreen());

    final alturaController = await tester.findWidget(byType(TextField)).last.controller;
    alturaController.text = '1.7';
    await tester.pumpWidget(ImcScreen());

    final calcularButton = find.byType(ElevatedButton);
    await tester.tap(calcularButton);
    await tester.pumpWidget(ImcScreen());

    // Assert (Verificar o resultado esperado)
    final resultText = find.text('IMC: 24.19');
    expect(resultText, exists);
  });
}
