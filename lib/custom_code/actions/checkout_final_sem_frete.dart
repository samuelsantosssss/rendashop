// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future checkoutFinalSemFrete(
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
            'produtosAgrupados': {}
          },
          false: {
            'lojaRef': carrinhoItem.lojaRef,
            'nomeLoja': nomeLoja,
            'produtos': [],
            'nacional': false,
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
        '(produtoRef "${carrinhoItem.itens?.path}")',
        if (carrinhoItem.afiliadoComissao != null)
          '(afiliadoComissao "${carrinhoItem.afiliadoComissao?.toStringAsFixed(2)}")',
        if (carrinhoItem.afiliadoRef != null)
          '(afiliadoRef "${carrinhoItem.afiliadoRef?.path}")'
      ].where((item) => item.isNotEmpty).join(' ');

      lojasMap[lojaId]![isNacional]!['produtos'].add(produtoString);

      // Mantém apenas o agrupamento de produtos
      final produtoKey = carrinhoItem.itens?.path ?? '';
      if (!lojasMap[lojaId]![isNacional]!['produtosAgrupados']
          .containsKey(produtoKey)) {
        lojasMap[lojaId]![isNacional]!['produtosAgrupados'][produtoKey] =
            carrinhoItem.quantidade ?? 1;
      }
    }
  }

  // Cria documentos finais sem campo de frete
  for (final lojaEntry in lojasMap.entries) {
    for (final tipoEntry in lojaEntry.value.entries) {
      final dadosLoja = tipoEntry.value;
      if (dadosLoja['produtos'].isNotEmpty) {
        await userReference.collection('carrinhoFinal').add({
          'nomeLoja': dadosLoja['nomeLoja'],
          'ListProdutos': dadosLoja['produtos'],
          'nacional': tipoEntry.key,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    }
  }
}
