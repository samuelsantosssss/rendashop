// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future checkoutFinal(
  List<CarrinhoRecord>? carrinhoList,
  DocumentReference userReference,
) async {
  if (carrinhoList == null || carrinhoList.isEmpty || userReference == null) {
    return;
  }

  // Limpa carrinhoFinal existente
  final carrinhoFinalSnapshot =
      await userReference.collection('carrinhoFinal').get();
  final batch = FirebaseFirestore.instance.batch();
  for (final doc in carrinhoFinalSnapshot.docs) {
    batch.delete(doc.reference);
  }
  await batch.commit();

  // Mapa para agrupar produtos
  final Map<String, Map<bool, Map<String, dynamic>>> lojasMap = {};

  // Processa itens do carrinho
  for (final carrinhoItem in carrinhoList) {
    if (carrinhoItem.selecionado == true && carrinhoItem.lojaRef != null) {
      final lojaId = carrinhoItem.lojaRef!.id;
      final isNacional = carrinhoItem.nacional == true;

      // Inicializa loja no mapa se não existir
      if (!lojasMap.containsKey(lojaId)) {
        final lojaDoc = await carrinhoItem.lojaRef!.get();
        final nomeLoja = lojaDoc.get('nome') as String? ?? 'Loja sem nome';

        lojasMap[lojaId] = {
          true: {
            'lojaRef': carrinhoItem.lojaRef,
            'nomeLoja': nomeLoja,
            'produtos': [],
            'nacional': true,
            'fretes': [],
            'produtosAgrupados': {}
          },
          false: {
            'lojaRef': carrinhoItem.lojaRef,
            'nomeLoja': nomeLoja,
            'produtos': [],
            'nacional': false,
            'fretes': [],
            'produtosAgrupados': {}
          }
        };
      }

      // Constrói string do produto
      final produtoString = [
        '(foto "${carrinhoItem.fotoCapa}")',
        '(titulo "${carrinhoItem.titulo}")',
        if (carrinhoItem.variacao?.isNotEmpty ?? false)
          '(variação "${carrinhoItem.variacao}")',
        '(valor Unidade "R\$${carrinhoItem.preco?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00'}")',
        '(valor antes "R\$${carrinhoItem.precoAntes?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00'}")',
        '(quantidade "${carrinhoItem.quantidade?.toString() ?? "1"}")',
        '(produtoRef "${carrinhoItem.itens?.path}")'
      ].where((item) => item.isNotEmpty).join(' ');

      lojasMap[lojaId]![isNacional]!['produtos'].add(produtoString);

      // Lógica de frete aprimorada
      final freteBase = carrinhoItem.frete ?? 0.0;
      final produtoKey = carrinhoItem.itens?.path ?? '';

      if (!lojasMap[lojaId]![isNacional]!['produtosAgrupados']
          .containsKey(produtoKey)) {
        lojasMap[lojaId]![isNacional]!['produtosAgrupados'][produtoKey] =
            carrinhoItem.quantidade ?? 1;
        lojasMap[lojaId]![isNacional]!['fretes'].add(freteBase);
      }
    }
  }

  // Processa fretes por loja/tipo
  for (final lojaEntry in lojasMap.entries) {
    for (final tipoEntry in lojaEntry.value.entries) {
      final dadosLoja = tipoEntry.value;
      if (dadosLoja['produtos'].isNotEmpty) {
        final freteFinal =
            _calcularFreteCompleto(dadosLoja['fretes'].cast<double>());

        await userReference.collection('carrinhoFinal').add({
          'nomeLoja': dadosLoja['nomeLoja'],
          'ListProdutos': dadosLoja['produtos'],
          'nacional': tipoEntry.key,
          'frete': freteFinal,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    }
  }
}

double _calcularFreteCompleto(List<double> fretes) {
  if (fretes.isEmpty) return 0.0;

  // Frete mínimo configurável
  const freteMinimo = 9.0;

  // Caso único produto
  if (fretes.length == 1) {
    return (fretes[0] < freteMinimo) ? freteMinimo : fretes[0];
  }

  // Ordena fretes em ordem decrescente
  fretes.sort((a, b) => b.compareTo(a));

  // Calcula frete principal + 30% dos secundários
  final freteCalculado =
      fretes[0] + (fretes.sublist(1).reduce((a, b) => a + b) * 0.3);

  // Aplica frete mínimo e formata
  return double.parse(
      (freteCalculado < freteMinimo ? freteMinimo : freteCalculado)
          .toStringAsFixed(2));
}
