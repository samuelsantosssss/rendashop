import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double contaMultiplicacao(
  double valorX,
  double valorY,
) {
  return valorX * valorY;
}

String afiliadoValianteValores2(List<String> documentList) {
  // Initialize variables to track min and max prices
  double? minPrice;
  double? maxPrice;

  // Regular expression to extract the price from the string
  final priceRegExp = RegExp(r'\(Preco "([\d.]+)"\)');

  // Iterate through all strings to find prices
  for (final docString in documentList) {
    // Try to find the price in the string using regex
    final match = priceRegExp.firstMatch(docString);
    if (match != null) {
      final priceString = match.group(1);
      // Convert the price string to double
      final preco = double.tryParse(priceString ?? '');

      if (preco != null) {
        // Initialize min and max with the first price found
        minPrice ??= preco;
        maxPrice ??= preco;

        // Update min and max prices
        if (preco < minPrice!) {
          minPrice = preco;
        }
        if (preco > maxPrice!) {
          maxPrice = preco;
        }
      }
    }
  }

  // Format the output string based on the prices found
  if (minPrice == null) {
    return 'Preço não disponível';
  } else if (minPrice == maxPrice) {
    // Single price format with space after R$
    return 'R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(minPrice).trim()}';
  } else {
    // Range price format with space after R$
    return 'R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(minPrice).trim()} - R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(maxPrice).trim()}';
  }
}

List<ProdutoRecord> recomendarProdutosCarrinhoNaoLogado(
  List<ProdutoRecord> documentList,
  List<String> favoritosIds,
  List<String> ultimasPesquisas,
  List<String> vistoPorUltimoIds,
  List<String> comprasAntigasIds,
  int limite,
  int limiteInicial,
  List<String>? listaCarrinhoOutro,
) {
  final int limiteTotal = limiteInicial + limite;

  // 1. Extrair palavras-chave dos produtos no carrinho
  final palavrasChaveCarrinho = <String>{};
  final produtosNoCarrinhoIds = <String>{};

  if (listaCarrinhoOutro != null && listaCarrinhoOutro.isNotEmpty) {
    for (final item in listaCarrinhoOutro) {
      final regex = RegExp(r'produtoRef\s+"(.*?)"');
      final match = regex.firstMatch(item);
      if (match != null && match.groupCount >= 1) {
        final ref = match.group(1);
        if (ref != null && ref.isNotEmpty) {
          final produtoId = ref.split('/').last;
          produtosNoCarrinhoIds.add(produtoId);

          try {
            final produtoNoCarrinho = documentList.firstWhere(
              (p) => p.reference.id == produtoId,
            );
            if (produtoNoCarrinho.palavrasChaveList != null) {
              palavrasChaveCarrinho.addAll(
                produtoNoCarrinho.palavrasChaveList!
                    .map((p) => p.toLowerCase()),
              );
            }
          } catch (e) {
            // Produto não encontrado, continuar
          }
        }
      }
    }
  }

  // 2. Filtrar produtos que não estão no carrinho
  List<ProdutoRecord> produtosDisponiveis = documentList;
  if (produtosNoCarrinhoIds.isNotEmpty) {
    produtosDisponiveis = documentList
        .where((p) => !produtosNoCarrinhoIds.contains(p.reference.id))
        .toList();
  }

  // 3. Converter IDs para ProdutoRecords
  final favoritosRecords = produtosDisponiveis
      .where((p) => favoritosIds.contains(p.reference.id))
      .toList();
  final vistoPorUltimoRecords = produtosDisponiveis
      .where((p) => vistoPorUltimoIds.contains(p.reference.id))
      .toList();
  final comprasAntigasRecords = produtosDisponiveis
      .where((p) => comprasAntigasIds.contains(p.reference.id))
      .toList();

  // 4. Juntar produtos interagidos
  final produtosInteragidos = [
    ...favoritosRecords,
    ...vistoPorUltimoRecords,
    ...comprasAntigasRecords
  ];

  // 5. Extrair palavras-chave do usuário
  final palavrasChaveUsuario = <String>{};
  void extrairPalavrasChave(List<ProdutoRecord> produtos) {
    for (final produto in produtos) {
      if (produto.palavrasChaveList != null) {
        palavrasChaveUsuario
            .addAll(produto.palavrasChaveList!.map((p) => p.toLowerCase()));
      }
    }
  }

  extrairPalavrasChave(produtosInteragidos);
  palavrasChaveUsuario.addAll(ultimasPesquisas.map((p) => p.toLowerCase()));

  // 6. Combinar palavras-chave (60% do carrinho + 40% do usuário)
  final palavrasChaveCombinadas = <String>{
    ...palavrasChaveCarrinho,
    ...palavrasChaveUsuario,
  };

  // 7. Se não houver dados, retornar produtos populares
  if (palavrasChaveCombinadas.isEmpty) {
    final populares = List<ProdutoRecord>.from(produtosDisponiveis)
      ..sort((a, b) => (b.vendas ?? 0).compareTo(a.vendas ?? 0));
    return populares.take(limiteTotal).toList();
  }

  // 8. Classificar produtos por relevância
  final produtosComPontuacao = <Map<String, dynamic>>[];
  for (final produto in produtosDisponiveis) {
    final palavrasProduto =
        produto.palavrasChaveList?.map((p) => p.toLowerCase()).toList() ?? [];

    // Pontuação baseada em similaridade com o carrinho (60% do peso)
    int pontuacaoCarrinho = 0;
    if (palavrasChaveCarrinho.isNotEmpty) {
      for (final palavra in palavrasChaveCarrinho) {
        if (palavrasProduto.any((p) => p.contains(palavra))) {
          pontuacaoCarrinho += 3;
        }
      }
    }

    // Pontuação baseada no perfil do usuário (40% do peso)
    int pontuacaoUsuario = 0;
    for (final palavra in palavrasChaveUsuario) {
      if (palavrasProduto.any((p) => p.contains(palavra))) {
        pontuacaoUsuario += 2;
      }
    }

    // Pontuação final com pesos diferentes
    int pontuacaoFinal =
        (pontuacaoCarrinho * 0.6 + pontuacaoUsuario * 0.4).round();

    // Bônus para interações do usuário
    if (favoritosIds.contains(produto.reference.id)) pontuacaoFinal += 10;
    if (comprasAntigasIds.contains(produto.reference.id)) pontuacaoFinal += 8;
    if (vistoPorUltimoIds.contains(produto.reference.id)) pontuacaoFinal += 5;

    if (pontuacaoFinal > 0) {
      produtosComPontuacao
          .add({'produto': produto, 'pontuacao': pontuacaoFinal});
    }
  }

  // 9. Ordenar por pontuação
  produtosComPontuacao.sort((a, b) => b['pontuacao'].compareTo(a['pontuacao']));

  // 10. Preparar lista final
  final recomendados = produtosComPontuacao
      .map((item) => item['produto'] as ProdutoRecord)
      .toList();

  // 11. Garantir limite mínimo
  if (recomendados.length < limiteTotal) {
    recomendados.addAll(produtosDisponiveis
        .where((p) => !recomendados.contains(p))
        .take(limiteTotal - recomendados.length)
        .toList());
  }

  return recomendados.take(limiteTotal).toList();
}

String carrinhoTemporarioVariante(String textoItem) {
  // Função para extrair valores da string formatada
  String extrairValor(String texto, String campo) {
    final start = texto.indexOf('($campo "') + campo.length + 3;
    final end = texto.indexOf('")', start);
    return start > campo.length + 2 && end > start
        ? texto.substring(start, end)
        : '';
  }

  final variante = extrairValor(textoItem, 'variante');
  final variante2 = extrairValor(textoItem, 'variante2');

  if (variante.isEmpty && variante2.isEmpty) {
    return ''; // Retorna vazio se não houver variantes
  }

  if (variante2.isEmpty) {
    return 'Variante: $variante';
  }

  if (variante.isEmpty) {
    return 'Variante: $variante2';
  }

  return 'Variante: $variante, $variante2';
}

bool verificarIntervaloPromocional2(String intervalo) {
  try {
    final now = DateTime.now();
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    // Divide o intervalo em partes
    final parts = intervalo.trim().split(' - ');
    if (parts.length != 2) return false;

    // Extrai data/hora de início
    final startPart = parts[0].trim();
    final startDateTime = timeFormat.parse(startPart);

    // Verifica se a promoção é para hoje (comparação de strings formatadas)
    if (dateFormat.format(startDateTime) != dateFormat.format(now)) {
      return false;
    }

    // Extrai hora de término
    final endTime = parts[1].trim();

    // Tratamento especial para meia-noite (00:00)
    final endDateTime = endTime == '00:00'
        ? DateTime(startDateTime.year, startDateTime.month,
            startDateTime.day + 1, 0, 0)
        : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

    // Verifica se está dentro do intervalo
    return now.isAfter(startDateTime) && now.isBefore(endDateTime);
  } catch (e) {
    print('Erro ao verificar intervalo: $e');
    return false;
  }
}

String afiliadoSaldoTotal(String texto) {
  try {
    // Expressão regular para encontrar o valorTotalComissao
    final regex = RegExp(r'\(valorTotalComissao "([^"]+)"\)');
    final match = regex.firstMatch(texto);

    if (match != null && match.groupCount >= 1) {
      return match.group(1)!.trim(); // Retorna o valor limpo (sem espaços)
    }
    return '0,00'; // Valor padrão se não encontrar
  } catch (e) {
    return '0,00'; // Valor padrão em caso de erro
  }
}

String promoRelampago0hAmanha() {
  final amanha = DateTime.now().add(const Duration(days: 1)); // Adiciona 1 dia
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(amanha);

  return '$dataFormatada 00:00 - 09:00'; // Texto fixo com data de amanhã
}

String parcelamentoFeed(double valor) {
  // Declaração das variáveis de taxa primeiro
  double taxa1x = 0.05;
  double taxa2x = 0.07;
  double taxa3x = 0.08;
  double taxa4x = 0.085;
  double taxa5x = 0.095;
  double taxa6x = 0.105;
  double taxa7x = 0.12;
  double taxa8x = 0.13;
  double taxa9x = 0.145;
  double taxa10x = 0.155;
  double taxa11x = 0.17;
  double taxa12x = 0.18;

  // Restante do código (todas as faixas e cálculos) permanece igual...
  List<Map<String, dynamic>> faixas1x = [
    {'limite': 10, 'taxa': 0.094},
    {'limite': 20, 'taxa': 0.069},
    {'limite': 30, 'taxa': 0.071},
    {'limite': 40, 'taxa': 0.058},
    {'limite': 60, 'taxa': 0.055},
    {'limite': 80, 'taxa': 0.055},
    {'limite': 100, 'taxa': 0.055},
    {'limite': 140, 'taxa': 0.055},
    {'limite': 200, 'taxa': 0.05},
    {'limite': 300, 'taxa': 0.05}
  ];

  // ... (mantenha TODAS as outras faixas exatamente como estão no seu código original)

  // ... (mantenha TODOS os cálculos de taxa exatamente como estão)

  // Cálculo das parcelas (MANTENHA todo este bloco IDÊNTICO ao original)
  List<String> parcelas = [];

  double valorFinal1x = valor * (1 + taxa1x);
  parcelas.add("1x " +
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
          .format(valorFinal1x)
          .replaceAll(' ', ''));

  if (valor >= 10) {
    double valorParcelado2x = valor / 2 * (1 + taxa2x);
    parcelas.add("2x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado2x)
            .replaceAll(' ', ''));
  }

  if (valor >= 15) {
    double valorParcelado3x = valor / 3 * (1 + taxa3x);
    parcelas.add("3x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado3x)
            .replaceAll(' ', ''));
  }

  if (valor >= 20) {
    double valorParcelado4x = valor / 4 * (1 + taxa4x);
    parcelas.add("4x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado4x)
            .replaceAll(' ', ''));
  }

  if (valor >= 30) {
    double valorParcelado5x = valor / 5 * (1 + taxa5x);
    parcelas.add("5x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado5x)
            .replaceAll(' ', ''));
  }

  if (valor >= 30) {
    double valorParcelado6x = valor / 6 * (1 + taxa6x);
    parcelas.add("6x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado6x)
            .replaceAll(' ', ''));
  }

  if (valor >= 40) {
    double valorParcelado7x = valor / 7 * (1 + taxa7x);
    parcelas.add("7x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado7x)
            .replaceAll(' ', ''));
  }

  if (valor >= 40) {
    double valorParcelado8x = valor / 8 * (1 + taxa8x);
    parcelas.add("8x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado8x)
            .replaceAll(' ', ''));
  }

  if (valor >= 40) {
    double valorParcelado9x = valor / 9 * (1 + taxa9x);
    parcelas.add("9x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado9x)
            .replaceAll(' ', ''));
  }

  if (valor >= 50) {
    double valorParcelado10x = valor / 10 * (1 + taxa10x);
    parcelas.add("10x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado10x)
            .replaceAll(' ', ''));
  }

  if (valor >= 50) {
    double valorParcelado11x = valor / 11 * (1 + taxa11x);
    parcelas.add("11x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado11x)
            .replaceAll(' ', ''));
  }

  if (valor >= 50) {
    double valorParcelado12x = valor / 12 * (1 + taxa12x);
    parcelas.add("12x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado12x)
            .replaceAll(' ', ''));
  }

  // ÚNICA ALTERAÇÃO REALIZADA - Retorna apenas o último elemento da lista
  return parcelas.isNotEmpty
      ? parcelas.last
      : '1x ' +
          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
              .format(valor * (1 + taxa1x))
              .replaceAll(' ', '');
}

String afiliadoVendaEntreMenos(String valorAntes) {
  try {
    // Verifica se é um intervalo (contém "-")
    if (valorAntes.contains("-")) {
      // Divide a string em partes
      List<String> partes = valorAntes.split("-");

      // Processa o primeiro valor (antes do "-")
      String primeiroValorStr = partes[0].trim();
      double primeiroValor = double.parse(primeiroValorStr
              .replaceAll("R\$", "")
              .replaceAll(".", "")
              .replaceAll(",", ".")) -
          1.0;

      // Processa o segundo valor (depois do "-")
      String segundoValorStr = partes[1].trim();
      double segundoValor = double.parse(segundoValorStr
              .replaceAll("R\$", "")
              .replaceAll(".", "")
              .replaceAll(",", ".")) -
          1.0;

      // Formata os novos valores (garantindo que não fique negativo)
      final formatador = NumberFormat.currency(
          locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);

      String novoPrimeiroValor =
          formatador.format(primeiroValor < 0 ? 0 : primeiroValor);
      String novoSegundoValor =
          formatador.format(segundoValor < 0 ? 0 : segundoValor);

      return "$novoPrimeiroValor - $novoSegundoValor";
    } else {
      // Processa um único valor
      double valorUnico = double.parse(valorAntes
              .replaceAll("R\$", "")
              .replaceAll(".", "")
              .replaceAll(",", ".")) -
          1.0;

      final formatador = NumberFormat.currency(
          locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);

      // Evita valor negativo
      return formatador.format(valorUnico < 0 ? 0 : valorUnico);
    }
  } catch (e) {
    // Em caso de erro, retorna o valor original
    return valorAntes;
  }
}

String promoRelampago18h() {
  final agora = DateTime.now();
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(agora);

  return '$dataFormatada 18:00 - 21:00'; // Texto fixo após a data
}

String promoRelampago0h() {
  final agora = DateTime.now();
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(agora);

  return '$dataFormatada 00:00 - 09:00'; // Texto fixo após a data
}

String promoRelampago21h() {
  final agora = DateTime.now();
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(agora);

  return '$dataFormatada 21:00 - 00:00'; // Texto fixo após a data
}

bool carrinhoLoja4(
  List<CarrinhoRecord> queryList,
  DocumentReference produtoRef,
) {
  // Dicionário para armazenar o último produto visto de cada loja
  final Map<DocumentReference, DocumentReference> ultimosPorLoja = {};

  // Primeira passada: identificar o último produto de cada loja
  for (final produto in queryList) {
    final lojaRef = produto.lojaRef;

    if (lojaRef != null) {
      // Sempre atualiza com o último produto encontrado para cada loja
      ultimosPorLoja[lojaRef] = produto.reference;
    }
  }

  // Segunda passada: verificar se o produto em questão é o último de sua loja
  for (final produto in queryList) {
    if (produto.reference == produtoRef) {
      final lojaRef = produto.lojaRef;

      if (lojaRef != null) {
        // Verifica se este produto é o último registrado para sua loja
        return ultimosPorLoja[lojaRef] == produtoRef;
      }
      break;
    }
  }

  // Caso o produto não seja encontrado
  return false;
}

double taxaCartaoDouble(
  double produto,
  String parcela,
) {
  // Remover todos os caracteres invisíveis e espaços extras
  final parcelaFormatada = parcela.replaceAll(RegExp(r'\s+'), ' ').trim();

  // Extrair o número de parcelas e o valor da parcela da string
  final regex = RegExp(r'(\d+)x R\$ (\d+,\d{2})');
  final match = regex.firstMatch(parcelaFormatada);

  if (match == null) {
    return 0.0; // Retorna 0.0 caso o formato seja inválido
  }

  // Capturar o número de parcelas e o valor da parcela
  final numParcelas = int.parse(match.group(1)!);
  final valorParcelaStr =
      match.group(2)!.replaceAll(',', '.'); // Substituir vírgula por ponto
  final valorParcela = double.parse(valorParcelaStr);

  // Calcular o valor total pago
  final valorTotal = valorParcela * numParcelas;

  // Calcular a diferença entre o valor total e o valor do produto
  final diferenca = valorTotal - produto;

  // Retorna o valor com duas casas decimais
  return double.parse(diferenca.toStringAsFixed(2));
}

String calcularTotalDeQueriesTrue(List<CarrinhoRecord> queryList) {
  double totalGeral = 0.0;

  // Itera sobre a lista de registros de carrinho
  for (int i = 0; i < queryList.length; i++) {
    var item = queryList[i];
    var preco = item.preco; // Alterado de valorUnitario para preco
    var quantidade = item.quantidade;
    var selecionado = item.selecionado;

    // Verifica se o item está selecionado e se os valores são válidos
    if (selecionado == true && preco != null && quantidade != null) {
      // Calcula o total para o item e soma ao total geral
      totalGeral += preco * quantidade;
    }
  }

  // Formata o total geral no formato "1.545,56"
  final formatador = NumberFormat("#,##0.00", "pt_BR");
  return formatador.format(totalGeral);
}

int removerCaracteresInterge(String texto) {
  String numeros = texto.replaceAll(RegExp(r'[^0-9]'), '');
  return int.tryParse(numeros) ?? 0;
}

double somarValoresStringList(List<String> valores) {
  double soma = 0.0;

  for (String valor in valores) {
    soma +=
        double.parse(valor.trim()); // Converte cada string para double e soma
  }

  return soma;
}

bool promoRelampago9hTrue() {
  final horaAtual = DateTime.now().hour;

  // Retorna TRUE se for ANTES das 12:00 (false se for 12h ou mais)
  return horaAtual < 12;
}

double impostoImportacaoNovo(
  List<String> produtos,
  String freteStr,
  bool nacional,
) {
  // Se for nacional, retorna 0 SEM CÁLCULO
  if (nacional == true) {
    return 0.0;
  }

  // Constantes do cálculo (taxa de câmbio fixa)
  const double taxaCambio = 5.81; // 1 USD = 5.81 BRL (valor fixo)
  const double limiteIsencaoUSD = 50.0;
  const double taxaAteLimite = 0.20; // 20%
  const double taxaAcimaLimite = 0.60; // 60%
  const double descontoAcimaLimite = 20.0; // $20
  const double acrescimoFixoBRL = 1.00; // Acréscimo de R$1,00

  // Cálculo do valor total dos produtos EM DÓLAR
  double valorTotalProdutosUSD = 0.0;

  for (final produtoStr in produtos) {
    try {
      // Extrai valor unitário em BRL
      final valorMatch =
          RegExp(r'\(valor Unidade "R\$([\d,]+)"\)').firstMatch(produtoStr);
      final valorBRL = double.tryParse(
              valorMatch?.group(1)?.replaceAll('.', '').replaceAll(',', '.') ??
                  '0') ??
          0.0;

      // Extrai quantidade
      final qtdMatch = RegExp(r'\(quantidade "(\d+)"\)').firstMatch(produtoStr);
      final quantidade = int.tryParse(qtdMatch?.group(1) ?? '1') ?? 1;

      // Converte para USD e acumula
      valorTotalProdutosUSD += (valorBRL * quantidade) / taxaCambio;
    } catch (e) {
      print('Erro ao processar produto: $e');
    }
  }

  // CORREÇÃO: Processamento do frete EM DÓLAR
  final freteBRL =
      double.tryParse(freteStr.replaceAll('R\$', '').replaceAll(',', '.')) ??
          0.0;
  final freteUSD = freteBRL / taxaCambio;

  // Cálculo do valor total EM USD
  final totalPedidoUSD = valorTotalProdutosUSD + freteUSD;

  // Cálculo do imposto EM USD (núcleo do cálculo)
  double impostoUSD;

  if (totalPedidoUSD <= limiteIsencaoUSD) {
    impostoUSD = totalPedidoUSD * taxaAteLimite; // 20%
  } else {
    impostoUSD =
        (totalPedidoUSD * taxaAcimaLimite) - descontoAcimaLimite; // 60% - $20
    impostoUSD = impostoUSD.clamp(0.0, double.infinity); // Garante não negativo
  }

  // Conversão para BRL e adiciona R$1,00
  final impostoBRL = (impostoUSD * taxaCambio) + acrescimoFixoBRL;

  return double.parse(
      impostoBRL.toStringAsFixed(2)); // Arredonda para 2 decimais
}

String contaMultiplicacaoString(
  double valorX,
  double valorY,
) {
  double resultado = valorX * valorY;

  // Formata o resultado para o padrão de número com vírgula como separador decimal
  var formatador = NumberFormat('#,##0.00', 'pt_BR');
  return formatador.format(resultado);
}

String avaliacaoMediaLoja(List<AvaliacaoLojaRecord> query) {
  if (query.isEmpty) {
    return "4,9"; // Retorna 0,0 se a lista estiver vazia.
  }

  // Soma todas as notas e calcula a média.
  double soma = query.fold(0, (total, doc) => total + (doc.nota ?? 0));
  double media = soma / query.length;

  // Formata a média com apenas 1 casa decimal, substituindo o ponto por vírgula.
  String mediaFormatada = media.toStringAsFixed(1).replaceAll('.', ',');

  // Retorna a string formatada como "4,6".
  return "$mediaFormatada";
}

double avaliacaoMediaDouble(List<AvaliacaoRecord> query) {
  if (query.isEmpty) {
    return 0.0; // Retorna 0.0 se a lista estiver vazia.
  }

  // Soma todas as notas e calcula a média.
  double soma = query.fold(0, (total, doc) => total + (doc.nota ?? 0));
  return soma / query.length;
}

List<ProdutoRecord> buscarSugestoesCategoria(
  String? busca,
  List<ProdutoRecord> documentList,
  bool nacional,
  bool entregaRapida,
  bool lojasOficiais,
  bool envioInternacional,
  bool maisRecente,
  bool emDestaque,
  String? preco,
  int? quantidadeItem,
) {
  // Filtros padrão
  List<ProdutoRecord> listaFiltrada = documentList.where((produto) {
    if (nacional && produto.envioNaciona != true) return false;
    if (envioInternacional && produto.envioNaciona == true) return false;
    if (entregaRapida && produto.freteRapido != true) return false;
    if (lojasOficiais && produto.lojaOficial != true) return false;
    return true;
  }).toList();

  void aplicarOrdenacao(List<ProdutoRecord> lista) {
    if (preco != null) {
      if (preco == 'mais') {
        lista.sort((a, b) => (b.preco ?? 0.0).compareTo(a.preco ?? 0.0));
      } else if (preco == 'menos') {
        lista.sort((a, b) => (a.preco ?? 0.0).compareTo(b.preco ?? 0.0));
      }
    } else if (emDestaque) {
      lista.sort((a, b) {
        final vendasCompare = (b.vendas ?? 0).compareTo(a.vendas ?? 0);
        return vendasCompare != 0 ? vendasCompare : b.data!.compareTo(a.data!);
      });
    } else if (maisRecente) {
      lista.sort((a, b) => b.data!.compareTo(a.data!));
    }
  }

  int determinarQuantidade(int tamanhoLista) {
    if (quantidadeItem == null || quantidadeItem <= 0) {
      return math.min(12, tamanhoLista);
    } else {
      return math.min(quantidadeItem, tamanhoLista);
    }
  }

  if (busca == null || busca.isEmpty) {
    aplicarOrdenacao(listaFiltrada);
    return listaFiltrada
        .take(determinarQuantidade(listaFiltrada.length))
        .toList();
  }

  busca = busca.toLowerCase();
  List<ProdutoRecord> sugestoesExatas = [];
  List<ProdutoRecord> sugestoesFrase = [];
  List<ProdutoRecord> sugestoesAmpla = [];

  for (var produto in listaFiltrada) {
    bool corresponde = false;

    // Checar palavras-chave
    if (produto.palavrasChaveList != null) {
      for (var palavra in produto.palavrasChaveList!) {
        String palavraLower = palavra.toLowerCase();
        if (palavraLower == busca) {
          sugestoesExatas.add(produto);
          corresponde = true;
          break;
        } else if (!corresponde && palavraLower.startsWith(busca)) {
          sugestoesFrase.add(produto);
          corresponde = true;
          break;
        } else if (!corresponde && palavraLower.contains(busca)) {
          sugestoesAmpla.add(produto);
          corresponde = true;
          break;
        }
      }
    }

    if (corresponde) continue;

    // Checar categorias (lider1 a lider4)
    List<String?> categorias = [
      produto.lider1,
      produto.lider2,
      produto.lider3,
      produto.lider4,
    ];

    for (var cat in categorias) {
      if (cat == null) continue;
      final catLower = cat.toLowerCase();
      if (catLower == busca) {
        sugestoesExatas.add(produto);
        break;
      } else if (catLower.startsWith(busca)) {
        sugestoesFrase.add(produto);
        break;
      } else if (catLower.contains(busca)) {
        sugestoesAmpla.add(produto);
        break;
      }
    }
  }

  // 🔒 Se nada foi encontrado em nenhuma forma, retorna vazio
  if (sugestoesExatas.isEmpty &&
      sugestoesFrase.isEmpty &&
      sugestoesAmpla.isEmpty) {
    return [];
  }

  List<ProdutoRecord> resultado = [
    ...sugestoesExatas,
    ...sugestoesFrase,
    ...sugestoesAmpla,
  ];

  aplicarOrdenacao(resultado);
  return resultado.take(determinarQuantidade(resultado.length)).toList();
}

List<ProdutoRecord> buscarSugestoesPalavrasChaveDoc2(
  String? busca,
  List<ProdutoRecord> documentList,
  bool nacional,
  bool entregaRapida,
  bool lojasOficiais,
  bool envioInternacional,
  bool maisRecente,
  bool emDestaque,
  String? preco,
  int? quantidadeItem,
) {
  // Primeiro aplicamos todos os filtros
  List<ProdutoRecord> listaFiltrada = documentList.where((produto) {
    if (nacional && produto.envioNaciona != true) return false;
    if (envioInternacional && produto.envioNaciona == true) return false;
    if (entregaRapida && produto.freteRapido != true) return false;
    if (lojasOficiais && produto.lojaOficial != true) return false;
    return true;
  }).toList();

  // Ordenação
  void aplicarOrdenacao(List<ProdutoRecord> lista) {
    if (preco != null) {
      if (preco == 'mais') {
        lista.sort((a, b) => (b.preco ?? 0.0).compareTo(a.preco ?? 0.0));
      } else if (preco == 'menos') {
        lista.sort((a, b) => (a.preco ?? 0.0).compareTo(b.preco ?? 0.0));
      }
    } else if (emDestaque) {
      lista.sort((a, b) {
        final vendasCompare = (b.vendas ?? 0).compareTo(a.vendas ?? 0);
        return vendasCompare != 0 ? vendasCompare : b.data!.compareTo(a.data!);
      });
    } else if (maisRecente) {
      lista.sort((a, b) => b.data!.compareTo(a.data!));
    }
  }

  int determinarQuantidade(int tamanhoLista) {
    if (quantidadeItem == null || quantidadeItem <= 0) {
      return math.min(12, tamanhoLista);
    } else {
      return math.min(quantidadeItem, tamanhoLista);
    }
  }

  if (busca == null || busca.isEmpty) {
    aplicarOrdenacao(listaFiltrada);
    return listaFiltrada
        .take(determinarQuantidade(listaFiltrada.length))
        .toList();
  }

  busca = busca.toLowerCase();

  // Listas para sugestão por relevância
  List<ProdutoRecord> sugestoesExatas = [];
  List<ProdutoRecord> sugestoesFrase = [];
  List<ProdutoRecord> sugestoesAmpla = [];

  for (var produto in listaFiltrada) {
    bool adicionou = false;

    // --- Verifica palavras-chave
    if (produto.palavrasChaveList != null) {
      for (var palavra in produto.palavrasChaveList!) {
        final palavraLower = palavra.toLowerCase();
        if (palavraLower == busca) {
          sugestoesExatas.add(produto);
          adicionou = true;
          break;
        } else if (palavraLower.startsWith(busca)) {
          sugestoesFrase.add(produto);
          adicionou = true;
          break;
        } else if (palavraLower.contains(busca)) {
          sugestoesAmpla.add(produto);
          adicionou = true;
          break;
        }
      }
    }

    // --- Verifica categorias (lider1 a lider4) se ainda não adicionou
    if (!adicionou) {
      final categorias = [
        produto.lider1?.toLowerCase(),
        produto.lider2?.toLowerCase(),
        produto.lider3?.toLowerCase(),
        produto.lider4?.toLowerCase()
      ].whereType<String>().toList();

      for (var categoria in categorias) {
        if (categoria == busca) {
          sugestoesExatas.add(produto);
          adicionou = true;
          break;
        } else if (categoria.startsWith(busca)) {
          sugestoesFrase.add(produto);
          adicionou = true;
          break;
        } else if (categoria.contains(busca)) {
          sugestoesAmpla.add(produto);
          adicionou = true;
          break;
        }
      }
    }
  }

  // Se não achou correspondência com palavras ou categorias, retorna lista filtrada
  if (sugestoesExatas.isEmpty &&
      sugestoesFrase.isEmpty &&
      sugestoesAmpla.isEmpty) {
    aplicarOrdenacao(listaFiltrada);
    return listaFiltrada
        .take(determinarQuantidade(listaFiltrada.length))
        .toList();
  }

  // Junta os resultados
  List<ProdutoRecord> resultado = [
    ...sugestoesExatas,
    ...sugestoesFrase,
    ...sugestoesAmpla,
  ];

  aplicarOrdenacao(resultado);
  return resultado.take(determinarQuantidade(resultado.length)).toList();
}

int statusFinalizado(List<PedidosTotalRecord> query) {
  // Filtra os documentos que têm o status "preparando" e retorna a contagem
  int quantidadePreparando =
      query.where((pedido) => pedido.status == "finalizado").length;

  return quantidadePreparando;
}

String calcularTotalDeQueriesAfiliado(List<String> carrinhoList) {
  double totalGeral = 0.0;

  for (String itemStr in carrinhoList) {
    // Extrai os valores usando expressões regulares
    RegExp valorUnidadeExp = RegExp(r'valor_unidade "([^"]+)"');
    RegExp quantidadeExp = RegExp(r'quantidade "([^"]+)"');
    RegExp selecionadoExp = RegExp(r'selecionado "([^"]+)"');

    String? valorUnidadeStr = valorUnidadeExp.firstMatch(itemStr)?.group(1);
    String? quantidadeStr = quantidadeExp.firstMatch(itemStr)?.group(1);
    String? selecionadoStr = selecionadoExp.firstMatch(itemStr)?.group(1);

    // Verifica se o item está selecionado e se os valores existem
    if (selecionadoStr == "Sim" &&
        valorUnidadeStr != null &&
        quantidadeStr != null) {
      try {
        // Converte valor_unidade para double (tratando formato monetário BR)
        double valorUnidade = double.parse(valorUnidadeStr
            .replaceAll('R\$', '')
            .replaceAll('.', '')
            .replaceAll(',', '.')
            .trim());

        int quantidade = int.parse(quantidadeStr);

        // Soma ao total geral
        totalGeral += valorUnidade * quantidade;
      } catch (e) {
        // Ignora itens com valores inválidos
        continue;
      }
    }
  }

  // Formata o resultado (ex: "1.234,56")
  final formatador = NumberFormat("#,##0.00", "pt_BR");
  return formatador.format(totalGeral);
}

double somarValoresDoubleList(List<double> valores) {
  double soma = 0.0;
  for (double valor in valores) {
    soma += valor;
  }
  return soma;
}

List<double>? listaValorDuplicado(
  List<double> pesoAtual,
  double novoPeso,
) {
// Cria uma cópia da lista atual para evitar modificar diretamente o estado
  List<double> novaLista = List.from(pesoAtual);
  // Adiciona o novo peso à lista de históricos de peso
  novaLista.add(novoPeso);
  return novaLista;
}

String gerarValorUnitarioString(List<CarrinhoRecord> queryList) {
  String resultado = '';

  // Itera sobre a lista de registros de carrinho
  for (int i = 0; i < queryList.length; i++) {
    // Acessa o campo 'preco' do CarrinhoRecord
    var preco = queryList[i].preco;

    if (preco != null) {
      // Concatena o valor com o identificador (queryList1, queryList2, etc.)
      resultado += '${preco.toString()} (queryList${i + 1})';

      // Adiciona um espaço entre os valores, exceto no final da lista
      if (i < queryList.length - 1) {
        resultado += ' ';
      }
    }
  }

  return resultado;
}

String calcularTotalDeQueries(List<CarrinhoRecord> queryList) {
  double totalGeral = 0.0;

  // Itera sobre a lista de registros de carrinho
  for (int i = 0; i < queryList.length; i++) {
    var preco = queryList[i].preco; // Alterado de valorUnitario para preco
    var quantidade = queryList[i].quantidade;

    // Verifica se ambos os valores existem e são válidos
    if (preco != null && quantidade != null) {
      // Alterado de valorUnitario para preco
      // Calcula o total para o item e soma ao total geral
      totalGeral += preco * quantidade; // Alterado de valorUnitario para preco
    }
  }

  // Retorna o total geral formatado com 2 casas decimais como string
  return totalGeral.toStringAsFixed(2);
}

String somarQuantidadesTotal(List<CarrinhoRecord> queryList) {
  int totalQuantidade = 0;

  // Itera sobre a lista de registros de carrinho
  for (int i = 0; i < queryList.length; i++) {
    var quantidade = queryList[i].quantidade;

    // Verifica se a quantidade existe e é válida
    if (quantidade != null) {
      // Soma a quantidade ao total
      totalQuantidade += quantidade;
    }
  }

  // Retorna o total como uma string
  return totalQuantidade.toString();
}

String valorDoubleEmString(double valor) {
  final formatador = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '', // Sem o símbolo de moeda.
    decimalDigits: 2, // Força duas casas decimais.
  );
  return formatador.format(valor).trim();
}

String valorCentavosEmString(double valor) {
  // Isola a parte decimal, garante 2 casas decimais e converte para string.
  final centavos = ((valor * 100).round() % 100).toString().padLeft(2, '0');
  return ",$centavos";
}

String valorRealString(double valor) {
  final formatador =
      NumberFormat.decimalPattern('pt_BR'); // Formato brasileiro para números.
  return formatador.format(valor.floor()); // Remove os centavos com floor().
}

bool carrinhoAfiliadTodosListaBoolean(List<String> listaProdutos) {
  // Se a lista estiver vazia, considera como não selecionado
  if (listaProdutos.isEmpty) {
    return false;
  }

  // Verifica se TODOS os produtos estão com selecionado = "Sim"
  return listaProdutos.every((produto) {
    final match = RegExp(r'\(selecionado\s+"([^"]+)"\)').firstMatch(produto);
    return match != null && match.group(1) == 'Sim';
  });
}

List<String> carrinhoAfiliadTodosLista(List<String> listaProdutos) {
  // Verifica se TODOS os produtos estão selecionados ("Sim")
  final todosSelecionados = listaProdutos.every((produto) {
    final match = RegExp(r'\(selecionado\s+"([^"]+)"\)').firstMatch(produto);
    return match != null && match.group(1) == 'Sim';
  });

  // Determina o novo valor para selecionado
  final novoValor = todosSelecionados ? 'Não' : 'Sim';

  // Atualiza TODOS os produtos da lista
  return listaProdutos.map((produto) {
    return produto.replaceAllMapped(
      RegExp(r'\(selecionado\s+"([^"]+)"\)'),
      (match) => '(selecionado "$novoValor")',
    );
  }).toList();
}

bool carrinhoAfiliadoLojaBoolean(
  List<String> listaProdutos,
  String lojaRef,
) {
  // Extrai o valor da lojaRef da string de entrada
  final lojaRefMatch = RegExp(r'\(lojaRef\s+"([^"]+)"\)').firstMatch(lojaRef);
  if (lojaRefMatch == null || lojaRefMatch.groupCount < 1) {
    return false; // Se não encontrar lojaRef, retorna false
  }
  final lojaRefAlvo = lojaRefMatch.group(1);

  // Filtra apenas os produtos da loja alvo
  final produtosDaLoja = listaProdutos.where((produto) {
    final match = RegExp(r'\(lojaRef\s+"([^"]+)"\)').firstMatch(produto);
    return match != null && match.group(1) == lojaRefAlvo;
  }).toList();

  // Se não houver produtos da loja, retorna false
  if (produtosDaLoja.isEmpty) {
    return false;
  }

  // Verifica se TODOS os produtos da loja estão selecionados
  return produtosDaLoja.every((produto) {
    final match = RegExp(r'\(selecionado\s+"([^"]+)"\)').firstMatch(produto);
    return match != null && match.group(1) == 'Sim';
  });
}

bool carrinhoAfiliadoSelecionadoBoolen(String produto) {
  // Procura pelo padrão (selecionado "valor") na string
  final selecionadoMatch =
      RegExp(r'\(selecionado\s+"([^"]+)"\)').firstMatch(produto);

  if (selecionadoMatch != null && selecionadoMatch.groupCount >= 1) {
    // Extrai o valor do campo selecionado
    final valorSelecionado = selecionadoMatch.group(1);
    // Retorna true apenas se for "Sim" (case sensitive)
    return valorSelecionado == 'Sim';
  }

  // Retorna false se não encontrar o campo ou se for qualquer outro valor
  return false;
}

List<String> carrinhoAfiliadoNacionalFiltro2(List<String> produtosCarrinho) {
  return produtosCarrinho.where((produto) {
    // Procura pelo campo "nacional" no produto
    final nacionalMatch =
        RegExp(r'\(nacional\s+"([^"]+)"\)').firstMatch(produto);

    // Verifica se encontrou o campo e se o valor é "Não"
    return nacionalMatch != null && nacionalMatch.group(1) == 'Não';
  }).toList();
}

bool carrinhoIndexUltimo22(
  int? indexAtual,
  List<String> documentList,
) {
  if (indexAtual == null || documentList.isEmpty) {
    return false;
  }
  return indexAtual == documentList.length - 1;
}

String estimativaEntregaInternacional() {
// Data de hoje
  DateTime hoje = DateTime.now();

  // Calculando as datas de estimativa
  DateTime primeiraEstimativa = hoje.add(Duration(days: 16));
  DateTime segundaEstimativa = hoje.add(Duration(days: 31));

  // Formatando as datas
  String formatarData(DateTime data) {
    return DateFormat("d/MMM", "pt_BR").format(data).toLowerCase();
  }

  String primeiraData = formatarData(primeiraEstimativa);
  String segundaData = formatarData(segundaEstimativa);

  // Retornando a string no formato desejado
  return "Receba entre $primeiraData e $segundaData";
}

bool carrinhoLoja2(
  List<CarrinhoRecord> queryList,
  DocumentReference produtoRef,
) {
  // Agrupa os produtos por lojaRef
  final Map<DocumentReference, List<CarrinhoRecord>> lojasMap = {};
  for (var produto in queryList) {
    final lojaRef = produto.lojaRef!;
    if (!lojasMap.containsKey(lojaRef)) {
      lojasMap[lojaRef] = [];
    }
    lojasMap[lojaRef]!.add(produto);
  }

  // Itera sobre as lojas e define os valores booleanos
  for (var entry in lojasMap.entries) {
    final produtosDaLoja = entry.value;

    for (int i = 0; i < produtosDaLoja.length; i++) {
      final produtoAtual = produtosDaLoja[i];

      // Se for o primeiro ou o último produto, retorna false
      if (i == 0 || i == produtosDaLoja.length - 1) {
        if (produtoAtual.reference == produtoRef) {
          return false;
        }
      } else {
        // Caso contrário, retorna true
        if (produtoAtual.reference == produtoRef) {
          return true;
        }
      }
    }
  }

  // Caso não encontre o produto na lista, retorna false
  return false;
}

String cardAA(String aa) {
  String year = aa.split('/')[1];
  return '20$year';
}

bool verificarPrimeiroDaLoja(
  List<String> queryList,
  String produtoString,
) {
  // Função para extrair valores (mantida igual)
  String extrairValor(String texto, String campo) {
    try {
      final start = texto.indexOf('($campo "') + campo.length + 3;
      final end = texto.indexOf('")', start);
      return texto.substring(start, end);
    } catch (e) {
      return '';
    }
  }

  // Extrai valores do produto alvo (com variantes se existirem)
  final produtoRefAlvo = extrairValor(produtoString, 'produtoRef');
  final lojaRefAlvo = extrairValor(produtoString, 'lojaRef');
  final varianteAlvo = extrairValor(produtoString, 'variante');
  final variante2Alvo = extrairValor(produtoString, 'variante2');

  final lojasVistas = <String>{};
  var primeiroProdutoEncontrado = false;

  for (final item in queryList) {
    final lojaRef = extrairValor(item, 'lojaRef');
    final produtoRef = extrairValor(item, 'produtoRef');
    final variante = extrairValor(item, 'variante');
    final variante2 = extrairValor(item, 'variante2');

    if (lojaRef.isEmpty) continue;

    // Verifica se é o mesmo produto+loja com mesmas variantes
    final isMesmoProduto =
        produtoRef == produtoRefAlvo && lojaRef == lojaRefAlvo;
    final isMesmasVariantes =
        variante == varianteAlvo && variante2 == variante2Alvo;

    if (!lojasVistas.contains(lojaRef)) {
      lojasVistas.add(lojaRef);

      if (isMesmoProduto && isMesmasVariantes) {
        primeiroProdutoEncontrado = true;
        return true;
      }
    } else {
      if (isMesmoProduto && isMesmasVariantes) {
        return false;
      }
    }
  }

  return primeiroProdutoEncontrado;
}

bool carrinhoLoja3(
  List<CarrinhoRecord> queryList,
  DocumentReference produtoRef,
) {
  // Conjunto para rastrear as lojas já processadas.
  final Set<DocumentReference> lojasVistas = {};

  // Itera sobre os produtos na lista do carrinho.
  for (int i = 0; i < queryList.length; i++) {
    final produto = queryList[i];
    final lojaRef = produto.lojaRef; // Obtém a referência da loja.

    // Certifique-se de que lojaRef não é nulo.
    if (lojaRef != null) {
      // Verifica se a loja já foi vista.
      if (!lojasVistas.contains(lojaRef)) {
        lojasVistas.add(lojaRef);

        // Verifica se o produto atual é o produtoRef.
        if (produto.reference == produtoRef) {
          // Verifica se é o único produto da loja.
          final outrosProdutosDaLoja = queryList
              .where((p) => p.lojaRef == lojaRef && p.reference != produtoRef)
              .toList();

          if (outrosProdutosDaLoja.isEmpty) {
            return true; // O produtoRef é o primeiro e único produto da loja.
          } else {
            return false; // O produtoRef é o primeiro, mas existem outros produtos na loja.
          }
        }
      } else {
        // Caso a loja já tenha sido vista, verifica se o produtoRef é o atual.
        if (produto.reference == produtoRef) {
          return false; // O produtoRef não é o primeiro produto da loja.
        }
      }
    }
  }

  // Caso o produtoRef não seja encontrado na lista.
  return false;
}

String porcentagemPromo(
  double precoantes,
  double precoatual,
) {
  if (precoantes == 0) {
    return "0%"; // Prevenção de divisão por zero.
  }

  // Calcula a variação percentual.
  final desconto = ((precoatual - precoantes) / precoantes) * 100;

  // Arredonda para o inteiro mais próximo e formata no estilo "-XX%".
  return "${desconto.toInt()}%";
}

String porcentagemPromo2(
  double precoantes,
  double precoatual,
) {
  if (precoantes == 0) {
    return "0%"; // Prevenção de divisão por zero.
  }

  // Calcula a variação percentual.
  final desconto = ((precoatual - precoantes) / precoantes) * 100;

  // Arredonda para o inteiro mais próximo, remove o sinal negativo e formata como "XX%"
  return "${desconto.toInt().abs()}%";
}

String contaDeMenosXY(
  double precorevenda,
  double precovenda,
) {
  // Realiza a subtração
  final diferenca = precorevenda - precovenda;

  // Formata o resultado como dinheiro no estilo brasileiro
  final formatador =
      NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2);
  return formatador.format(diferenca);
}

String idAfiliado(
  String nome,
  String sobrenome,
  String contato,
) {
  // Obtém os 4 últimos dígitos do contato
  String ultimosQuatroDigitos = contato.substring(contato.length - 4);

  // Monta o ID no formato "nome.sobrenome4912"
  String id = '$nome.$sobrenome$ultimosQuatroDigitos'.toLowerCase();

  return id;
}

String carrinhoTemporarioTitulo(String texto) {
  // Expressão regular para encontrar o título
  final regex = RegExp(r'\(titulo\s"([^"]*)"\)');
  final match = regex.firstMatch(texto);

  if (match == null || match.groupCount < 1) {
    throw Exception('Formato inválido: título não encontrado');
  }

  return match.group(1)!;
}

String carrinhoTemporarioQuantidadeUpdateMais(String texto) {
  // Extrai a quantidade atual
  final qtdRegex = RegExp(r'\(quantidade\s"(\d+)"\)');
  final match = qtdRegex.firstMatch(texto);

  if (match == null) {
    throw Exception('Formato inválido: quantidade não encontrada');
  }

  final qtdAtual = int.parse(match.group(1)!);
  final novaQtd = qtdAtual + 1;

  // Substitui a quantidade antiga pela nova
  return texto.replaceFirst(
    '(quantidade "${qtdAtual}")',
    '(quantidade "$novaQtd")',
  );
}

String carrinhoTemporarioQuantidadeUpdateMenos(String texto) {
  // Extrai a quantidade atual
  final qtdRegex = RegExp(r'\(quantidade\s"(\d+)"\)');
  final match = qtdRegex.firstMatch(texto);

  if (match == null) {
    throw Exception('Formato inválido: quantidade não encontrada');
  }

  final qtdAtual = int.parse(match.group(1)!);
  final novaQtd =
      qtdAtual > 1 ? qtdAtual - 1 : 1; // Não permite valores menores que 1

  // Substitui a quantidade antiga pela nova
  return texto.replaceFirst(
    '(quantidade "${qtdAtual}")',
    '(quantidade "$novaQtd")',
  );
}

bool carrinhoTemporarioQuantidadeMinima(String texto) {
  // Expressão regular para extrair a quantidade
  final regex = RegExp(r'\(quantidade\s"(\d+)"\)');
  final match = regex.firstMatch(texto);

  if (match == null || match.groupCount < 1) {
    return false;
  }

  // Converte para inteiro e verifica se é igual a 1
  return int.parse(match.group(1)!) == 1;
}

String carrinhoTemporarioImg(String texto) {
  // Expressão regular para extrair a URL completa da foto
  final regex = RegExp(r'\(foto\s"((?:https?://|/)[^"]+)"\)');
  final match = regex.firstMatch(texto);

  if (match == null || match.groupCount < 1) {
    return ''; // Retorna string vazia se não encontrar
  }

  return match.group(1)!; // Retorna a URL completa
}

double carrinhoTemporarioValor(String texto) {
  // Expressão regular para encontrar o valor_unidade
  final regex = RegExp(r'\(valor_unidade\s"R\$\s*([\d.,]+)"\)');
  final match = regex.firstMatch(texto);

  if (match == null || match.groupCount < 1) {
    throw Exception('Formato inválido: valor_unidade não encontrado');
  }

  // Remove pontos (separadores de milhar) e substitui vírgula por ponto
  final valorStr = match.group(1)!.replaceAll('.', '').replaceAll(',', '.');

  return double.parse(valorStr);
}

double carrinhoTemporarioValorAntes(String texto) {
  // Expressão regular para encontrar o valor_antes
  final regex = RegExp(r'\(valor_antes\s"R\$\s*([\d.,]+)"\)');
  final match = regex.firstMatch(texto);

  if (match == null || match.groupCount < 1) {
    throw Exception('Formato inválido: valor_antes não encontrado');
  }

  // Remove pontos (separadores de milhar) e substitui vírgula por ponto
  final valorStr = match.group(1)!.replaceAll('.', '').replaceAll(',', '.');

  return double.parse(valorStr);
}

bool carrinhoTemporarioVarianteExiste(String texto) {
  // Verifica se o padrão '(variante "' existe no texto
  return texto.contains('(variante "') &&
      texto.indexOf('(variante "') <
          texto.indexOf('")', texto.indexOf('(variante "'));
}

int carrinhoTemporarioQuantidade(String texto) {
  // Expressão regular para encontrar a quantidade
  final regex = RegExp(r'\(quantidade\s"(\d+)"\)');
  final match = regex.firstMatch(texto);

  if (match == null || match.groupCount < 1) {
    throw Exception('Formato inválido: quantidade não encontrada');
  }

  return int.parse(match.group(1)!);
}

String apenasNumeros(String string) {
  // Remove todos os caracteres que não são números
  return string.replaceAll(RegExp(r'[^0-9]'), '');
}

String contaMultiplicacaoStringCopy(
  double valorX,
  double valorY,
  double entrada3,
) {
  // Realiza a multiplicação
  double resultado = valorX * valorY;

  // Adiciona o valor de entrada3 ao resultado
  resultado += entrada3;

  // Formata o resultado para o padrão de número com vírgula como separador decimal
  var formatador = NumberFormat('#,##0.00', 'pt_BR');
  return formatador.format(resultado);
}

String chechoutTitulo(String entrada) {
  // Procura pelo padrão (titulo "VALOR") na string
  final tituloPattern = RegExp(r'\(titulo\s+"([^"]+)"\)');
  final match = tituloPattern.firstMatch(entrada);

  if (match != null && match.groupCount >= 1) {
    return match.group(1)!; // Retorna o título capturado
  }

  return ''; // Retorna string vazia se não encontrar
}

bool? carrinhoSelecionadoVisto2(
  List<CarrinhoRecord> documentList,
  DocumentReference lojaRef1,
) {
  // Filtra apenas os documentos com lojaRef igual à entrada lojaRef1
  final docsDaLoja =
      documentList.where((doc) => doc.lojaRef == lojaRef1).toList();

  if (docsDaLoja.isEmpty) {
    return false; // ou null, dependendo do comportamento desejado para lista vazia
  }

  // Verifica se TODOS os documentos filtrados têm "selecionado == true"
  return docsDaLoja.every((doc) => doc.selecionado == true);
}

double chechoutValorUnidade(String entrada) {
  // Procura pelo padrão (valor Unidade "R$XX,XX")
  final valorPattern = RegExp(r'\(valor Unidade\s+"R\$([^"]+)"\)');
  final match = valorPattern.firstMatch(entrada);

  if (match != null && match.groupCount >= 1) {
    String valorStr = match.group(1)!;

    // Substitui vírgula por ponto para parsear como double
    valorStr = valorStr.replaceAll('.', '').replaceAll(',', '.');

    try {
      return double.parse(valorStr);
    } catch (e) {
      return 0.0; // Retorna 0.0 se falhar o parse
    }
  }

  return 0.0; // Retorna 0.0 se não encontrar
}

String chechoutValorAntes(String entrada) {
  // Procura pelo padrão (valor antes "R$XX,XX")
  final valorAntesPattern = RegExp(r'\(valor antes\s+"(R\$[^"]+)"\)');
  final match = valorAntesPattern.firstMatch(entrada);

  if (match != null && match.groupCount >= 1) {
    return match.group(1)!; // Retorna o valor com "R$"
  }

  return ''; // Retorna string vazia se não encontrar
}

String chechoutQuantidade(String entrada) {
  // Procura pelo padrão (quantidade "VALOR") na string
  final quantidadePattern = RegExp(r'\(quantidade\s+"([^"]+)"\)');
  final match = quantidadePattern.firstMatch(entrada);

  if (match != null && match.groupCount >= 1) {
    return match.group(1)!; // Retorna a quantidade capturada
  }

  return ''; // Retorna string vazia se não encontrar
}

bool chechoutTemVariante(String entrada) {
  // Procura pelo padrão (variação "QUALQUER_COISA")
  final variacaoPattern = RegExp(r'\(variação\s+"([^"]+)"\)');
  final match = variacaoPattern.firstMatch(entrada);

  // Retorna true se encontrar, false se não encontrar
  return match != null;
}

String chechoutVariacao(String entrada) {
  // Procura pelo padrão (variação "VALOR") na string
  final variacaoPattern = RegExp(r'\(variação\s+"([^"]+)"\)');
  final match = variacaoPattern.firstMatch(entrada);

  if (match != null && match.groupCount >= 1) {
    return match.group(1)!; // Retorna a variação capturada
  }

  return ''; // Retorna string vazia se não encontrar
}

String freteCupom(
  String? enderecoCliente,
  List<String> listFrete,
  double freteBase,
  double? cupom,
  String tipoCupom,
  double valorProduto,
) {
  /// Avaliação do tipoCupom e valorProduto
  if (tipoCupom.isNotEmpty) {
    // Extrai o valor mínimo do tipoCupom usando regex
    final RegExp regex = RegExp(r'R\$(\d+(\.\d+)?)');
    final match = regex.firstMatch(tipoCupom);

    if (match != null) {
      final double valorMinimo = double.parse(match.group(1)!);

      // Verifica se o valorProduto está de acordo com o tipoCupom
      if (valorProduto < valorMinimo) {
        cupom =
            0; // Define o cupom como zero caso o produto não atenda ao requisito
      }
    }
  }

  /// Código existente
  Map<String, String> estados = {
    "Acre": "AC",
    "Alagoas": "AL",
    "Amapá": "AP",
    "Amazonas": "AM",
    "Bahia": "BA",
    "Ceará": "CE",
    "Distrito Federal": "DF",
    "Espírito Santo": "ES",
    "Goiás": "GO",
    "Maranhão": "MA",
    "Mato Grosso": "MT",
    "Mato Grosso do Sul": "MS",
    "Minas Gerais": "MG",
    "Pará": "PA",
    "Paraíba": "PB",
    "Paraná": "PR",
    "Pernambuco": "PE",
    "Piauí": "PI",
    "Rio de Janeiro": "RJ",
    "Rio Grande do Norte": "RN",
    "Rio Grande do Sul": "RS",
    "Rondônia": "RO",
    "Roraima": "RR",
    "Santa Catarina": "SC",
    "São Paulo": "SP",
    "Sergipe": "SE",
    "Tocantins": "TO",
  };

  String estadoCliente = "SP"; // Default
  if (enderecoCliente != null && enderecoCliente.isNotEmpty) {
    estados.forEach((nomeEstado, abreviacao) {
      if (enderecoCliente.contains(nomeEstado) ||
          enderecoCliente.contains(abreviacao)) {
        estadoCliente = abreviacao;
      }
    });
  }

  double porcentagemFrete = 0.0; // Default caso não encontre o estado
  for (String item in listFrete) {
    if (item.startsWith(estadoCliente)) {
      porcentagemFrete = double.parse(item.split(" ")[1]);
      break;
    }
  }

  double freteFinal = freteBase + (freteBase * porcentagemFrete / 100);

  if (cupom != null && cupom > 0) {
    freteFinal = math.max(0, freteFinal - cupom);
  }

  final NumberFormat formatter =
      NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  return formatter.format(freteFinal);
}

String gerarUrlCompartilhamento(
  String produtoRef,
  String produtoAfiliado,
) {
  // 1. URL base fixa (mantendo "paginaProdutoafl" e "produtoRef2")
  final String baseUrl = "https://rendashop.com.br/paginaProdutoafl";

  // 2. Concatena apenas os dois IDs (produtoAfiliado|produtoRef)
  final String urlCompleta =
      "$baseUrl?produtoRef2=$produtoAfiliado|$produtoRef";

  return urlCompleta;
}

String gerarEndereco(
  String rua,
  String numero,
  String bairro,
  String cidade,
  String estado,
  String cep,
) {
  return '$rua, $numero, $bairro\n$cidade, $estado, $cep';
}

String formatToBrazilianCurrency(String input) {
  // Remove todos os caracteres não numéricos
  String numericOnly = input.replaceAll(RegExp(r'[^0-9]'), '');

  // Se o número já estiver formatado (com vírgulas ou pontos), remove a formatação
  if (numericOnly.isEmpty) return 'R\$ 0,00';

  // Converte para double, dividindo por 100 para considerar as casas decimais
  double value = double.parse(numericOnly) / 100;

  // Formata o valor como moeda brasileira
  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  return currencyFormat.format(value);
}

double dinheiroStringemDouble(String valor) {
  // Remove "R$", "r$", e espaços extras, independentemente de maiúsculas/minúsculas
  String cleanValue = valor
      .replaceAll(RegExp(r'[Rr]\$\s?'), '')
      .replaceAll('.', '')
      .replaceAll(',', '.');

  // Converte o valor limpo para double
  return double.tryParse(cleanValue) ?? 0.0;
}

int stringEmInterger(String string) {
  // Remove possíveis espaços extras
  String cleanString = string.trim();

  // Tenta converter a string em um inteiro
  return int.tryParse(cleanString) ?? 0;
}

List<String> imageList(
  String? appstate1,
  String? appstate2,
  String? appstate3,
  String? appstate4,
  String? appstate5,
  String? appstate6,
  String? appstate7,
  String? appstate8,
  String? appstate9,
  String? appstate10,
) {
  // Cria uma lista com todas as imagens recebidas
  final List<String?> appStateImages = [
    appstate1,
    appstate2,
    appstate3,
    appstate4,
    appstate5,
    appstate6,
    appstate7,
    appstate8,
    appstate9,
    appstate10,
  ];

  // Filtra apenas as imagens válidas (não nulas e não vazias)
  final List<String> validImages = appStateImages
      .where((image) => image != null && image.isNotEmpty)
      .cast<String>() // Converte para List<String>
      .toList();

  return validImages;
}

String comissaoPerfilProdutoVariante(
  String precoStr,
  double preco2,
) {
  // 1. Extrai o valor numérico da String (trata tanto "R$10,00" quanto "R$10,00 - R$18,00")
  double preco = 0.0;

  try {
    // Remove "R$" e espaços
    String cleanedStr = precoStr.replaceAll("R\$", "").trim();

    // Verifica se é um intervalo (contém "-")
    if (cleanedStr.contains("-")) {
      // Divide em partes e pega o maior valor
      List<String> partes = cleanedStr.split("-");
      double valor1 =
          double.parse(partes[0].replaceAll(".", "").replaceAll(",", "."));
      double valor2 =
          double.parse(partes[1].replaceAll(".", "").replaceAll(",", "."));
      preco = valor1 > valor2 ? valor1 : valor2; // Pega o maior
    } else {
      // Caso único valor
      preco = double.parse(cleanedStr.replaceAll(".", "").replaceAll(",", "."));
    }
  } catch (e) {
    // Caso ocorra erro na conversão (fallback)
    preco = 0.0;
  }

  // 2. Calcula 15% do preço (agora extraído da String)
  double comissao = preco * 0.15;

  // 3. Soma preco2 e trunca para inteiro (como no original)
  double valorFinal = (comissao + preco2).truncateToDouble();

  // 4. Formata com 2 casas decimais (R$ opcional)
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$', // Agora com "R$"
    decimalDigits: 2,
  );

  return formatter.format(valorFinal).trim();
}

List<String> titulo2opcaoList(
  String? opcao1titulo2,
  String? opcao2titulo2,
  String? opcao3titulo2,
  String? opcao4titulo2,
  String? opcao5titulo2,
  String? opcao6titulo2,
  String? opcao7titulo2,
  String? opcao8titulo2,
  String? opcao9titulo2,
  String? opcao10titulo2,
) {
  // Cria uma lista com todas as opções recebidas
  final List<String?> appStateOptions = [
    opcao1titulo2,
    opcao2titulo2,
    opcao3titulo2,
    opcao4titulo2,
    opcao5titulo2,
    opcao6titulo2,
    opcao7titulo2,
    opcao8titulo2,
    opcao9titulo2,
    opcao10titulo2,
  ];

  // Filtra apenas as opções válidas (não nulas e não vazias)
  final List<String> validOptions = appStateOptions
      .where((option) => option != null && option.isNotEmpty)
      .cast<String>() // Converte para List<String>
      .toList();

  // Retorna a lista filtrada
  return validOptions;
}

int aumentar1numero(int entrada) {
  return entrada + 1;
}

int imageProduto(
  String imagem,
  List<String> imagemList,
) {
  // Itera pela lista de imagens para encontrar a URL correspondente
  for (int i = 0; i < imagemList.length; i++) {
    if (imagemList[i] == imagem) {
      return i; // Retorna o índice da imagem encontrada
    }
  }

  return -1; // Retorna -1 se a imagem não estiver na lista
}

List<String> addimgList(
  String? imagem1,
  String? imagem2,
  String? imagem3,
  String? imagem4,
  String? imagem5,
  String? imagem6,
  String? imagem7,
  String? imagem8,
  String? imagem9,
  String? imagem10,
  List<String>? imagemList,
) {
  // Lista com todas as entradas individuais de imagens
  List<String?> imagens = [
    imagem1,
    imagem2,
    imagem3,
    imagem4,
    imagem5,
    imagem6,
    imagem7,
    imagem8,
    imagem9,
    imagem10,
  ];

  // Inicializa a lista de resultados, removendo duplicatas das entradas individuais
  List<String> result = imagens
      .where((imagem) =>
          imagem != null && imagem.isNotEmpty) // Remove nulos e vazios
      .cast<String>() // Converte para List<String>
      .toSet() // Remove duplicatas (compara URLs)
      .toList(); // Converte de volta para lista

  // Adiciona imagens de `imagemList` que ainda não estão em `result`
  if (imagemList != null) {
    for (String imagem in imagemList) {
      if (!result.contains(imagem)) {
        result.add(imagem);
      }
    }
  }

  return result;
}

List<String> calcularFrete(
  double freteSP,
  double freteRJ,
) {
  // Calcula a diferença entre o valor de frete de RJ e SP
  double diferencaFrete = freteRJ - freteSP;

  // Lista base de fretes com os valores ajustados
  Map<String, double> baseFrete = {
    'SP': freteSP,
    'RJ': freteRJ,
    'MG': freteSP + diferencaFrete,
    'ES': freteSP + diferencaFrete,
    'PR': freteSP + diferencaFrete,
    'SC': freteSP + diferencaFrete,
    'RS': freteSP + diferencaFrete,
    'BA': freteSP + diferencaFrete,
    'PE': freteSP + diferencaFrete,
    'CE': freteSP + diferencaFrete,
    'MA': freteSP + diferencaFrete,
    'PI': freteSP + diferencaFrete,
    'RN': freteSP + diferencaFrete,
    'PB': freteSP + diferencaFrete,
    'AL': freteSP + diferencaFrete,
    'SE': freteSP + diferencaFrete,
    'MS': freteSP + diferencaFrete,
    'MT': freteSP + diferencaFrete,
    'GO': freteSP + diferencaFrete,
    'DF': freteSP + diferencaFrete,
    'AM': freteSP + diferencaFrete,
    'PA': freteSP + diferencaFrete,
    'RO': freteSP + diferencaFrete,
    'AC': freteSP + diferencaFrete,
    'RR': freteSP + diferencaFrete,
    'AP': freteSP + diferencaFrete,
  };

  // Lista para armazenar os resultados
  List<String> resultList = [];

  // Adiciona cada estado e seu valor de frete na lista de resultados
  baseFrete.forEach((estado, valor) {
    resultList.add('$estado ${valor.toStringAsFixed(2)}');
  });

  // Retorna a lista de resultados
  return resultList;
}

List<String> calcularfretee(
  double freteRJ,
  double freteSP,
) {
  // Calcula o aumento percentual do frete de RJ em relação a SP
  double porcentagemRJ = ((freteRJ - freteSP) / freteSP) * 100;

  // Lista base de variações em relação a SP (valor percentual)
  Map<String, double> baseFrete = {
    'SP': 0.0,
    'RJ': 12.58,
    'MG': 12.58,
    'ES': 50.52,
    'PR': 25.16,
    'SC': 37.73,
    'RS': 37.73,
    'BA': 50.52,
    'PE': 75.78,
    'CE': 88.25,
    'MA': 135.45,
    'PI': 63.1,
    'RN': 88.25,
    'PB': 135.45,
    'AL': 122.87,
    'SE': 88.25,
    'MS': 63.1,
    'MT': 75.78,
    'GO': 75.78,
    'DF': 37.73,
    'AM': 185.97,
    'PA': 160.6,
    'RO': 426.09,
    'AC': 148.13,
    'RR': 325.05,
    'AP': 779.83,
  };

  // Agora, ajusta a lista de todos os estados com base na porcentagem do frete de RJ sobre SP
  baseFrete.updateAll((key, value) {
    if (key == 'SP') {
      return 0.0; // SP mantém o valor de 0%
    }
    return value +
        porcentagemRJ -
        12.58; // Ajusta o valor com base na diferença percentual do RJ
  });

  // Cria a lista de resultados
  List<String> resultList = [];
  baseFrete.forEach((estado, valor) {
    resultList.add('$estado ${valor.toStringAsFixed(2)}');
  });

  return resultList;
}

String frete(
  String? enderecoCliente,
  List<String> listFrete,
  double freteBase,
) {
  // Lista de estados brasileiros com suas respectivas abreviações
  Map<String, String> estados = {
    "Acre": "AC",
    "Alagoas": "AL",
    "Amapá": "AP",
    "Amazonas": "AM",
    "Bahia": "BA",
    "Ceará": "CE",
    "Distrito Federal": "DF",
    "Espírito Santo": "ES",
    "Goiás": "GO",
    "Maranhão": "MA",
    "Mato Grosso": "MT",
    "Mato Grosso do Sul": "MS",
    "Minas Gerais": "MG",
    "Pará": "PA",
    "Paraíba": "PB",
    "Paraná": "PR",
    "Pernambuco": "PE",
    "Piauí": "PI",
    "Rio de Janeiro": "RJ",
    "Rio Grande do Norte": "RN",
    "Rio Grande do Sul": "RS",
    "Rondônia": "RO",
    "Roraima": "RR",
    "Santa Catarina": "SC",
    "São Paulo": "SP",
    "Sergipe": "SE",
    "Tocantins": "TO",
  };

  // Verifica o estado no endereço do cliente
  String estadoCliente = "SP"; // Default
  if (enderecoCliente != null && enderecoCliente.isNotEmpty) {
    estados.forEach((nomeEstado, abreviacao) {
      if (enderecoCliente.contains(nomeEstado) ||
          enderecoCliente.contains(abreviacao)) {
        estadoCliente = abreviacao;
      }
    });
  }

  // Busca a porcentagem de acréscimo na listFrete
  double porcentagemFrete = 0.0; // Default caso não encontre o estado
  for (String item in listFrete) {
    if (item.startsWith(estadoCliente)) {
      porcentagemFrete = double.parse(item.split(" ")[1]);
      break;
    }
  }

  // Calcula o frete final
  double freteFinal = freteBase + (freteBase * porcentagemFrete / 100);

  // Formata o valor no formato de moeda
  final NumberFormat formatter =
      NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  return formatter.format(freteFinal);
}

String freteSimulado(String endereco) {
  // Mapa de abreviações para nomes completos de estados
  Map<String, String> estados = {
    "AC": "Acre",
    "AL": "Alagoas",
    "AP": "Amapá",
    "AM": "Amazonas",
    "BA": "Bahia",
    "CE": "Ceará",
    "DF": "Distrito Federal",
    "ES": "Espírito Santo",
    "GO": "Goiás",
    "MA": "Maranhão",
    "MT": "Mato Grosso",
    "MS": "Mato Grosso do Sul",
    "MG": "Minas Gerais",
    "PA": "Pará",
    "PB": "Paraíba",
    "PR": "Paraná",
    "PE": "Pernambuco",
    "PI": "Piauí",
    "RJ": "Rio de Janeiro",
    "RN": "Rio Grande do Norte",
    "RS": "Rio Grande do Sul",
    "RO": "Rondônia",
    "RR": "Roraima",
    "SC": "Santa Catarina",
    "SP": "São Paulo",
    "SE": "Sergipe",
    "TO": "Tocantins",
  };

  // Verifica se o endereço está vazio
  if (endereco.isEmpty) {
    return "Endereço inválido";
  }

  // Regex para identificar estado e CEP
  RegExp regex = RegExp(r'- ([A-Z]{2}), (\d{5}-\d{3})$');
  Match? match = regex.firstMatch(endereco);

  if (match != null) {
    String estadoAbreviado = match.group(1)!; // Captura o estado abreviado
    String cep = match.group(2)!; // Captura o CEP

    // Obtém o nome completo do estado a partir do mapa
    String estadoCompleto = estados[estadoAbreviado] ?? "Estado desconhecido";

    // Retorna o formato desejado: "CEP, estado"
    return "$cep, $estadoCompleto";
  }

  // Caso não consiga extrair os dados
  return "Endereço inválido";
}

String estimativaEntrega() {
  // Data de hoje
  DateTime hoje = DateTime.now();

  // Calculando as datas de estimativa
  DateTime primeiraEstimativa = hoje.add(Duration(days: 4));
  DateTime segundaEstimativa = hoje.add(Duration(days: 12));

  // Formatando as datas
  String formatarData(DateTime data) {
    return DateFormat("d/MMM", "pt_BR").format(data).toLowerCase();
  }

  String primeiraData = formatarData(primeiraEstimativa);
  String segundaData = formatarData(segundaEstimativa);

  // Retornando a string no formato desejado
  return "Receba entre $primeiraData e $segundaData";
}

int statusEnviado2(List<PedidosTotalRecord> query) {
  // Filtra os documentos que têm o status "enviado" e retorna a contagem
  int quantidadeEnviado =
      query.where((pedido) => pedido.status == "enviado").length;

  return quantidadeEnviado;
}

int statusNaopagoCopy(List<PedidosTotalRecord> query) {
  // Filtra os documentos que têm o status "preparando" e retorna a contagem
  int quantidadePreparando =
      query.where((pedido) => pedido.status == "naopago").length;

  return quantidadePreparando;
}

bool statusEnviadoBoolean(List<PedidosTotalRecord> query) {
  // Verifica se há pelo menos um pedido com status "preparando"
  bool hasPreparando = query.any((pedido) => pedido.status == "enviado");

  return hasPreparando;
}

bool maisVendidoBooleanFeed(
  DocumentReference? produtoRef,
  List<ProdutoRecord> queryColecaoList,
  int vendas,
) {
  // Verifica se o valor de vendas é 0
  if (vendas == 0) {
    return false;
  }

  // Verifica se produtoRef é nulo ou se a lista queryColecaoList está vazia
  if (produtoRef == null || queryColecaoList.isEmpty) {
    return false;
  }

  // Procura pelo índice do produto na lista
  final index =
      queryColecaoList.indexWhere((produto) => produto.reference == produtoRef);

  // Retorna false se o produto não for encontrado
  if (index == -1) {
    return false;
  }

  // Retorna true se o produto estiver entre os 3 primeiros
  return index < 3;
}

bool maisVendidoBoolean4Max(
  DocumentReference? produtoRef,
  List<ProdutoRecord> queryColecaoList,
) {
  // Verifica se produtoRef é nulo ou se a lista queryColecaoList está vazia
  if (produtoRef == null || queryColecaoList.isEmpty) {
    return false;
  }

  // Procura pelo índice do produto na lista
  final index =
      queryColecaoList.indexWhere((produto) => produto.reference == produtoRef);

  // Retorna false se o produto não for encontrado
  if (index == -1) {
    return false;
  }

  // Retorna true se o produto estiver entre os 4 primeiros
  return index < 4;
}

String freteMaisDe20(String frete) {
  // Removendo o prefixo "R$" e convertendo para double
  double valorFrete =
      double.parse(frete.replaceAll('R\$', '').replaceAll(',', '.').trim());

  // Definindo o limite
  double limite = 20.0;

  // Calculando o restante
  double restante = valorFrete > limite ? valorFrete - limite : 0.0;

  // Formatando para o formato "R$00,00"
  String formatarValor(double valor) {
    return "R\$${valor.toStringAsFixed(2).replaceAll('.', ',')}";
  }

  return formatarValor(restante);
}

bool statusNaopagoBoolean(List<PedidosTotalRecord> query) {
  // Verifica se há pelo menos um pedido com status "preparando"
  bool hasPreparando = query.any((pedido) => pedido.status == "naopago");

  return hasPreparando;
}

DateTime filtroAfiliado90diasAtras() {
  final hoje = DateTime.now();
  final trintaDiasAtras = DateTime(hoje.year, hoje.month, hoje.day - 90);
  return trintaDiasAtras;
}

DateTime filtroAfiliado30diasAtras() {
  final hoje = DateTime.now();
  final trintaDiasAtras = DateTime(hoje.year, hoje.month, hoje.day - 30);
  return trintaDiasAtras;
}

DateTime filtroAfiliadoHoje() {
  final hoje = DateTime.now();
  return DateTime(hoje.year, hoje.month, hoje.day);
}

DateTime filtroAfiliado24Meses() {
  final hoje = DateTime.now();
  final trintaDiasAtras = DateTime(hoje.year, hoje.month, hoje.day - 730);
  return trintaDiasAtras;
}

DateTime filtroAfiliado7diasAtras() {
  final hoje = DateTime.now();
  final seteDiasAtras = DateTime(hoje.year, hoje.month, hoje.day - 7);
  return seteDiasAtras;
}

bool freteMaisde20Boolean(String frete) {
  // Removendo o prefixo "R$" e convertendo para double
  double valorFrete =
      double.parse(frete.replaceAll('R\$', '').replaceAll(',', '.').trim());

  // Verificando se é maior que 20
  return valorFrete > 20.0;
}

String calculoProdutoMaisFreteCompra(
  double valorX,
  double valorY,
  String valorH,
  double? importacao,
  double? icms,
  bool nacional,
) {
  // Remove "R$" e espaços extras de valorH e substitui a vírgula por ponto
  String valorHSanitizado =
      valorH.replaceAll("R\$", "").trim().replaceAll(",", ".");

  // Converte valorH sanitizado (String) para double
  double valorHDouble = double.tryParse(valorHSanitizado) ?? 0.0;

  // Realiza o cálculo: valorX * valorY + valorHDouble
  double resultado = (valorX * valorY) + valorHDouble;

  // Se o produto for internacional (nacional == false ou null), soma ICMS e importação
  if (nacional == false || nacional == null) {
    if (importacao != null) {
      resultado += importacao;
    }
    if (icms != null) {
      resultado += icms;
    }
  }

  // Formata o resultado para o padrão de número com vírgula como separador decimal
  var formatador = NumberFormat('#,##0.00', 'pt_BR');
  return formatador.format(resultado);
}

double calcularTotalDeQueriesTrue2(
  List<CarrinhoRecord> queryList,
  double? taxa,
  double? taxa2,
) {
  double totalGeral = queryList
      .where((item) =>
          item.selecionado == true &&
          item.preco != null &&
          item.quantidade != null)
      .fold(
          0.0,
          (sum, item) =>
              sum + (item.preco! * item.quantidade!) + (item.frete ?? 0.0));

  // Adiciona taxa se não for nula
  if (taxa != null) {
    totalGeral += taxa;
  }

  // Sempre subtrai taxa2, independentemente do sinal
  if (taxa2 != null) {
    totalGeral -= taxa2.abs();
  }

  return totalGeral.isNaN ? 0.0 : totalGeral; // 🔥 Garante retorno sempre!
}

int statusPreparando(List<PedidosTotalRecord> query) {
  // Filtra os documentos que têm o status "preparando" e retorna a contagem
  int quantidadePreparando =
      query.where((pedido) => pedido.status == "preparando").length;

  return quantidadePreparando;
}

bool statusPreparandoBoolean(List<PedidosTotalRecord> query) {
  // Verifica se há pelo menos um pedido com status "preparando"
  bool hasPreparando = query.any((pedido) => pedido.status == "preparando");

  return hasPreparando;
}

int statusAvaliacao(List<PedidosTotalRecord> query) {
  // Filtra os pedidos que atendem às condições
  List<PedidosTotalRecord> filteredPedidos = query
      .where(
          (pedido) => pedido.avaliado != true && pedido.status == "finalizado")
      .toList();

  // Retorna a quantidade de pedidos que atendem às condições
  return filteredPedidos.length;
}

bool statusAvaliacaoBoolean(List<PedidosTotalRecord> query) {
  // Filtra os pedidos que atendem às condições
  bool hasPedidos = query.any(
      (pedido) => pedido.avaliado != true && pedido.status == "finalizado");

  // Retorna true se existir pelo menos 1 pedido que atenda às condições, senão false
  return hasPedidos;
}

String avaliacaoMedia(List<AvaliacaoRecord> query) {
  if (query.isEmpty) {
    return "0,0/5"; // Retorna 0,0/5 se a lista estiver vazia.
  }

  // Soma todas as notas e calcula a média.
  double soma = query.fold(0, (total, doc) => total + (doc.nota ?? 0));
  double media = soma / query.length;

  // Formata a média com apenas 1 casa decimal, substituindo o ponto por vírgula.
  String mediaFormatada = media.toStringAsFixed(1).replaceAll('.', ',');

  // Retorna a string formatada como "4,6/5".
  return "$mediaFormatada/5";
}

int? comentarioQuantidadeFoto(List<String> stringlist) {
  // Verifica se a lista está vazia.
  if (stringlist.isEmpty) {
    return 0; // Retorna 0 caso a lista esteja vazia.
  }

  // Calcula a quantidade de elementos menos 3.
  int resultado = stringlist.length - 3;

  // Garante que o resultado nunca seja negativo.
  return resultado >= 0 ? resultado : 0;
}

double impostoDeImportacaoTotal(List<CarrinhoRecord> documentList) {
  const double taxaCambio = 5.81; // Cotação do dólar
  double totalImpostoBRL = 0.0;

  for (var documento in documentList) {
    // Verifica se o produto é internacional
    bool produtoInternacional = !(documento.nacional ?? true);
    if (!produtoInternacional) {
      continue; // Pula produtos nacionais
    }

    double frete = documento.frete ?? 0.0;
    int quantidade = documento.quantidade ?? 0;
    double preco = documento.preco ?? 0.0;

    if (quantidade == 0 || preco == 0.0) {
      continue; // Ignora produtos sem preço ou quantidade inválida
    }

    // Calcula o valor total do pedido em BRL
    double totalPedidoBRL = (preco * quantidade) + frete;

    // Converte para USD
    double totalPedidoUSD = totalPedidoBRL / taxaCambio;

    double impostoUSD;
    if (totalPedidoUSD <= 50.0) {
      impostoUSD = totalPedidoUSD * 0.20;
    } else {
      impostoUSD = (totalPedidoUSD * 0.60) - 20.0;
      impostoUSD = math.max(impostoUSD, 0.0);
    }

    // Converte o imposto final de volta para BRL
    double impostoBRL = impostoUSD * taxaCambio;
    totalImpostoBRL += impostoBRL;
  }

  return totalImpostoBRL;
}

List<String>? imgAvaliacao(
  List<String>? stringImgList,
  String? stringVideo,
) {
  // Verifica se ambas as entradas são nulas ou vazias.
  if ((stringImgList == null || stringImgList.isEmpty) &&
      (stringVideo == null || stringVideo.isEmpty)) {
    return null; // Retorna null se nenhuma entrada tiver valores.
  }

  // Cria a lista de retorno.
  List<String> resultList = [];

  // Adiciona o vídeo primeiro, se ele existir.
  if (stringVideo != null && stringVideo.isNotEmpty) {
    resultList.add(stringVideo);
  }

  // Adiciona os 5 primeiros valores da lista de imagens, se ela existir.
  if (stringImgList != null && stringImgList.isNotEmpty) {
    resultList.addAll(stringImgList.take(5));
  }

  return resultList;
}

String cupomData(DateTime entrada) {
  final DateTime hoje = DateTime.now();

  // Se a data atual for após o último dia do mês da entrada → Expirado
  final DateTime ultimoDiaEntrada = DateTime(
    entrada.year,
    entrada.month + 1,
    0,
  );

  if (hoje.isAfter(ultimoDiaEntrada)) {
    return 'Expirado';
  }

  // Se a data atual ainda está dentro do mês da entrada → calcula dias até fim do mês
  if (hoje.year == entrada.year && hoje.month == entrada.month) {
    final int diasRestantes = ultimoDiaEntrada.difference(hoje).inDays;
    return '$diasRestantes';
  }

  // Qualquer outro caso → já expirou ou não relevante
  return 'Expirado';
}

bool impostoICMSOlho(List<CarrinhoRecord> documentList) {
  // Percorre a lista de documentos e verifica se pelo menos um tem "nacional" como false ou não setado
  for (var documento in documentList) {
    if (documento.nacional == false || documento.nacional == null) {
      return true; // Retorna true se encontrar pelo menos um caso
    }
  }

  return false; // Retorna false se todos os documentos forem nacionais (true)
}

String cadastroCategoria1(String strings) {
  // Remove " - X" do final da string
  return strings.replaceAll(RegExp(r' - X$'), '');
}

bool cadastroCategoria2(String input) {
  // Verifica se a string termina com " - X"
  return input.endsWith(" - X");
}

String formatNumber(int number) {
  if (number >= 1000000) {
    return "${(number / 1000000).toStringAsFixed(1).replaceAll('.', ',')} mi";
  } else if (number >= 1000) {
    return "${(number / 1000).toStringAsFixed(1).replaceAll('.', ',')} mil";
  } else {
    return number.toString();
  }
}

String maisVendido(
  DocumentReference? produtoRef,
  List<ProdutoRecord> queryColecaoList,
) {
  // Verifica se produtoRef é nulo ou se a lista queryColecaoList está vazia
  if (produtoRef == null || queryColecaoList.isEmpty) {
    return "25";
  }

  // Itera sobre a lista e procura pelo índice onde o reference corresponde ao produtoRef
  final index =
      queryColecaoList.indexWhere((produto) => produto.reference == produtoRef);

  // Retorna "25" se o produto não for encontrado na lista
  if (index == -1) {
    return "25";
  }

  // Retorna a posição (index + 1) como string, começando de "1"
  return (index + 1).toString();
}

bool carrinhoLoja(
  List<CarrinhoRecord> queryList,
  DocumentReference produtoRef,
) {
  // Conjunto para rastrear as lojas já processadas.
  final Set<DocumentReference> lojasVistas = {};

  // Itera sobre os produtos na lista do carrinho.
  for (int i = 0; i < queryList.length; i++) {
    final produto = queryList[i];
    final lojaRef = produto.lojaRef; // Obtém a referência da loja.

    // Certifique-se de que lojaRef não é nulo.
    if (lojaRef != null) {
      // Verifica se a loja já foi vista.
      if (!lojasVistas.contains(lojaRef)) {
        lojasVistas.add(lojaRef);

        // Verifica se o produto atual é o produtoRef.
        if (produto.reference == produtoRef) {
          return true; // O produtoRef é o primeiro produto da loja.
        }
      } else {
        // Caso a loja já tenha sido vista, verifica se o produtoRef é o atual.
        if (produto.reference == produtoRef) {
          return false; // O produtoRef não é o primeiro produto da loja.
        }
      }
    }
  }

  // Caso o produtoRef não seja encontrado na lista.
  return false;
}

double freteCupom2(
  String valorFrete,
  double cupom,
  String tipoCupom,
  double valorProduto,
) {
  // Removendo símbolos de moeda e formatando o valor do frete
  String freteFormatado =
      valorFrete.replaceAll(RegExp(r'[^\d,]'), '').replaceAll(',', '.');
  double freteAtual = double.tryParse(freteFormatado) ?? 0.0;

  // Verificando se o tipoCupom permite desconto baseado no valorProduto
  if (tipoCupom.contains('acima de R\$')) {
    // Extraindo o valor mínimo do tipoCupom
    final regex = RegExp(r'acima de R\$(\d+)');
    final match = regex.firstMatch(tipoCupom);

    if (match != null) {
      double valorMinimo = double.parse(match.group(1)!);

      // Verificando se o valorProduto é elegível para o cupom
      if (valorProduto >= valorMinimo) {
        // Aplicando o desconto no frete
        double freteComDesconto = freteAtual - cupom;

        // Garantindo que o frete não fique abaixo de zero
        return math.max(freteComDesconto, 0.0);
      }
    }
  }

  // Caso o valorProduto não seja elegível, retorna o frete original
  return freteAtual;
}

int statusReembolso(List<PedidosTotalRecord> query) {
  // Filtra os documentos onde o status é "cancelado" e canceladoLogista está como true
  int quantidadeCancelado = query
      .where((pedido) =>
          pedido.status == "reembolso" && pedido.canceladoLogista == true)
      .length;

  return quantidadeCancelado;
}

double freteComCupom(
  String? enderecoCliente,
  List<String> listFrete,
  double freteBase,
  double? cupom,
  String? tipoCupom,
  double valorProduto,
) {
  // Lista de estados brasileiros com suas respectivas abreviações
  Map<String, String> estados = {
    "Acre": "AC",
    "Alagoas": "AL",
    "Amapá": "AP",
    "Amazonas": "AM",
    "Bahia": "BA",
    "Ceará": "CE",
    "Distrito Federal": "DF",
    "Espírito Santo": "ES",
    "Goiás": "GO",
    "Maranhão": "MA",
    "Mato Grosso": "MT",
    "Mato Grosso do Sul": "MS",
    "Minas Gerais": "MG",
    "Pará": "PA",
    "Paraíba": "PB",
    "Paraná": "PR",
    "Pernambuco": "PE",
    "Piauí": "PI",
    "Rio de Janeiro": "RJ",
    "Rio Grande do Norte": "RN",
    "Rio Grande do Sul": "RS",
    "Rondônia": "RO",
    "Roraima": "RR",
    "Santa Catarina": "SC",
    "São Paulo": "SP",
    "Sergipe": "SE",
    "Tocantins": "TO",
  };

  // Verifica o estado no endereço do cliente
  String estadoCliente = "SP"; // Default
  if (enderecoCliente != null && enderecoCliente.isNotEmpty) {
    estados.forEach((nomeEstado, abreviacao) {
      if (enderecoCliente.contains(nomeEstado) ||
          enderecoCliente.contains(abreviacao)) {
        estadoCliente = abreviacao;
      }
    });
  }

  // Busca a porcentagem de acréscimo na listFrete
  double porcentagemFrete = 0.0; // Default caso não encontre o estado
  for (String item in listFrete) {
    if (item.startsWith(estadoCliente)) {
      porcentagemFrete = double.parse(item.split(" ")[1]);
      break;
    }
  }

  // Calcula o frete base final
  double freteFinal = freteBase + (freteBase * porcentagemFrete / 100);

  // Aplica o cupom, se fornecido
  if (cupom != null && cupom > 0 && tipoCupom != null && tipoCupom.isNotEmpty) {
    freteFinal = calcularFreteComCupom(
      freteFinal,
      cupom,
      tipoCupom,
      valorProduto,
    );
  }

  return freteFinal;
}

double calcularFreteComCupom(
  double freteAtual,
  double cupom,
  String tipoCupom,
  double valorProduto,
) {
  // Verifica se o tipoCupom permite desconto baseado no valorProduto
  if (tipoCupom.contains('acima de R\$')) {
    // Extraindo o valor mínimo do tipoCupom
    final regex = RegExp(r'acima de R\$(\d+(?:\.\d+)?)');
    final match = regex.firstMatch(tipoCupom);

    if (match != null) {
      double valorMinimo = double.parse(match.group(1)!);

      // Verifica se o valorProduto é elegível para o cupom
      if (valorProduto >= valorMinimo) {
        // Aplica o desconto no frete
        double freteComDesconto = freteAtual - cupom;

        // Garante que o frete não fique abaixo de zero
        return math.max(freteComDesconto, 0.0);
      }
    }
  }

  // Caso o valorProduto não seja elegível, retorna o frete original
  return freteAtual;
}

String somarFrete(List<CarrinhoRecord> queryList) {
  // Soma todos os valores de frete na lista
  double totalFrete =
      queryList.fold(0.0, (sum, item) => sum + (item.frete ?? 0.0));

  // Formata como moeda no formato R$xx,xx
  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return currencyFormat.format(totalFrete);
}

String somarValorUnitario(List<CarrinhoRecord> queryList) {
  // Soma todos os valores de preco multiplicados pela quantidade em cada item
  double totalPreco = queryList.fold(0.0, (sum, item) {
    // Considera a quantidade do item, caso exista. Se não, considera 1 como padrão.
    double precoItem = item.preco ?? 0.0;
    int quantidadeItem =
        item.quantidade ?? 1; // Se quantidade for null, assume 1

    // Adiciona ao total o valor do item (preço * quantidade)
    return sum + (precoItem * quantidadeItem);
  });

  // Formata como moeda no formato R$xx,xx
  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return currencyFormat.format(totalPreco);
}

String estimativaFreteNascionalPosVenda(DateTime data) {
  // Calculando as datas de estimativa
  DateTime primeiraEstimativa = data.add(Duration(days: 4));
  DateTime segundaEstimativa = data.add(Duration(days: 12));

  // Formatando as datas
  String formatarData(DateTime data) {
    return DateFormat("d MMM", "pt_BR").format(data).toLowerCase();
  }

  String primeiraData = formatarData(primeiraEstimativa);
  String segundaData = formatarData(segundaEstimativa);

  // Retornando a string no formato desejado
  return "$primeiraData - $segundaData";
}

int statusCancelado(List<PedidosTotalRecord> query) {
  // Filtra os documentos onde o status é "cancelado" e canceladoLogista está como true
  int quantidadeCancelado = query
      .where((pedido) =>
          pedido.status == "cancelado" && pedido.canceladoLogista == true)
      .length;

  return quantidadeCancelado;
}

String card4Digitos(String card) {
  return card.toString().padLeft(4, '0').substring(card.toString().length - 4);
}

String cardMM(String mm) {
  return mm.split('/')[0];
}

String removerCaracteresString(String texto) {
  return texto.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
}

String comissaoPerfilProduto(
  double preco,
  double preco2,
) {
  // Calcula 15% do preço
  double comissao = preco * 0.15;

  // Soma preco2 e trunca para valor inteiro
  double valorFinal = (comissao + preco2).truncateToDouble();

  // Formata com 2 casas decimais (força ,00)
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
    decimalDigits: 2, // Sempre 2 dígitos decimais
  );

  return formatter.format(valorFinal).trim();
}

bool indexAddCardLogado2(
  List<CarrinhoRecord> documentList,
  DocumentReference documentoReference,
) {
  // Verifica se a referência está nas primeiras 2 posições (índices 0 ou 1)
  // Se a lista tiver apenas 1 item, verifica apenas ele.
  final int limiteVerificacao = math.min(2, documentList.length);

  for (int i = 0; i < limiteVerificacao; i++) {
    if (documentList[i].reference == documentoReference) {
      return true;
    }
  }

  return false;
}

bool indexAddCardLogado3(
  List<CarrinhoRecord> documentList,
  DocumentReference documentoReference,
) {
  // Verifica se a lista tem pelo menos 3 elementos (posição 2 existe)
  if (documentList.length < 3) {
    return false;
  }

  // Verifica especificamente a posição 2 (terceiro item)
  return documentList[2].reference == documentoReference;
}

int indexAddCardLogado4(List<CarrinhoRecord> documentList) {
  final int totalItens = documentList.length;

  if (totalItens == 3) {
    return 1; // Caso fixo para 3 itens
  } else {
    return (totalItens - 3)
        .clamp(0, double.infinity)
        .toInt(); // Subtrai 3, evitando valores negativos
  }
}

String taxaAplicada(
  double precoProduto,
  double quantidade,
  double? y,
) {
  try {
    // Calcular o preço total do pedido
    double totalPedido = precoProduto * quantidade;

    // Calcular 13% do total do pedido
    double valorTaxa = totalPedido * 0.13;

    // Calcular o valor adicional baseado na quantidade
    double valorAdicional = quantidade * 4;

    // Somar a taxa com o valor adicional
    double resultado = valorTaxa + valorAdicional;

    // Se o valor de 'y' não for nulo, adiciona ao resultado
    if (y != null) {
      resultado += y;
    }

    // Formatando o resultado como string no formato desejado
    final moedaFormatada = NumberFormat("#,##0.00", "pt_BR").format(resultado);

    return moedaFormatada;
  } catch (e) {
    // Caso ocorra algum erro, retornamos uma string vazia ou outro valor de erro
    return "0,00";
  }
}

int indexConta(List<PedidosTotalRecord> queryList) {
  // Contar o tamanho da lista e adicionar 1 para ajustar o índice
  int count = queryList.length + 1;

  return count;
}

String doublexquantidade(double quantidade) {
  // Multiplica o valor por 4
  double resultado = quantidade * 4;

  // Formata o resultado no formato desejado, com 2 casas decimais
  final formatador = NumberFormat("#,##0.00", "pt_BR");
  String resultadoFormatado = formatador.format(resultado);

  return resultadoFormatado;
}

String double13porcento(double valor) {
  // Calcula 13% do valor
  double resultado = valor * 0.13;

  // Formata o resultado no formato desejado, com 2 casas decimais
  final formatador = NumberFormat("#,##0.00", "pt_BR");
  String resultadoFormatado = formatador.format(resultado);

  return resultadoFormatado;
}

String idCancelamento() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = math.Random();
  return List.generate(15, (index) => chars[random.nextInt(chars.length)])
      .join();
}

List<String> atualizarImagem(
  List<String> imagemAntes,
  List<String>? imagemNova,
) {
  if (imagemNova == null || imagemNova.isEmpty) {
    return imagemAntes;
  }
  return [...imagemAntes, ...imagemNova];
}

String categoria(
  String? entrada1,
  String? entrada2,
  String? entrada3,
  String? entrada4,
) {
  // Lista com todas as entradas
  List<String?> entradas = [entrada1, entrada2, entrada3, entrada4];

  // Itera de trás para frente e retorna a última entrada válida
  for (int i = entradas.length - 1; i >= 0; i--) {
    String? valor = entradas[i]
        ?.trim()
        .toLowerCase(); // Remove espaços e converte para minúsculas

    if (valor != null &&
        valor.isNotEmpty &&
        valor != "outro" &&
        valor != "outros") {
      return entradas[i]!
          .trim(); // Retorna o valor original sem alterar maiúsculas/minúsculas
    }
  }

  return ""; // Retorna string vazia se nenhuma entrada for válida
}

List<String> parcelamento(double valor) {
  List<Map<String, dynamic>> faixas1x = [
    {'limite': 10, 'taxa': 0.094},
    {'limite': 20, 'taxa': 0.069},
    {'limite': 30, 'taxa': 0.071},
    {'limite': 40, 'taxa': 0.058},
    {'limite': 60, 'taxa': 0.055},
    {'limite': 80, 'taxa': 0.055},
    {'limite': 100, 'taxa': 0.055},
    {'limite': 140, 'taxa': 0.055},
    {'limite': 200, 'taxa': 0.05},
    {'limite': 300, 'taxa': 0.05}
  ];

  List<Map<String, dynamic>> faixas2x = [
    {'limite': 10, 'taxa': 0.21},
    {'limite': 20, 'taxa': 0.14},
    {'limite': 30, 'taxa': 0.11},
    {'limite': 40, 'taxa': 0.10},
    {'limite': 60, 'taxa': 0.09},
    {'limite': 80, 'taxa': 0.08},
    {'limite': 100, 'taxa': 0.08},
    {'limite': 140, 'taxa': 0.08},
    {'limite': 200, 'taxa': 0.07},
    {'limite': 300, 'taxa': 0.07}
  ];

  List<Map<String, dynamic>> faixas3x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': 0.14},
    {'limite': 30, 'taxa': 0.12},
    {'limite': 40, 'taxa': 0.11},
    {'limite': 60, 'taxa': 0.10},
    {'limite': 80, 'taxa': 0.09},
    {'limite': 100, 'taxa': 0.09},
    {'limite': 140, 'taxa': 0.09},
    {'limite': 200, 'taxa': 0.08},
    {'limite': 300, 'taxa': 0.08}
  ];

  List<Map<String, dynamic>> faixas4x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': 0.145},
    {'limite': 30, 'taxa': 0.125},
    {'limite': 40, 'taxa': 0.115},
    {'limite': 60, 'taxa': 0.105},
    {'limite': 80, 'taxa': 0.095},
    {'limite': 100, 'taxa': 0.095},
    {'limite': 140, 'taxa': 0.095},
    {'limite': 200, 'taxa': 0.085},
    {'limite': 300, 'taxa': 0.085}
  ];

  List<Map<String, dynamic>> faixas5x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': null},
    {'limite': 30, 'taxa': 0.135},
    {'limite': 40, 'taxa': 0.125},
    {'limite': 60, 'taxa': 0.115},
    {'limite': 80, 'taxa': 0.105},
    {'limite': 100, 'taxa': 0.105},
    {'limite': 140, 'taxa': 0.105},
    {'limite': 200, 'taxa': 0.095},
    {'limite': 300, 'taxa': 0.095}
  ];

  List<Map<String, dynamic>> faixas6x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': null},
    {'limite': 30, 'taxa': 0.145},
    {'limite': 40, 'taxa': 0.135},
    {'limite': 60, 'taxa': 0.125},
    {'limite': 80, 'taxa': 0.115},
    {'limite': 100, 'taxa': 0.115},
    {'limite': 140, 'taxa': 0.115},
    {'limite': 200, 'taxa': 0.105},
    {'limite': 300, 'taxa': 0.105}
  ];

  List<Map<String, dynamic>> faixas7x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': null},
    {'limite': 30, 'taxa': null},
    {'limite': 40, 'taxa': 0.15},
    {'limite': 60, 'taxa': 0.14},
    {'limite': 80, 'taxa': 0.13},
    {'limite': 100, 'taxa': 0.13},
    {'limite': 140, 'taxa': 0.13},
    {'limite': 200, 'taxa': 0.12},
    {'limite': 300, 'taxa': 0.12}
  ];

  List<Map<String, dynamic>> faixas8x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': null},
    {'limite': 30, 'taxa': null},
    {'limite': 40, 'taxa': 0.16},
    {'limite': 60, 'taxa': 0.15},
    {'limite': 80, 'taxa': 0.14},
    {'limite': 100, 'taxa': 0.14},
    {'limite': 140, 'taxa': 0.14},
    {'limite': 200, 'taxa': 0.13},
    {'limite': 300, 'taxa': 0.13}
  ];

  List<Map<String, dynamic>> faixas9x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': null},
    {'limite': 30, 'taxa': null},
    {'limite': 40, 'taxa': 0.175},
    {'limite': 60, 'taxa': 0.165},
    {'limite': 80, 'taxa': 0.155},
    {'limite': 100, 'taxa': 0.155},
    {'limite': 200, 'taxa': 0.145},
    {'limite': 300, 'taxa': 0.145}
  ];

  List<Map<String, dynamic>> faixas10x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': null},
    {'limite': 30, 'taxa': null},
    {'limite': 50, 'taxa': 0.185},
    {'limite': 60, 'taxa': 0.175},
    {'limite': 80, 'taxa': 0.165},
    {'limite': 100, 'taxa': 0.165},
    {'limite': 200, 'taxa': 0.155},
    {'limite': 300, 'taxa': 0.155}
  ];

  List<Map<String, dynamic>> faixas11x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': null},
    {'limite': 30, 'taxa': null},
    {'limite': 50, 'taxa': 0.195},
    {'limite': 60, 'taxa': 0.185},
    {'limite': 80, 'taxa': 0.18},
    {'limite': 100, 'taxa': 0.18},
    {'limite': 200, 'taxa': 0.17},
    {'limite': 300, 'taxa': 0.17}
  ];

  List<Map<String, dynamic>> faixas12x = [
    {'limite': 10, 'taxa': null},
    {'limite': 20, 'taxa': null},
    {'limite': 30, 'taxa': null},
    {'limite': 50, 'taxa': 0.205},
    {'limite': 60, 'taxa': 0.195},
    {'limite': 80, 'taxa': 0.19},
    {'limite': 100, 'taxa': 0.19},
    {'limite': 200, 'taxa': 0.18},
    {'limite': 300, 'taxa': 0.18}
  ];

  double taxa1x = 0.05;
  double taxa2x = 0.07;
  double taxa3x = 0.08;
  double taxa4x = 0.085;
  double taxa5x = 0.095;
  double taxa6x = 0.105;
  double taxa7x = 0.12;
  double taxa8x = 0.13;
  double taxa9x = 0.145;
  double taxa10x = 0.155;
  double taxa11x = 0.17;
  double taxa12x = 0.18;

  for (var faixa in faixas1x) {
    if (valor <= faixa['limite']) {
      taxa1x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas2x) {
    if (valor <= faixa['limite']) {
      taxa2x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas3x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa3x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas4x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa4x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas5x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa5x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas6x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa6x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas7x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa7x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas8x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa8x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas9x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa9x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas10x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa10x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas11x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa11x = faixa['taxa'];
      break;
    }
  }

  for (var faixa in faixas12x) {
    if (valor <= faixa['limite'] && faixa['taxa'] != null) {
      taxa12x = faixa['taxa'];
      break;
    }
  }

  List<String> parcelas = [];

  double valorFinal1x = valor * (1 + taxa1x);
  parcelas.add("1x " +
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
          .format(valorFinal1x)
          .replaceAll(' ', ''));

  if (valor >= 10) {
    double valorParcelado2x = valor / 2 * (1 + taxa2x);
    parcelas.add("2x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado2x)
            .replaceAll(' ', ''));
  }

  if (valor >= 15) {
    double valorParcelado3x = valor / 3 * (1 + taxa3x);
    parcelas.add("3x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado3x)
            .replaceAll(' ', ''));
  }

  if (valor >= 20) {
    double valorParcelado4x = valor / 4 * (1 + taxa4x);
    parcelas.add("4x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado4x)
            .replaceAll(' ', ''));
  }

  if (valor >= 30) {
    double valorParcelado5x = valor / 5 * (1 + taxa5x);
    parcelas.add("5x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado5x)
            .replaceAll(' ', ''));
  }

  if (valor >= 30) {
    double valorParcelado6x = valor / 6 * (1 + taxa6x);
    parcelas.add("6x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado6x)
            .replaceAll(' ', ''));
  }

  if (valor >= 40) {
    double valorParcelado7x = valor / 7 * (1 + taxa7x);
    parcelas.add("7x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado7x)
            .replaceAll(' ', ''));
  }

  if (valor >= 40) {
    double valorParcelado8x = valor / 8 * (1 + taxa8x);
    parcelas.add("8x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado8x)
            .replaceAll(' ', ''));
  }

  if (valor >= 40) {
    double valorParcelado9x = valor / 9 * (1 + taxa9x);
    parcelas.add("9x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado9x)
            .replaceAll(' ', ''));
  }

  if (valor >= 50) {
    double valorParcelado10x = valor / 10 * (1 + taxa10x);
    parcelas.add("10x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado10x)
            .replaceAll(' ', ''));
  }

  if (valor >= 50) {
    double valorParcelado11x = valor / 11 * (1 + taxa11x);
    parcelas.add("11x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado11x)
            .replaceAll(' ', ''));
  }

  if (valor >= 50) {
    double valorParcelado12x = valor / 12 * (1 + taxa12x);
    parcelas.add("12x " +
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
            .format(valorParcelado12x)
            .replaceAll(' ', ''));
  }

  return parcelas;
}

String calcularTotalParcelas(String soma) {
  final RegExp regex = RegExp(r"(\d+)x\sR\$\s?([0-9]+(?:,[0-9]{2})?)");
  final match = regex.firstMatch(soma);

  if (match != null) {
    int parcelas = int.parse(match.group(1)!);
    double valorParcela =
        NumberFormat.decimalPattern('pt_BR').parse(match.group(2)!).toDouble();
    double total = parcelas * valorParcela;

    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(total);
  }

  return "Formato inválido";
}

String taxaCartao(
  double produto,
  String parcela,
) {
  // Remover todos os caracteres invisíveis e espaços extras
  final parcelaFormatada = parcela.replaceAll(RegExp(r'\s+'), ' ').trim();

  // Extrair o número de parcelas e o valor da parcela da string
  final regex = RegExp(r'(\d+)x R\$ (\d+,\d{2})');
  final match = regex.firstMatch(parcelaFormatada);

  if (match == null) {
    return "Formato inválido";
  }

  // Capturar o número de parcelas e o valor da parcela
  final numParcelas = int.parse(match.group(1)!);
  final valorParcelaStr =
      match.group(2)!.replaceAll(',', '.'); // Substituir vírgula por ponto
  final valorParcela = double.parse(valorParcelaStr);

  // Calcular o valor total pago
  final valorTotal = valorParcela * numParcelas;

  // Calcular a diferença entre o valor total e o valor do produto
  final diferenca = valorTotal - produto;

  // Formatar o resultado como moeda (R$)
  final formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatador.format(diferenca);
}

String promoRelampago12hAmanha() {
  final amanha = DateTime.now().add(const Duration(days: 1)); // Adiciona 1 dia
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(amanha);

  return '$dataFormatada 12:00 - 18:00'; // Texto fixo após a data
}

String calcularTotalDeQueriesTrue2SemTaxa(List<CarrinhoRecord> queryList) {
  // Inicializa a variável totalGeral
  double totalGeral = 0.0;

  // Itera sobre a lista de registros de carrinho
  for (int i = 0; i < queryList.length; i++) {
    var item = queryList[i];
    var preco = item.preco; // Alterado de 'valorUnitario' para 'preco'
    var quantidade = item.quantidade;
    var selecionado = item.selecionado;
    var frete =
        item.frete ?? 0.0; // Usa 0.0 como valor padrão caso frete seja null

    // Verifica se o item está selecionado e se os valores são válidos
    if (selecionado == true && preco != null && quantidade != null) {
      // Alterado de 'valorUnitario' para 'preco'
      // Calcula o total para o item, adiciona o frete e soma ao total geral
      totalGeral += (preco * quantidade) +
          frete; // Alterado de 'valorUnitario' para 'preco'
    }
  }

  // Formata o total geral no formato "1.545,56"
  final formatador = NumberFormat("#,##0.00", "pt_BR");
  return formatador.format(totalGeral);
}

bool promoRelampago18hTrue() {
  final horaAtual = DateTime.now().hour;

  // Retorna TRUE se for ANTES das 12:00 (false se for 12h ou mais)
  return horaAtual < 21;
}

String promoRelampago18hStatus() {
  final agora = DateTime.now();
  final horaAtual = agora.hour;
  final minutoAtual = agora.minute;

  // Cria horários de referência
  final inicioPeriodo = TimeOfDay(hour: 18, minute: 0); // 00:00
  final fimPeriodo = TimeOfDay(hour: 21, minute: 0); // 09:00

  // Converte para minutos do dia para comparação
  final minutosAtuais = horaAtual * 60 + minutoAtual;
  final minutosInicio = inicioPeriodo.hour * 60 + inicioPeriodo.minute;
  final minutosFim = fimPeriodo.hour * 60 + fimPeriodo.minute;

  if (minutosAtuais >= minutosInicio && minutosAtuais < minutosFim) {
    return "Em Andamento";
  } else if (minutosAtuais < minutosInicio) {
    return "Em Breve";
  } else {
    return "Expirado";
  }
}

String promoRelampago18hAmanha() {
  final amanha = DateTime.now().add(const Duration(days: 1)); // Adiciona 1 dia
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(amanha);

  return '$dataFormatada 18:00 - 21:00'; // Texto fixo após a data
}

int valorParcela(String valor) {
  // Expressão regular para capturar o número antes do 'x'
  final match = RegExp(r'(\d+)x').firstMatch(valor);

  if (match != null) {
    return int.parse(match.group(1)!);
  }

  // Se não encontrar o número de parcelas, retorna 1 (pagamento à vista)
  return 1;
}

String mesProximo() {
  // Obtém a data atual e adiciona 1 mês
  final proximoMesData = DateTime.now().add(Duration(days: 30));

  // Formata o mês em português
  final formatador = DateFormat('MMMM', 'pt_BR');

  // Retorna o mês em minúsculas
  return formatador.format(proximoMesData).toLowerCase();
}

bool promoRelampago21hTrue() {
  final agora = DateTime.now();

  // Retorna TRUE se for ANTES das 23:58 (incluindo minutos)
  return agora.hour < 23 || (agora.hour == 23 && agora.minute < 58);
}

String promoRelampago21hStatus() {
  final agora = DateTime.now();
  final horaAtual = agora.hour;
  final minutoAtual = agora.minute;

  // Cria horários de referência
  final inicioPeriodo = TimeOfDay(hour: 21, minute: 0); // 00:00
  final fimPeriodo = TimeOfDay(hour: 23, minute: 59); // 09:00

  // Converte para minutos do dia para comparação
  final minutosAtuais = horaAtual * 60 + minutoAtual;
  final minutosInicio = inicioPeriodo.hour * 60 + inicioPeriodo.minute;
  final minutosFim = fimPeriodo.hour * 60 + fimPeriodo.minute;

  if (minutosAtuais >= minutosInicio && minutosAtuais < minutosFim) {
    return "Em Andamento";
  } else if (minutosAtuais < minutosInicio) {
    return "Em Breve";
  } else {
    return "Expirado";
  }
}

String promoRelampago12h() {
  final agora = DateTime.now();
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(agora);

  return '$dataFormatada 12:00 - 18:00'; // Texto fixo após a data
}

bool promoRelampago0hTrue() {
  final horaAtual = DateTime.now().hour;

  // Retorna TRUE se for ANTES das 12:00 (false se for 12h ou mais)
  return horaAtual < 9;
}

String promoRelampago9hAmanha() {
  final amanha = DateTime.now().add(const Duration(days: 1)); // Adiciona 1 dia
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(amanha);

  return '$dataFormatada 09:00 - 12:00'; // Texto fixo após a data
}

double valorTotalCartao(String valor) {
  // Remover espaços invisíveis que podem estar na string
  valor = valor.replaceAll(RegExp(r'\s+'), '');

  // Expressão regular para capturar o número de parcelas e o valor da parcela
  final match = RegExp(r'(\d+)xR\$([\d,\.]+)').firstMatch(valor);

  if (match != null) {
    int parcelas = int.parse(match.group(1)!);
    double valorParcela = double.parse(match.group(2)!.replaceAll(',', '.'));

    // Multiplicar o número de parcelas e arredondar para 2 casas decimais
    double total = parcelas * valorParcela;
    return double.parse(
        total.toStringAsFixed(2)); // Arredonda para 2 casas decimais
  }

  // Se não encontrar o formato esperado, retorna 0.0
  return 0.0;
}

String promoRelampago9hStatus() {
  final agora = DateTime.now();
  final horaAtual = agora.hour;
  final minutoAtual = agora.minute;

  // Cria horários de referência
  final inicioPeriodo = TimeOfDay(hour: 9, minute: 0); // 00:00
  final fimPeriodo = TimeOfDay(hour: 12, minute: 0); // 09:00

  // Converte para minutos do dia para comparação
  final minutosAtuais = horaAtual * 60 + minutoAtual;
  final minutosInicio = inicioPeriodo.hour * 60 + inicioPeriodo.minute;
  final minutosFim = fimPeriodo.hour * 60 + fimPeriodo.minute;

  if (minutosAtuais >= minutosInicio && minutosAtuais < minutosFim) {
    return "Em Andamento";
  } else if (minutosAtuais < minutosInicio) {
    return "Em Breve";
  } else {
    return "Expirado";
  }
}

String promoRelampago12hStatus() {
  final agora = DateTime.now();
  final horaAtual = agora.hour;
  final minutoAtual = agora.minute;

  // Cria horários de referência
  final inicioPeriodo = TimeOfDay(hour: 12, minute: 0); // 00:00
  final fimPeriodo = TimeOfDay(hour: 18, minute: 0); // 09:00

  // Converte para minutos do dia para comparação
  final minutosAtuais = horaAtual * 60 + minutoAtual;
  final minutosInicio = inicioPeriodo.hour * 60 + inicioPeriodo.minute;
  final minutosFim = fimPeriodo.hour * 60 + fimPeriodo.minute;

  if (minutosAtuais >= minutosInicio && minutosAtuais < minutosFim) {
    return "Em Andamento";
  } else if (minutosAtuais < minutosInicio) {
    return "Em Breve";
  } else {
    return "Expirado";
  }
}

bool promoRelampago12hTrue() {
  final horaAtual = DateTime.now().hour;

  // Retorna TRUE se for ANTES das 12:00 (false se for 12h ou mais)
  return horaAtual < 18;
}

double valorParcelaCartao(String valor) {
  // Remover espaços invisíveis que podem estar na string
  valor = valor.replaceAll(RegExp(r'\s+'), '');

  // Expressão regular para capturar o valor da parcela
  final match = RegExp(r'(\d+)xR\$([\d,\.]+)').firstMatch(valor);

  if (match != null) {
    // Captura o valor da parcela, substitui a vírgula por ponto e converte para double
    double valorParcela = double.parse(match.group(2)!.replaceAll(',', '.'));
    return valorParcela;
  }

  // Se não encontrar o formato esperado, retorna 0.0
  return 0.0;
}

double somarFreteTotalCheckout3(List<CarrinhoFinalRecord> queryList) {
  double totalFretePromo = 0.0;

  for (final item in queryList) {
    // Soma APENAS fretePromo (se existir)
    if (item.fretePromo != null && item.fretePromo!.isNotEmpty) {
      try {
        totalFretePromo += double.tryParse(
              item.fretePromo!
                  .replaceAll('R\$', '')
                  .replaceAll('.', '')
                  .replaceAll(',', '.'),
            ) ??
            0.0;
      } catch (e) {
        print('Erro ao converter fretePromo: $e');
      }
    }
  }

  return double.parse(totalFretePromo.toStringAsFixed(2));
}

bool somarFreteTotalCheckout4existe(List<CarrinhoFinalRecord> queryList) {
  for (final item in queryList) {
    if (item.fretePromo != null && item.fretePromo!.isNotEmpty) {
      return true; // Retorna true ao encontrar o primeiro fretePromo válido
    }
  }
  return false; // Se nenhum fretePromo for encontrado
}

double somarFreteTotalCheckoutCopy(List<CarrinhoFinalRecord> queryList) {
  double totalFrete = 0.0;

  for (final item in queryList) {
    // Verifica primeiro se existe fretePromo
    if (item.fretePromo != null && item.fretePromo!.isNotEmpty) {
      try {
        // Converte o fretePromo (String) para double
        final frete = double.tryParse(
                item.fretePromo!.replaceAll('R\$', '').replaceAll(',', '.')) ??
            0.0;
        totalFrete += frete;
      } catch (e) {
        print('Erro ao converter fretePromo: ${e.toString()}');
        // Fallback para frete normal se a conversão falhar
        totalFrete += item.frete ?? 0.0;
      }
    } else {
      // Usa o frete normal se não houver fretePromo
      totalFrete += item.frete ?? 0.0;
    }
  }

  return double.parse(
      totalFrete.toStringAsFixed(2)); // Garante 2 casas decimais
}

String gerarID() {
  const String prefix = 'Pedido-';
  const int length = 15;
  const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final math.Random random = math.Random();

  String generateRandomID() {
    return prefix +
        List.generate(length, (index) => chars[random.nextInt(chars.length)])
            .join();
  }

  return generateRandomID();
}

List<ProdutoRecord> promoRelampagomaisRecente(List<ProdutoRecord> produtos) {
  // Filtra produtos com promoRelampagoDiaHora válido
  final produtosComPromo = produtos
      .where((p) =>
          p.promoRelampagoDiaHora != null &&
          p.promoRelampagoDiaHora!.isNotEmpty)
      .toList();

  if (produtosComPromo.isEmpty) {
    return [];
  }

  final formatadorData = DateFormat('d/M/yyyy');
  final formatadorHora = DateFormat('HH:mm');

  // Ordena os produtos do mais recente para o mais antigo
  produtosComPromo.sort((a, b) {
    try {
      final partesA = a.promoRelampagoDiaHora!.split(' ');
      final partesB = b.promoRelampagoDiaHora!.split(' ');

      if (partesA.length < 3 || partesB.length < 3) return 0;

      final dataA = formatadorData.parse(partesA[0]);
      final dataB = formatadorData.parse(partesB[0]);

      // Compara primeiro as datas
      final comparacaoData = dataB.compareTo(dataA);
      if (comparacaoData != 0) return comparacaoData;

      // Se as datas forem iguais, compara os horários de início
      final horaA = partesA[1]; // "00:00" ou "09:00" etc
      final horaB = partesB[1];

      // Tratamento especial para meia-noite (00:00 é o primeiro horário do dia)
      if (horaA == '00:00' && horaB != '00:00') return -1; // 00:00 vem antes
      if (horaB == '00:00' && horaA != '00:00') return 1; // 00:00 vem antes

      // Para outros horários, compara normalmente
      final timeA = formatadorHora.parse(horaA);
      final timeB = formatadorHora.parse(horaB);

      return timeB.compareTo(timeA); // Ordem decrescente
    } catch (e) {
      return 0;
    }
  });

  return produtosComPromo;
}

double somarFreteTotalCheckout2(List<CarrinhoFinalRecord> queryList) {
  double totalFrete = 0.0;

  for (final item in queryList) {
    // Soma APENAS o frete normal (ignora fretePromo)
    totalFrete += item.frete ?? 0.0;
  }

  return double.parse(totalFrete.toStringAsFixed(2)); // 2 casas decimais
}

int timePix(DateTime time) {
  final DateTime targetTime = time.add(Duration(hours: 24));
  final int remainingMilliseconds =
      targetTime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;
  return remainingMilliseconds > 0 ? remainingMilliseconds : 0;
}

DateTime limitePixTime(DateTime dataentrada) {
  // Adiciona 24 horas à data de entrada
  return dataentrada.add(Duration(hours: 24));
}

String contagemregressivaPix(DateTime dataentrada) {
  // Obtém o momento atual
  DateTime agora = DateTime.now();

  // Calcula a diferença entre a data de entrada e o momento atual
  Duration diferenca = dataentrada.difference(agora);

  // Verifica se a data de entrada já passou
  if (diferenca.isNegative) {
    return "Tempo expirado";
  }

  // Extrai horas, minutos e segundos da diferença
  int horas = diferenca.inHours;
  int minutos = diferenca.inMinutes.remainder(60);
  int segundos = diferenca.inSeconds.remainder(60);

  // Formata a string no formato xx horas xx minutos xx segundos
  String contagemRegressiva = "${horas.toString().padLeft(2, '0')} horas "
      "${minutos.toString().padLeft(2, '0')} minutos "
      "${segundos.toString().padLeft(2, '0')} segundos";

  // Retorna a string formatada
  return contagemRegressiva;
}

double calculoMaisCartao(
  double entrada1,
  double? entrada2,
  String? entrada3,
  double? entrada4,
  double? entrada5,
) {
  // Remover "R$" e substituir vírgula por ponto
  double valorEntrada3 = double.tryParse(
          entrada3?.replaceAll(RegExp(r'R\$|\s'), '').replaceAll(',', '.') ??
              '') ??
      0.0;

  // Somar os valores, tratando nulos como 0.0
  double resultado = entrada1 +
      (entrada2 ?? 0.0) +
      valorEntrada3 +
      (entrada4 ?? 0.0) +
      (entrada5 ?? 0.0);

  // Retornar com duas casas decimais
  return double.parse(resultado.toStringAsFixed(2));
}

String pagamentoReprovado2(
  String entrada1,
  double entrada2,
  double entrada3,
) {
  // Remove "R$" e espaços extras e substitui a vírgula por ponto
  String entrada1Limpa =
      entrada1.replaceAll("R\$", "").trim().replaceAll(",", ".");

  // Converte para double
  double valorEntrada1 = double.tryParse(entrada1Limpa) ?? 0.0;

  // Faz o cálculo
  double resultado = valorEntrada1 - entrada2 - entrada3;

  // Formata para o padrão brasileiro (milhar com ponto e decimal com vírgula)
  final formatoMoeda = NumberFormat("#,##0.00", "pt_BR");
  return formatoMoeda.format(resultado);
}

String precoTotalPedido(
  double preco,
  double quantidade,
  double? taxaProcessamento,
  String? frete,
  double? moeda,
  double? icms,
  double? impostoImportacao,
) {
  // Calculando o valor do frete
  double freteValor = 0.0;
  if (frete != null) {
    freteValor = double.tryParse(frete) ?? 0.0;
  }

  // Calculando o total
  double total = preco * quantidade + freteValor + (taxaProcessamento ?? 0.0);

  // Adicionando ICMS e Imposto de Importação, se existirem
  total += (icms ?? 0.0) + (impostoImportacao ?? 0.0);

  // Subtraindo o valor de "moeda", se não for nulo
  if (moeda != null) {
    total -= moeda;
  }

  // Formatando o resultado para o formato xx,xx ou xxx,xx ou x.xxx,xx
  NumberFormat formatador = NumberFormat("#,##0.00", "pt_BR");
  return formatador.format(total);
}

int moedaCodigo(double moeda) {
  int resultado = (moeda * 100).toInt();
  return resultado > 300 ? 300 : resultado;
}

double moedaLimitar(double entrada) {
  return entrada > 3.0 ? 3.0 : entrada;
}

double impostoDeImportacao(
  double frete,
  int? quantidade,
  double? produto,
) {
  if (quantidade == null || produto == null) {
    return 0.0; // Retorna 0 caso os valores sejam inválidos
  }

  const double taxaCambio = 5.81; // Cotação do dólar

  // Calcula o valor total do pedido em BRL
  double totalPedidoBRL = (produto * quantidade) + frete;

  // Converte para USD
  double totalPedidoUSD = totalPedidoBRL / taxaCambio;

  double impostoUSD;

  if (totalPedidoUSD <= 50.0) {
    // Para pedidos até $50 → 20% de imposto
    impostoUSD = totalPedidoUSD * 0.20;
  } else {
    // Para pedidos acima de $50 → 60% menos $20 de desconto
    impostoUSD = (totalPedidoUSD * 0.60) - 20.0;
    // Garante que o imposto nunca seja negativo
    impostoUSD = math.max(impostoUSD, 0.0);
  }

  // Converte o imposto final de volta para BRL
  double impostoBRL = impostoUSD * taxaCambio;

  return impostoBRL;
}

double impostoICMS(
  double? frete,
  int quantidade,
  double produto,
  String enderecoDestino,
) {
  /// Alíquotas de ICMS por estado
  Map<String, double> aliquotasICMS = {
    "AC": 19.00,
    "AL": 19.00,
    "AP": 18.00,
    "AM": 20.00,
    "BA": 20.50,
    "CE": 20.00,
    "DF": 20.00,
    "ES": 17.00,
    "GO": 19.00,
    "MA": 22.00,
    "MT": 17.00,
    "MS": 17.00,
    "MG": 18.00,
    "PA": 19.00,
    "PB": 20.00,
    "PR": 19.50,
    "PE": 20.50,
    "PI": 21.00,
    "RJ": 22.00,
    "RN": 18.00,
    "RS": 17.00,
    "RO": 17.00,
    "RR": 17.00,
    "SC": 17.00,
    "SP": 18.00,
    "SE": 18.00,
    "TO": 18.00,
  };

  // Extrair o estado do endereçoDestino
  List<String> enderecoParts = enderecoDestino.split(",");
  String estado = enderecoParts.last.trim().split(" ")[0];

  // Verificar se o estado existe na tabela de alíquotas
  double aliquotaICMS =
      aliquotasICMS[estado] ?? 18.00; // Valor padrão 18% (caso não encontrado)

  // Calcular o valor total da operação
  double valorProduto = produto * quantidade;
  double valorTotal = valorProduto + (frete ?? 0);

  // Calcular o ICMS sobre o valor total da operação
  double valorICMS = valorTotal * (aliquotaICMS / 100);

  // Aplicar 40% a mais no valor do ICMS
  valorICMS *= 1.40;

  return valorICMS;
}

double impostoICMSTotal(
  List<CarrinhoRecord> documentList,
  String enderecoDestino,
) {
  // Alíquotas de ICMS por estado
  Map<String, double> aliquotasICMS = {
    "AC": 19.00,
    "AL": 19.00,
    "AP": 18.00,
    "AM": 20.00,
    "BA": 20.50,
    "CE": 20.00,
    "DF": 20.00,
    "ES": 17.00,
    "GO": 19.00,
    "MA": 22.00,
    "MT": 17.00,
    "MS": 17.00,
    "MG": 18.00,
    "PA": 19.00,
    "PB": 20.00,
    "PR": 19.50,
    "PE": 20.50,
    "PI": 21.00,
    "RJ": 22.00,
    "RN": 18.00,
    "RS": 17.00,
    "RO": 17.00,
    "RR": 17.00,
    "SC": 17.00,
    "SP": 18.00,
    "SE": 18.00,
    "TO": 18.00,
  };

  // Extrair o estado do endereçoDestino
  List<String> enderecoParts = enderecoDestino.split(",");
  String estado = enderecoParts.last.trim().split(" ")[0];

  // Verificar se o estado existe na tabela de alíquotas
  double aliquotaICMS =
      aliquotasICMS[estado] ?? 18.00; // Valor padrão 18% (caso não encontrado)

  // Inicializar variável para armazenar o total de ICMS
  double totalICMS = 0;

  // Iterar sobre a lista de documentos e calcular ICMS para cada um
  for (var documento in documentList) {
    // Verificar se o produto é nacional (campo "nacional")
    bool produtoNacional = documento.nacional ??
        false; // Se "nacional" for false ou não estiver setado, é importado

    // Se o produto for nacional, não calcular ICMS
    if (produtoNacional) {
      continue; // Pula para o próximo produto
    }

    // Obter os dados de frete, quantidade e preço do documento
    double frete = documento.frete ?? 0.0; // Valor do frete, 0 caso não exista
    int quantidade = documento.quantidade ?? 0; // Quantidade, 0 caso não exista
    double preco =
        documento.preco ?? 0.0; // Preço do produto, 0 caso não exista

    // Calcular o valor total da operação
    double valorProduto = preco * quantidade;
    double valorTotal = valorProduto + frete;

    // Calcular o ICMS sobre o valor total da operação
    double valorICMS = valorTotal * (aliquotaICMS / 100);

    // Aplicar 40% a mais no valor do ICMS
    valorICMS *= 1.40;

    // Adicionar o valor de ICMS deste documento ao total
    totalICMS += valorICMS;
  }

  // Retornar o total de ICMS calculado
  return totalICMS;
}

double? somaXmaisY(
  double entradaX,
  double entradaY,
) {
  return double.parse((entradaX + entradaY).toStringAsFixed(2));
}

List<String> buscarSugestoesPalavrasChave(
  String? busca,
  List<ProdutoRecord> documentList,
) {
  /// Se a busca for nula ou vazia, retorna uma lista vazia
  if (busca == null || busca.isEmpty) {
    return [];
  }

  busca = busca.toLowerCase(); // Normaliza a string de busca
  List<String> sugestoesExatas = [];
  List<String> sugestoesFrase = [];
  List<String> sugestoesAmpla = [];

  for (var produto in documentList) {
    if (produto.palavrasChaveList == null) continue;

    for (var palavra in produto.palavrasChaveList!) {
      String palavraLower = palavra.toLowerCase();

      // Correspondência Exata
      if (palavraLower == busca) {
        sugestoesExatas.add(palavra);
      }
      // Correspondência de Frase (inicia com a busca)
      else if (palavraLower.startsWith(busca)) {
        sugestoesFrase.add(palavra);
      }
      // Correspondência Ampla (contém a busca)
      else if (palavraLower.contains(busca)) {
        sugestoesAmpla.add(palavra);
      }
    }
  }

  // Criando um Set para garantir que as palavras sejam únicas
  Set<String> resultadoSet = Set.from([
    ...sugestoesExatas,
    ...sugestoesFrase,
    ...sugestoesAmpla,
  ]);

  // Retorna no máximo 12 sugestões
  return resultadoSet.take(12).toList();
}

List<String>? palavrachave(String? palavras) {
  if (palavras == null || palavras.isEmpty) {
    return null;
  }
  return palavras
      .split('\n')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
}

List<String> listaBuscaHistorico(
  String palavraNova,
  List<String> listaPalavras,
) {
  // Cria uma nova lista baseada na listaPalavras existente
  List<String> novaLista = List.from(listaPalavras);

  // Insere a palavraNova no início da lista (índice 0)
  novaLista.insert(0, palavraNova);

  // Retorna a nova lista com a palavra adicionada no início
  return novaLista;
}

List<int> nomecodigo(
  List<int> numeros,
  int? quantidadeItem,
) {
  // Define a quantidade mínima como 5 quando:
  // 1. quantidadeItem for nula OU
  // 2. quantidadeItem for menor ou igual a 5
  final quantidade = (quantidadeItem == null || quantidadeItem <= 5)
      ? math.min(5, numeros.length) // Pega no máximo 5 ou o total disponível
      : math.min(quantidadeItem,
          numeros.length); // Pega o valor solicitado ou o total disponível

  // Retorna os primeiros N elementos
  return numeros.take(quantidade).toList();
}

List<ProdutoRecord> recomendarProdutosPersonalizados(
  List<ProdutoRecord> documentList,
  List<String> favoritosIds,
  List<String> ultimasPesquisas,
  List<String> vistoPorUltimoIds,
  List<String> comprasAntigasIds,
  int limite,
  int limiteInicial,
) {
  final int limiteTotal = limiteInicial + limite;

  // 1. Converter IDs para ProdutoRecords
  final favoritosRecords =
      documentList.where((p) => favoritosIds.contains(p.reference.id)).toList();
  final vistoPorUltimoRecords = documentList
      .where((p) => vistoPorUltimoIds.contains(p.reference.id))
      .toList();
  final comprasAntigasRecords = documentList
      .where((p) => comprasAntigasIds.contains(p.reference.id))
      .toList();

  // 2. Juntar todos os produtos com os quais o usuário interagiu
  final produtosInteragidos = [
    ...favoritosRecords,
    ...vistoPorUltimoRecords,
    ...comprasAntigasRecords
  ];

  // 3. Extrair palavras-chave de todas as interações do usuário
  final palavrasChaveUsuario = <String>{};

  void extrairPalavrasChave(List<ProdutoRecord> produtos) {
    for (final produto in produtos) {
      if (produto.palavrasChaveList != null) {
        palavrasChaveUsuario
            .addAll(produto.palavrasChaveList!.map((p) => p.toLowerCase()));
      }
    }
  }

  extrairPalavrasChave(produtosInteragidos);
  palavrasChaveUsuario.addAll(ultimasPesquisas.map((p) => p.toLowerCase()));

  // 4. Se não houver dados de interesse, retornar produtos populares
  if (palavrasChaveUsuario.isEmpty) {
    final popularesOrdenados = List<ProdutoRecord>.from(documentList)
      ..sort((a, b) => (b.vendas ?? 0).compareTo(a.vendas ?? 0));
    return popularesOrdenados.take(limiteTotal).toList();
  }

  // 5. Classificar produtos por relevância
  final produtosComPontuacao = <Map<String, dynamic>>[];

  for (final produto in documentList) {
    final palavrasProduto =
        produto.palavrasChaveList?.map((p) => p.toLowerCase()).toList() ?? [];

    // Calcular pontuação baseada em palavras-chave
    int pontuacao = 0;
    for (final palavraUsuario in palavrasChaveUsuario) {
      for (final palavraProduto in palavrasProduto) {
        if (palavraProduto.contains(palavraUsuario)) {
          pontuacao += 2;
          break;
        }
      }
    }

    // Bônus para produtos interagidos (verificando por ID)
    if (favoritosIds.contains(produto.reference.id)) pontuacao += 10;
    if (comprasAntigasIds.contains(produto.reference.id)) pontuacao += 8;
    if (vistoPorUltimoIds.contains(produto.reference.id)) pontuacao += 5;

    if (pontuacao > 0) {
      produtosComPontuacao.add({
        'produto': produto,
        'pontuacao': pontuacao,
      });
    }
  }

  // 6. Ordenar por pontuação e outros critérios
  produtosComPontuacao.sort((a, b) {
    final comparePontuacao = b['pontuacao'].compareTo(a['pontuacao']);
    if (comparePontuacao != 0) return comparePontuacao;

    final compareVendas = (b['produto'] as ProdutoRecord)
        .vendas
        .compareTo((a['produto'] as ProdutoRecord).vendas ?? 0);
    if (compareVendas != 0) return compareVendas;

    return (b['produto'] as ProdutoRecord)
        .data!
        .compareTo((a['produto'] as ProdutoRecord).data!);
  });

  // 7. Preparar lista final
  final recomendados = produtosComPontuacao
      .map((item) => item['produto'] as ProdutoRecord)
      .toList();

  // 8. Garantir limite mínimo
  if (recomendados.length < limiteTotal) {
    recomendados.addAll(documentList
        .where((p) => !recomendados.contains(p))
        .take(limiteTotal - recomendados.length)
        .toList());
  }

  return recomendados.take(limiteTotal).toList();
}

List<ProdutoRecord> recomendarProdutosCarrinho(
  List<ProdutoRecord> documentList,
  List<String> favoritosIds,
  List<String> ultimasPesquisas,
  List<String> vistoPorUltimoIds,
  List<String> comprasAntigasIds,
  int limite,
  int limiteInicial,
  List<CarrinhoRecord>? listaCarrinho,
) {
  final int limiteTotal = limiteInicial + limite;

  // 1. Extrair palavras-chave dos produtos no carrinho
  final palavrasChaveCarrinho = <String>{};
  if (listaCarrinho != null && listaCarrinho.isNotEmpty) {
    for (final item in listaCarrinho) {
      if (item.itens != null) {
        try {
          final produtoNoCarrinho = documentList.firstWhere(
            (p) => p.reference.id == item.itens!.id,
          );
          if (produtoNoCarrinho.palavrasChaveList != null) {
            palavrasChaveCarrinho.addAll(
              produtoNoCarrinho.palavrasChaveList!.map((p) => p.toLowerCase()),
            );
          }
        } catch (e) {
          // Produto não encontrado na documentList, continuar
        }
      }
    }
  }

  // 2. Filtrar produtos que não estão no carrinho
  List<ProdutoRecord> produtosDisponiveis = documentList;
  if (listaCarrinho != null && listaCarrinho.isNotEmpty) {
    final produtosNoCarrinhoIds =
        listaCarrinho.map((item) => item.itens?.id).whereType<String>().toSet();
    produtosDisponiveis = documentList
        .where((p) => !produtosNoCarrinhoIds.contains(p.reference.id))
        .toList();
  }

  // 3. Converter IDs para ProdutoRecords
  final favoritosRecords = produtosDisponiveis
      .where((p) => favoritosIds.contains(p.reference.id))
      .toList();
  final vistoPorUltimoRecords = produtosDisponiveis
      .where((p) => vistoPorUltimoIds.contains(p.reference.id))
      .toList();
  final comprasAntigasRecords = produtosDisponiveis
      .where((p) => comprasAntigasIds.contains(p.reference.id))
      .toList();

  // 4. Juntar produtos interagidos
  final produtosInteragidos = [
    ...favoritosRecords,
    ...vistoPorUltimoRecords,
    ...comprasAntigasRecords
  ];

  // 5. Extrair palavras-chave do usuário
  final palavrasChaveUsuario = <String>{};
  void extrairPalavrasChave(List<ProdutoRecord> produtos) {
    for (final produto in produtos) {
      if (produto.palavrasChaveList != null) {
        palavrasChaveUsuario
            .addAll(produto.palavrasChaveList!.map((p) => p.toLowerCase()));
      }
    }
  }

  extrairPalavrasChave(produtosInteragidos);
  palavrasChaveUsuario.addAll(ultimasPesquisas.map((p) => p.toLowerCase()));

  // 6. Combinar palavras-chave (60% do carrinho + 40% do usuário)
  final palavrasChaveCombinadas = <String>{
    ...palavrasChaveCarrinho,
    ...palavrasChaveUsuario,
  };

  // 7. Se não houver dados, retornar produtos populares
  if (palavrasChaveCombinadas.isEmpty) {
    final populares = List<ProdutoRecord>.from(produtosDisponiveis)
      ..sort((a, b) => (b.vendas ?? 0).compareTo(a.vendas ?? 0));
    return populares.take(limiteTotal).toList();
  }

  // 8. Classificar produtos por relevância
  final produtosComPontuacao = <Map<String, dynamic>>[];
  for (final produto in produtosDisponiveis) {
    final palavrasProduto =
        produto.palavrasChaveList?.map((p) => p.toLowerCase()).toList() ?? [];

    // Pontuação baseada em similaridade com o carrinho (60% do peso)
    int pontuacaoCarrinho = 0;
    if (palavrasChaveCarrinho.isNotEmpty) {
      for (final palavra in palavrasChaveCarrinho) {
        if (palavrasProduto.any((p) => p.contains(palavra))) {
          pontuacaoCarrinho += 3;
        }
      }
    }

    // Pontuação baseada no perfil do usuário (40% do peso)
    int pontuacaoUsuario = 0;
    for (final palavra in palavrasChaveUsuario) {
      if (palavrasProduto.any((p) => p.contains(palavra))) {
        pontuacaoUsuario += 2;
      }
    }

    // Pontuação final com pesos diferentes
    int pontuacaoFinal =
        (pontuacaoCarrinho * 0.6 + pontuacaoUsuario * 0.4).round();

    // Bônus para interações do usuário
    if (favoritosIds.contains(produto.reference.id)) pontuacaoFinal += 10;
    if (comprasAntigasIds.contains(produto.reference.id)) pontuacaoFinal += 8;
    if (vistoPorUltimoIds.contains(produto.reference.id)) pontuacaoFinal += 5;

    if (pontuacaoFinal > 0) {
      produtosComPontuacao
          .add({'produto': produto, 'pontuacao': pontuacaoFinal});
    }
  }

  // 9. Ordenar por pontuação
  produtosComPontuacao.sort((a, b) => b['pontuacao'].compareTo(a['pontuacao']));

  // 10. Preparar lista final
  final recomendados = produtosComPontuacao
      .map((item) => item['produto'] as ProdutoRecord)
      .toList();

  // 11. Garantir limite mínimo
  if (recomendados.length < limiteTotal) {
    recomendados.addAll(produtosDisponiveis
        .where((p) => !recomendados.contains(p))
        .take(limiteTotal - recomendados.length)
        .toList());
  }

  return recomendados.take(limiteTotal).toList();
}

List<ProdutoRecord> recomendarProdutosComprouAntes(
  List<ProdutoRecord> documentList,
  List<String> comprasAntigasIds,
) {
  // Filtrar e retornar APENAS produtos que foram comprados anteriormente
  return documentList
      .where((produto) => comprasAntigasIds.contains(produto.reference.id))
      .toList();
}

String gerarPesquisa(
  List<String> listaPalavras,
  String nomeProduto,
  String? categoriaProduto,
) {
  // 1. Se não há palavras-chave, retorna a categoria (ou vazio se não houver categoria)
  if (listaPalavras.isEmpty) {
    return categoriaProduto?.trim() ?? "";
  }

  // 2. Normaliza o nome e categoria para comparação
  final palavrasNome = nomeProduto.trim().toLowerCase().split(' ');
  final palavrasCategoria =
      categoriaProduto?.trim().toLowerCase().split(' ') ?? [];

  // 3. Procura a primeira palavra-chave que aparece no nome OU na categoria
  for (final palavra in listaPalavras) {
    final palavraNormalizada = palavra.trim().toLowerCase();

    final existeNoNome =
        palavrasNome.any((termo) => termo.contains(palavraNormalizada));
    final existeNaCategoria =
        palavrasCategoria.any((termo) => termo.contains(palavraNormalizada));

    if (existeNoNome || existeNaCategoria) {
      return palavra; // Retorna a palavra-chave relevante
    }
  }

  // 4. Se nenhuma palavra-chave for relevante, retorna a categoria (ou vazio)
  return categoriaProduto?.trim() ?? "";
}

List<String> posicaoFotoUpdate(
  int index,
  String posicao,
  List<String> imageList,
) {
  // Cria uma cópia da lista original para não modificar a referência
  final novaLista = List<String>.from(imageList);

  // Verifica se a lista tem elementos suficientes e se o índice é válido
  if (novaLista.length < 2 || index < 0 || index >= novaLista.length) {
    return imageList; // Retorna a lista original se não for possível reordenar
  }

  // Converte a posição para minúsculas para comparação case-insensitive
  final direcao = posicao.toLowerCase();

  // Realiza a troca de posição conforme a direção especificada
  if (direcao == 'cima' && index > 0) {
    // Move para cima (troca com o elemento anterior)
    final imagem = novaLista.removeAt(index);
    novaLista.insert(index - 1, imagem);
  } else if (direcao == 'baixo' && index < novaLista.length - 1) {
    // Move para baixo (troca com o próximo elemento)
    final imagem = novaLista.removeAt(index);
    novaLista.insert(index + 1, imagem);
  }

  // Retorna a nova lista reordenada (ou a original se nenhuma mudança ocorreu)
  return novaLista;
}

String formatarListaParaTexto(List<String> textoList) {
  // Verifica se a lista é nula ou vazia
  if (textoList == null || textoList.isEmpty) {
    return '';
  }

  // Filtra itens nulos ou vazios e junta com quebras de linha
  return textoList
      .where((item) => item != null && item.trim().isNotEmpty)
      .join('\n');
}

String chechoutImagem(String entrada) {
  // Procura pelo padrão (foto "URL") na string
  final fotoPattern = RegExp(r'\(foto\s+"([^"]+)"\)');
  final match = fotoPattern.firstMatch(entrada);

  if (match != null && match.groupCount >= 1) {
    return match.group(1)!; // Retorna a URL capturada
  }

  return ''; // Retorna string vazia se não encontrar
}

bool fretePromoExiste(CarrinhoFinalRecord documento) {
  return documento.fretePromo != null;
}

double impostoICMSNovo(
  List<String> produtos,
  String freteStr,
  String enderecoDestino,
  bool nacional,
) {
  if (nacional == true) {
    return 0.0;
  }

  const Map<String, double> aliquotasICMS = {
    "AC": 19.00,
    "AL": 19.00,
    "AP": 18.00,
    "AM": 20.00,
    "BA": 20.50,
    "CE": 20.00,
    "DF": 20.00,
    "ES": 17.00,
    "GO": 19.00,
    "MA": 22.00,
    "MT": 17.00,
    "MS": 17.00,
    "MG": 18.00,
    "PA": 19.00,
    "PB": 20.00,
    "PR": 19.50,
    "PE": 20.50,
    "PI": 21.00,
    "RJ": 22.00,
    "RN": 18.00,
    "RS": 17.00,
    "RO": 17.00,
    "RR": 17.00,
    "SC": 17.00,
    "SP": 18.00,
    "SE": 18.00,
    "TO": 18.00
  };

  // Cálculo do valor total dos produtos
  double valorTotalProdutos = 0.0;

  for (final produtoStr in produtos) {
    try {
      final valorMatch =
          RegExp(r'\(valor Unidade "R\$([\d,]+)"\)').firstMatch(produtoStr);
      final valorStr =
          valorMatch?.group(1)?.replaceAll('.', '').replaceAll(',', '.');
      final valor = double.tryParse(valorStr ?? '0') ?? 0.0;

      final qtdMatch = RegExp(r'\(quantidade "(\d+)"\)').firstMatch(produtoStr);
      final quantidade = int.tryParse(qtdMatch?.group(1) ?? '1') ?? 1;

      valorTotalProdutos += valor * quantidade;
    } catch (e) {
      print('Erro ao processar produto: $e');
    }
  }

  // CORREÇÃO PRINCIPAL: Processamento do frete
  final frete =
      double.tryParse(freteStr.replaceAll('R\$', '').replaceAll(',', '.')) ??
          0.0;

  // Extração do estado
  String estado = 'SP';
  try {
    final partes = enderecoDestino.split(',').last.trim().split(' ');
    estado = partes.length >= 2 ? partes[partes.length - 2] : estado;
  } catch (e) {
    print('Erro ao extrair estado: $e');
  }

  final aliquota = aliquotasICMS[estado] ?? 18.00;
  final baseCalculo = valorTotalProdutos + frete;
  final valorICMS = baseCalculo * (aliquota / 100) * 1.4;

  return double.parse(valorICMS.toStringAsFixed(2));
}

double impostoICMSTotalNovo(
  List<CarrinhoFinalRecord> documentList,
  String enderecoDestino,
) {
  // 1. Tabela de alíquotas
  const Map<String, double> aliquotasICMS = {
    "AC": 19.00,
    "AL": 19.00,
    "AP": 18.00,
    "AM": 20.00,
    "BA": 20.50,
    "CE": 20.00,
    "DF": 20.00,
    "ES": 17.00,
    "GO": 19.00,
    "MA": 22.00,
    "MT": 17.00,
    "MS": 17.00,
    "MG": 18.00,
    "PA": 19.00,
    "PB": 20.00,
    "PR": 19.50,
    "PE": 20.50,
    "PI": 21.00,
    "RJ": 22.00,
    "RN": 18.00,
    "RS": 17.00,
    "RO": 17.00,
    "RR": 17.00,
    "SC": 17.00,
    "SP": 18.00,
    "SE": 18.00,
    "TO": 18.00
  };

  // 2. Extrai estado (últimas 2 letras após última vírgula)
  String estado = 'SP';
  try {
    final partes = enderecoDestino.split(',').last.trim().split(' ');
    estado = partes.length >= 2 ? partes[partes.length - 2] : estado;
  } catch (e) {
    print('Erro ao extrair estado: $e');
  }

  final aliquota = aliquotasICMS[estado] ?? 18.00;
  double totalICMS = 0.0;

  for (final doc in documentList) {
    if (doc.nacional == true) continue;

    try {
      double valorTotalProdutos = 0.0;

      // 3. Processa produtos
      for (final produtoStr in doc.listProdutos) {
        final valorMatch =
            RegExp(r'\(valor Unidade "R\$([\d,]+)"\)').firstMatch(produtoStr);
        final valor = double.tryParse(valorMatch
                    ?.group(1)
                    ?.replaceAll('.', '')
                    .replaceAll(',', '.') ??
                '0') ??
            0.0;

        final qtdMatch =
            RegExp(r'\(quantidade "(\d+)"\)').firstMatch(produtoStr);
        final quantidade = int.tryParse(qtdMatch?.group(1) ?? '1') ?? 1;

        valorTotalProdutos += valor * quantidade;
      }

      // 4. Lógica do frete (prioriza fretePromo se existir)
      double freteBRL;
      if (doc.fretePromo != null &&
          doc.fretePromo is String &&
          (doc.fretePromo as String).isNotEmpty) {
        freteBRL = double.tryParse(
              (doc.fretePromo as String)
                  .replaceAll('R\$', '')
                  .replaceAll('.', '')
                  .replaceAll(',', '.'),
            ) ??
            doc.frete ??
            0.0;
      } else {
        freteBRL = doc.frete ?? 0.0;
      }

      // 5. Cálculo do ICMS
      final baseCalculo = valorTotalProdutos + freteBRL;
      final icms = baseCalculo * (aliquota / 100) * 1.4;
      totalICMS += icms;
    } catch (e) {
      print('Erro no cálculo para ${doc.reference.id}: $e');
    }
  }

  return double.parse(totalICMS.toStringAsFixed(2));
}

String saquePendente(
  List<PedidosTotalRecord> documentoList,
  DocumentReference afiliadoRef,
) {
  double total = 0.0;
  final hoje = DateTime.now();
  final seteDiasAtras = hoje.subtract(
      Duration(days: 6)); // 6 dias para pegar 7 dias no total (hoje + 6)

  // Percorre todos os documentos na lista
  for (var documento in documentoList) {
    // Filtro 1: Verifica se o afiliadoRef do documento é igual ao afiliadoRef passado
    if (documento.afiliadoRef != afiliadoRef) {
      continue;
    }

    // Filtro 2: Verifica se afiliadoSacouDinheiro é false ou não existe
    if (documento.afiliadoSacouDinheiro == true) {
      continue;
    }

    // Filtro 3: Verifica se a data_pedido está dentro do período (hoje até 7 dias atrás)
    if (documento.dataPedido == null ||
        documento.dataPedido!.isBefore(seteDiasAtras) ||
        documento.dataPedido!.isAfter(hoje)) {
      continue;
    }

    // Se passou por todos os filtros, soma a comissão
    if (documento.comissaoAfiliado != null) {
      total += documento.comissaoAfiliado!;
    }
  }

  // Formata o valor para o padrão monetário brasileiro
  final formatador = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  return formatador.format(total);
}

String saqueTotal(
  List<PedidosTotalRecord> documentoList,
  DocumentReference afiliadoRef,
) {
  double total = 0.0;

  // Percorre todos os documentos na lista
  for (var documento in documentoList) {
    // Filtro 1: Verifica se o afiliadoRef do documento é igual ao afiliadoRef passado
    if (documento.afiliadoRef != afiliadoRef) {
      continue;
    }

    // Filtro 2: Verifica se afiliadoSacouDinheiro é false ou não existe
    if (documento.afiliadoSacouDinheiro == true) {
      continue;
    }

    // Soma a comissão (sem verificação de data)
    if (documento.comissaoAfiliado != null) {
      total += documento.comissaoAfiliado!;
    }
  }

  // Formata o valor para o padrão monetário brasileiro
  final formatador = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  return formatador.format(total);
}

double calcularImpostoImportacaoTotalNovo(
    List<CarrinhoFinalRecord> documentList) {
  // 1. Constantes do cálculo
  const double taxaCambio = 5.81; // 1 USD = 5.81 BRL
  const double limiteIsencaoUSD = 50.0;
  const double taxaAteLimite = 0.20; // 20%
  const double taxaAcimaLimite = 0.60; // 60%
  const double descontoAcimaLimite = 20.0; // $20
  const double acrescimoFixoBRL = 1.00; // R$1,00 fixo

  double totalImposto = 0.0;

  for (final doc in documentList) {
    // Ignora produtos nacionais
    if (doc.nacional == true) continue;

    try {
      // 2. Calcula valor total dos produtos em USD
      double valorTotalProdutosUSD = 0.0;
      for (final produtoStr in doc.listProdutos) {
        final valorMatch =
            RegExp(r'\(valor Unidade "R\$([\d,]+)"\)').firstMatch(produtoStr);
        final valorBRL = double.tryParse(
              valorMatch?.group(1)?.replaceAll('.', '').replaceAll(',', '.') ??
                  '0',
            ) ??
            0.0;

        final qtdMatch =
            RegExp(r'\(quantidade "(\d+)"\)').firstMatch(produtoStr);
        final quantidade = int.tryParse(qtdMatch?.group(1) ?? '1') ?? 1;

        valorTotalProdutosUSD += (valorBRL * quantidade) / taxaCambio;
      }

      // 3. Lógica do frete (prioriza fretePromo se existir)
      double freteBRL;
      if (doc.fretePromo != null &&
          doc.fretePromo is String &&
          (doc.fretePromo as String).isNotEmpty) {
        freteBRL = double.tryParse(
              (doc.fretePromo as String)
                  .replaceAll('R\$', '')
                  .replaceAll('.', '')
                  .replaceAll(',', '.'),
            ) ??
            doc.frete ??
            0.0; // Fallback para frete normal se conversão falhar
      } else {
        freteBRL = doc.frete ?? 0.0; // Usa frete normal
      }

      // 4. Cálculo final do imposto
      final freteUSD = freteBRL / taxaCambio;
      final totalPedidoUSD = valorTotalProdutosUSD + freteUSD;

      double impostoUSD;
      if (totalPedidoUSD <= limiteIsencaoUSD) {
        impostoUSD = totalPedidoUSD * taxaAteLimite;
      } else {
        impostoUSD = (totalPedidoUSD * taxaAcimaLimite) - descontoAcimaLimite;
        impostoUSD = impostoUSD.clamp(
            0.0, double.infinity); // Garante valor não negativo
      }

      totalImposto += (impostoUSD * taxaCambio) + acrescimoFixoBRL;
    } catch (e) {
      debugPrint('❌ Erro no cálculo para ${doc.reference.id}: $e');
      // Continua para os próximos itens mesmo se um falhar
    }
  }

  // 5. Retorna com 2 casas decimais
  return double.parse(totalImposto.toStringAsFixed(2));
}

double totalProdutosChechout1(
  List<String> listString,
  double entrada1,
  double entrada2,
  double entrada3,
) {
  double totalGeral = 0.0;

  for (String item in listString) {
    try {
      // Extrai o "valor Unidade" (ex: "R$80,18" → 80.18)
      final valorUnidadeMatch =
          RegExp(r'\(valor Unidade "([^"]+)"\)').firstMatch(item);
      String? valorUnidadeStr = valorUnidadeMatch
          ?.group(1)
          ?.replaceAll('R\$', '')
          .replaceAll(',', '.');

      // Extrai a "quantidade" (ex: "1" → 1)
      final quantidadeMatch =
          RegExp(r'\(quantidade "([^"]+)"\)').firstMatch(item);
      String? quantidadeStr = quantidadeMatch?.group(1);

      if (valorUnidadeStr != null && quantidadeStr != null) {
        double valorUnidade = double.tryParse(valorUnidadeStr) ?? 0.0;
        int quantidade = int.tryParse(quantidadeStr) ?? 0;

        totalGeral += valorUnidade * quantidade;
      }
    } catch (e) {
      debugPrint('Erro ao processar item: $e');
    }
  }

  // Soma TODAS as entradas adicionais ao total geral
  totalGeral += entrada1 + entrada2 + entrada3; // Agora inclui entrada3

  return totalGeral;
}

double valorTotalChechout(
  double entrada1,
  double entrada2,
  double entrada3,
  double entrada4,
  double entrada5,
  List<CarrinhoRecord> queryList,
) {
  // Soma todos os valores de preço multiplicados pela quantidade
  double total = queryList.fold(0.0, (sum, item) {
    final preco = item.preco ?? 0.0;
    final quantidade = item.quantidade ?? 1;
    return sum + (preco * quantidade);
  });

  // Adiciona as entradas e subtrai a entrada5 (tratada como valor absoluto)
  total += entrada1 + entrada2 + entrada3 + entrada4 - entrada5.abs();

  // Retorna o valor bruto em double com 2 casas decimais
  return double.parse(total.toStringAsFixed(2));
}

double calcularDescontoFreteTotalNovo(List<CarrinhoFinalRecord> documentList) {
  // Verifica se a lista é vazia
  if (documentList.isEmpty) return 0.00;

  double totalFreteNormal = 0.0;
  double totalFretePromo = 0.0;

  for (final doc in documentList) {
    // Soma o frete normal
    totalFreteNormal += doc.frete ?? 0.0;

    // Processa o frete promocional se existir
    if (doc.fretePromo != null && doc.fretePromo!.isNotEmpty) {
      try {
        totalFretePromo += double.tryParse(
              doc.fretePromo!
                  .replaceAll('R\$', '')
                  .replaceAll('.', '')
                  .replaceAll(',', '.'),
            ) ??
            0.0;
      } catch (e) {
        debugPrint('Erro ao converter fretePromo: $e');
      }
    }
  }

  // Calcula o desconto total (diferença não negativa)
  final descontoTotal =
      (totalFreteNormal - totalFretePromo).clamp(0.0, double.infinity);

  // Retorna com 2 casas decimais
  return double.parse(descontoTotal.toStringAsFixed(2));
}

bool carrinhoIndexUltimo(
  int? indexAtual,
  List<CarrinhoRecord> documentList,
) {
  if (indexAtual == null || documentList.isEmpty) {
    return false;
  }
  return indexAtual == documentList.length - 1;
}

bool? carrinhoSelecionadoVisto(List<CarrinhoRecord> documentList) {
  if (documentList.isEmpty) {
    return false; // ou null, dependendo do comportamento desejado para lista vazia
  }

  // Verifica se TODOS os documentos têm "selecionado == true"
  return documentList.every((doc) => doc.selecionado == true);
}

String promoRelampagoHora(List<ProdutoRecord> produtos) {
  if (produtos.isEmpty) {
    return 'Nenhum produto na lista';
  }

  final agora = DateTime.now();
  String registroMaisProximo = '';
  Duration? menorDiferenca;
  int produtosComPromocao = 0;

  final formatador = DateFormat('d/M/yyyy HH:mm');

  for (final produto in produtos) {
    final promoDataHora = produto.promoRelampagoDiaHora;

    if (promoDataHora == null || promoDataHora.isEmpty) {
      continue;
    }
    produtosComPromocao++;

    // Formato esperado: "d/M/yyyy HH:mm - HH:mm"
    final partes = promoDataHora.split(' - ');
    if (partes.length != 2) {
      continue;
    }

    try {
      // Pega apenas a parte da data/hora de início (antes do " - ")
      final dataHoraInicio = formatador.parse(partes[0].trim());

      // Calcula a diferença de tempo em relação a agora (absoluta)
      final diferenca = dataHoraInicio.difference(agora).abs();

      // Se for o primeiro registro ou se a diferença for menor que a atual
      if (menorDiferenca == null || diferenca < menorDiferenca) {
        menorDiferenca = diferenca;
        registroMaisProximo = promoDataHora;
      }
    } catch (e) {
      continue;
    }
  }

  return produtosComPromocao == 0
      ? 'Nenhum produto com promoção relâmpago'
      : registroMaisProximo.isEmpty
          ? 'Nenhum formato válido encontrado'
          : registroMaisProximo;
}

String promoRelampago9h() {
  final agora = DateTime.now();
  final formatadorData = DateFormat('d/M/yyyy');
  final dataFormatada = formatadorData.format(agora);

  return '$dataFormatada 09:00 - 12:00'; // Texto fixo após a data
}

String promoRelampagoCor(String dataHoraIntervalo) {
  try {
    // Extrai a parte do primeiro horário (antes do " - ")
    final primeiroHorario = dataHoraIntervalo.split(' - ')[0].split(' ')[1];

    // Pega apenas a hora (parte antes dos ":")
    final horaStr = primeiroHorario.split(':')[0];

    // Converte para int e retorna como string
    return int.parse(horaStr).toString();
  } catch (e) {
    return 'Erro';
  }
}

bool promoRelampagoAgenda(
  String hora,
  DateTime data,
) {
  // Obtém a data e hora atuais
  DateTime agora = DateTime.now();

  try {
    // Converte a string de hora para número inteiro
    int horaAgendada = int.parse(hora);

    // Cria um DateTime com a data agendada e a hora fornecida
    DateTime dataHoraAgendada = DateTime(
      data.year,
      data.month,
      data.day,
      horaAgendada,
    );

    // Compara com o horário atual
    if (dataHoraAgendada.isAfter(agora)) {
      // Se o horário agendado é depois do horário atual = disponível (true)
      return true;
    } else {
      // Se o horário agendado já passou = indisponível (false)
      return false;
    }
  } catch (e) {
    // Caso ocorra algum erro na conversão da hora, considera como indisponível
    return false;
  }
}

bool promoRelampagoAmanhaTrue() {
  final agora = DateTime.now();
  final horaAtual = agora.hour;
  final minutoAtual = agora.minute;

  // Retorna TRUE se estiver entre 17:00 e 23:59
  return (horaAtual > 17 || (horaAtual == 17 && minutoAtual >= 0)) &&
      (horaAtual < 23 || (horaAtual == 23 && minutoAtual <= 59));
}

String promoRelampago0hStatus() {
  final agora = DateTime.now();
  final horaAtual = agora.hour;
  final minutoAtual = agora.minute;

  // Cria horários de referência
  final inicioPeriodo = TimeOfDay(hour: 0, minute: 0); // 00:00
  final fimPeriodo = TimeOfDay(hour: 9, minute: 0); // 09:00

  // Converte para minutos do dia para comparação
  final minutosAtuais = horaAtual * 60 + minutoAtual;
  final minutosInicio = inicioPeriodo.hour * 60 + inicioPeriodo.minute;
  final minutosFim = fimPeriodo.hour * 60 + fimPeriodo.minute;

  if (minutosAtuais >= minutosInicio && minutosAtuais < minutosFim) {
    return "Em Andamento";
  } else if (minutosAtuais < minutosInicio) {
    return "Em Breve";
  } else {
    return "Expirado";
  }
}

String formatarNumeroMisterioso(double valor) {
  // Converte para string sem formatação (ex: 45.99 → "45.99")
  String valorStr = valor.toString();

  // Separa parte inteira e decimal
  final partes = valorStr.split('.');
  String parteInteira = partes[0];

  // Processa os dígitos inteiros
  final chars = parteInteira.split('');

  if (chars.isEmpty) return '?';

  if (chars.length == 1) {
    return '?'; // Caso único dígito
  } else if (chars.length == 2) {
    // Caso especial para 2 dígitos: "45" → "?5"
    chars[0] = '?';
    return chars.join();
  } else {
    // Para 3+ dígitos: mantém primeiro e último, substitui os do meio
    for (int i = 1; i < chars.length - 1; i++) {
      chars[i] = '?';
    }

    // Adiciona pontos de milhar se necessário (para números ≥ 1000)
    if (parteInteira.length > 3) {
      final result = <String>[];
      int counter = 0;

      for (int i = chars.length - 1; i >= 0; i--) {
        result.insert(0, chars[i]);
        counter++;
        if (counter == 3 && i != 0) {
          result.insert(0, '.');
          counter = 0;
        }
      }
      return result.join();
    }

    return chars.join();
  }
}

bool verificarIntervaloPromocional(String intervalo) {
  try {
    final agora = DateTime.now();

    // Usando formato adaptado para dias/meses com ou sem zero
    final formatador = DateFormat('d/M/yyyy HH:mm');

    final partes = intervalo.split(' - ');
    if (partes.length != 2) return false;

    // Parse das datas com tratamento robusto
    final dataHoraInicio = formatador.parse(partes[0].trim());
    final dataHoraFim = formatador.parse(partes[1].trim());

    // Verificação inclusiva (considera exatamente 00:00 e 09:00)
    return (agora.isAtSameMomentAs(dataHoraInicio) ||
            agora.isAfter(dataHoraInicio)) &&
        (agora.isAtSameMomentAs(dataHoraFim) || agora.isBefore(dataHoraFim));
  } catch (e) {
    print('Erro ao verificar intervalo: $e');
    return false;
  }
}

String timePromo(String timeRange) {
  final now = DateTime.now();

  try {
    final parts = timeRange.split(' - ').map((s) => s.trim()).toList();
    if (parts.length != 2) return "00:00:00"; // Formato inválido

    // Parse do horário de início (usa a data fornecida)
    final startTime = DateFormat('d/M/yyyy HH:mm').parse(parts[0]);

    // Parse do horário de fim (trata casos como "00:00")
    DateTime endTime;
    if (parts[1].length == 5) {
      // Formato "HH:mm"
      endTime = DateTime(
        startTime.year,
        startTime.month,
        startTime.day,
        int.parse(parts[1].split(':')[0]),
        int.parse(parts[1].split(':')[1]),
      );
      if (endTime.isBefore(startTime)) {
        endTime = endTime.add(Duration(days: 1)); // Termina no dia seguinte
      }
    } else {
      endTime = DateFormat('d/M/yyyy HH:mm').parse(parts[1]);
    }

    // Calcula a diferença
    Duration difference;
    if (now.isAfter(endTime)) {
      return "00:00:00"; // Evento já terminou
    } else if (now.isAfter(startTime)) {
      difference = endTime.difference(now); // Tempo até o fim
    } else {
      difference = startTime.difference(now); // Tempo até o início
    }

    // Formata para HH:mm:ss
    final hours = difference.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes =
        difference.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds =
        difference.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  } catch (e) {
    print('Erro: $e');
    return "00:00:00";
  }
}

String promoRelamlagoTimeStatus(String timeRange) {
  final now = DateTime.now();

  try {
    final parts = timeRange.split(' - ').map((s) => s.trim()).toList();
    if (parts.length != 2) return "";

    // Horário de início (usa a data fornecida)
    final startTime = DateFormat('d/M/yyyy HH:mm').parse(parts[0]);

    // Horário de término (se for "00:00", considera o dia seguinte)
    DateTime endTime;
    if (parts[1].length == 5) {
      // Formato "HH:mm"
      endTime = DateTime(
        startTime.year,
        startTime.month,
        startTime.day,
        int.parse(parts[1].split(':')[0]),
        int.parse(parts[1].split(':')[1]),
      );
      if (endTime.isBefore(startTime)) {
        endTime = endTime.add(Duration(days: 1));
      }
    } else {
      endTime = DateFormat('d/M/yyyy HH:mm').parse(parts[1]);
    }

    // Verifica o status
    if (now.isAfter(endTime)) {
      return ""; // Já terminou
    } else if (now.isAfter(startTime)) {
      return "TERMINA EM"; // Dentro do evento
    } else {
      return "COMEÇA EM"; // Ainda não começou
    }
  } catch (e) {
    return "";
  }
}

bool promoRelampagoUpadete(String data) {
  final agora = DateTime.now();
  final formatadorData = DateFormat('d/M/yyyy HH:mm');

  try {
    final partes = data.split(' - ');
    if (partes.length != 2) return false;

    final dataHoraInicio = formatadorData.parse(partes[0].trim());

    // Trata o caso especial de término às 00:00
    final dataHoraFimString = '${partes[0].split(' ')[0]} ${partes[1].trim()}';
    final dataHoraFim = partes[1].trim() == '00:00'
        ? DateTime(dataHoraInicio.year, dataHoraInicio.month,
            dataHoraInicio.day, 23, 59, 0)
        : formatadorData.parse(dataHoraFimString);

    // Retorna true se:
    // 1. Ainda não chegou no horário de início (agora < dataHoraInicio) OU
    // 2. Está dentro do período promocional (agora >= inicio E agora <= fim)
    return agora.isBefore(dataHoraInicio) ||
        (agora.isAfter(dataHoraInicio) && agora.isBefore(dataHoraFim));
  } catch (e) {
    print('Erro ao verificar data da promoção: $e');
    return false;
  }
}

bool verificaHorarioPassado(
  List<ProdutoRecord> produtos,
  String horarioAlvoStr,
) {
  final agora = DateTime.now();
  final formatadorHora = DateFormat('HH:mm');

  try {
    final horarioAlvo = formatadorHora.parse("$horarioAlvoStr:00");

    for (final produto in produtos) {
      final promoDiaHora = produto.promoRelampagoDiaHora;
      if (promoDiaHora == null) continue;

      final partes = promoDiaHora.split(' - ');
      if (partes.length != 2) continue;

      final horaFimStr = partes[1].trim().split(' ').last;
      final horaFim =
          formatadorHora.parse(horaFimStr == "00:00" ? "23:59" : horaFimStr);

      if (horaFim.isAfter(horarioAlvo)) {
        return true;
      }
    }

    return false;
  } catch (e) {
    print('Erro: $e');
    return false;
  }
}

bool verificaHorarioPassado2(
  List<ProdutoRecord> produtos,
  String horarioAlvoStr,
) {
  final agora = DateTime.now();
  final horaAtual = agora.hour;

  try {
    final horarioAlvo = int.tryParse(horarioAlvoStr) ?? 0;

    for (final produto in produtos) {
      final promoDiaHora = produto.promoRelampagoDiaHora ?? '';
      final partes = promoDiaHora.split(' - ');

      if (partes.length != 2) continue; // Pula se formato inválido

      final horaFimStr = partes[1].trim().split(' ').last; // "21:00"
      final horaFim = int.tryParse(horaFimStr.split(':').first) ?? 0; // 21

      // Verifica se:
      // 1. A promoção ainda não expirou (horaAtual < horaFim)
      // 2. O horário atual é anterior ao horário alvo (horaAtual < horarioAlvo)
      if (horaAtual < horaFim && horaAtual < horarioAlvo) {
        return true; // Encontrou pelo menos um produto válido
      }
    }

    return false; // Nenhum produto atende aos critérios
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas12(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    // Verifica se já passou das 12:00 hoje
    final meioDia = DateTime(now.year, now.month, now.day, 12, 0);
    if (now.isAfter(meioDia)) {
      return false;
    }

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      // Extrai data/hora de início
      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      // Verifica se é hoje
      if (dateFormat.format(startDateTime) != dateFormat.format(now)) {
        continue;
      }

      // Extrai hora de término
      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      // Verifica se o intervalo inclui o período da manhã (09:00-12:00)
      final noveHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 9, 0);
      final meioDiaPromo = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 12, 0);

      // Se a promoção cobre qualquer parte do período 9h-12h
      if ((startDateTime.isBefore(meioDiaPromo) &&
          endDateTime.isAfter(noveHoras))) {
        return true;
      }
    }

    return false; // Nenhuma promoção no intervalo encontrada
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas9(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    // Verifica se já passou das 09:00 hoje (novo horário limite)
    final noveHorasLimite = DateTime(now.year, now.month, now.day, 9, 0);
    if (now.isAfter(noveHorasLimite)) {
      return false;
    }

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      // Extrai data/hora de início
      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      // Verifica se é hoje
      if (dateFormat.format(startDateTime) != dateFormat.format(now)) {
        continue;
      }

      // Extrai hora de término
      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      // Verifica se o intervalo inclui o período da madrugada (00:00-09:00)
      final meiaNoite = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 0, 0);
      final noveHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 9, 0);

      // Se a promoção cobre qualquer parte do período 00h-9h
      if ((startDateTime.isBefore(noveHoras) &&
          endDateTime.isAfter(meiaNoite))) {
        return true;
      }
    }

    return false; // Nenhuma promoção no intervalo encontrada
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas21(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    // Verifica se já passou das 21:00 hoje (novo horário limite)
    final noveHorasLimite = DateTime(now.year, now.month, now.day, 21, 0);
    if (now.isAfter(noveHorasLimite)) {
      return false;
    }

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      // Extrai data/hora de início
      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      // Verifica se é hoje
      if (dateFormat.format(startDateTime) != dateFormat.format(now)) {
        continue;
      }

      // Extrai hora de término
      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      // Verifica se o intervalo inclui o período da noite (18:00-21:00)
      final seisHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 18, 0);
      final noveHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 21, 0);

      // Se a promoção cobre qualquer parte do período 18h-21h
      if ((startDateTime.isBefore(noveHoras) &&
          endDateTime.isAfter(seisHoras))) {
        return true;
      }
    }

    return false; // Nenhuma promoção no intervalo encontrada
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas18amanha(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final amanha = DateTime(now.year, now.month, now.day + 1);
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      // Extrai data/hora de início
      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      // Verifica se é AMANHÃ (dia seguinte)
      if (dateFormat.format(startDateTime) != dateFormat.format(amanha)) {
        continue;
      }

      // Extrai hora de término
      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      // Verifica se o intervalo é 12:00-18:00 do dia seguinte
      final meioDia = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 12, 0);
      final seisHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 18, 0);

      if (startDateTime.isAtSameMomentAs(meioDia) &&
          endDateTime.isAtSameMomentAs(seisHoras)) {
        return true;
      }
    }

    return false; // Nenhuma promoção no intervalo encontrada
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas0(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    // Verifica se já passou da meia-noite (00:00)
    final meiaNoite = DateTime(now.year, now.month, now.day + 1, 0, 0);
    if (now.isAfter(meiaNoite)) {
      return false;
    }

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      // Extrai data/hora de início
      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      // Verifica se é hoje
      if (dateFormat.format(startDateTime) != dateFormat.format(now)) {
        continue;
      }

      // Extrai hora de término (tratamento especial para 00:00)
      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      // Verifica se o intervalo inclui o período da noite (21:00-00:00)
      final noveHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 21, 0);
      final meiaNoitePromo = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day + 1, 0, 0);

      // Se a promoção cobre qualquer parte do período 21h-00h
      if ((startDateTime.isBefore(meiaNoitePromo) &&
          endDateTime.isAfter(noveHoras))) {
        return true;
      }
    }

    return false; // Nenhuma promoção no intervalo encontrada
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas18(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    // Verifica se já passou das 18:00 hoje (novo horário limite)
    final seisHorasLimite = DateTime(now.year, now.month, now.day, 18, 0);
    if (now.isAfter(seisHorasLimite)) {
      return false;
    }

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      // Extrai data/hora de início
      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      // Verifica se é hoje
      if (dateFormat.format(startDateTime) != dateFormat.format(now)) {
        continue;
      }

      // Extrai hora de término
      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      // Verifica se o intervalo inclui o período da tarde (12:00-18:00)
      final meioDia = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 12, 0);
      final seisHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 18, 0);

      // Se a promoção cobre qualquer parte do período 12h-18h
      if ((startDateTime.isBefore(seisHoras) && endDateTime.isAfter(meioDia))) {
        return true;
      }
    }

    return false; // Nenhuma promoção no intervalo encontrada
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas9amanha(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final amanha = DateTime(now.year, now.month, now.day + 1);
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      // Extrai data/hora de início
      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      // Verifica se é AMANHÃ (dia seguinte)
      if (dateFormat.format(startDateTime) != dateFormat.format(amanha)) {
        continue;
      }

      // Extrai hora de término
      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      // Verifica se o intervalo é 00:00-09:00 do dia seguinte
      final meiaNoite = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 0, 0);
      final noveHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 9, 0);

      if (startDateTime.isAtSameMomentAs(meiaNoite) &&
          endDateTime.isAtSameMomentAs(noveHoras)) {
        return true;
      }
    }

    return false; // Nenhuma promoção no intervalo encontrada
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas12amanha(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final amanha = DateTime(now.year, now.month, now.day + 1);
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      // Extrai data/hora de início
      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      // Verifica se é AMANHÃ (dia seguinte)
      if (dateFormat.format(startDateTime) != dateFormat.format(amanha)) {
        continue;
      }

      // Extrai hora de término
      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      // Verifica se o intervalo é 09:00-12:00 do dia seguinte
      final noveHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 9, 0);
      final meioDia = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 12, 0);

      if (startDateTime.isAtSameMomentAs(noveHoras) &&
          endDateTime.isAtSameMomentAs(meioDia)) {
        return true;
      }
    }

    return false; // Nenhuma promoção no intervalo encontrada
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

bool verificarPromocaoAntesDas21amanha(List<ProdutoRecord> produtos) {
  try {
    final now = DateTime.now();
    final amanha = DateTime(now.year, now.month, now.day + 1);
    final dateFormat = DateFormat('d/M/yyyy');
    final timeFormat = DateFormat('d/M/yyyy HH:mm');

    for (final produto in produtos) {
      final promoData = produto.promoRelampagoDiaHora;
      if (promoData == null || promoData.isEmpty) continue;

      final parts = promoData.trim().split(' - ');
      if (parts.length != 2) continue;

      final startPart = parts[0].trim();
      final startDateTime = timeFormat.parse(startPart);

      if (dateFormat.format(startDateTime) != dateFormat.format(amanha)) {
        continue;
      }

      final endTime = parts[1].trim();
      final endDateTime = endTime == '00:00'
          ? DateTime(startDateTime.year, startDateTime.month,
              startDateTime.day + 1, 0, 0)
          : timeFormat.parse('${startPart.split(' ')[0]} $endTime');

      final seisHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 18, 0);
      final noveHoras = DateTime(
          startDateTime.year, startDateTime.month, startDateTime.day, 21, 0);

      if (startDateTime.isAtSameMomentAs(seisHoras) &&
          endDateTime.isAtSameMomentAs(noveHoras)) {
        return true;
      }
    }
    return false;
  } catch (e) {
    print('Erro ao verificar promoções: $e');
    return false;
  }
}

String revendaValorMais(
  double preco,
  double? valorMais,
) {
  // Se valorMais for nulo, considera como zero
  final valorAdicional = valorMais ?? 0.0;

  // Calcula o valor total
  final valorTotal = preco + valorAdicional;

  // Formata o valor no padrão brasileiro (1.234,56)
  final formatador = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
    decimalDigits: 2,
  );

  return formatador.format(valorTotal).trim();
}

List<String> addCarrinhoTemporario(
  DateTime dataadicao,
  String fotocapa,
  DocumentReference itens,
  DocumentReference lojaRef,
  bool nacional,
  double preco,
  double precoantes,
  int quantidade,
  bool selecionado,
  String titulo,
  String? variante,
  List<String> listaAntes,
  DocumentReference? afiliadoRef,
  double? afiliadoComissao,
  String? variante2,
  DocumentReference? variacaoRef,
) {
  // Função para extrair valores da string formatada
  String extrairValor(String texto, String campo) {
    final start = texto.indexOf('($campo "') + campo.length + 3;
    final end = texto.indexOf('")', start);
    return start > campo.length + 2 && end > start
        ? texto.substring(start, end)
        : '';
  }

  // Função para atualizar a quantidade
  String atualizarQuantidade(String produtoStr, int novaQuantidade) {
    final regex = RegExp(r'\(quantidade\s"\d+"\)');
    return produtoStr.replaceFirst(
      regex,
      '(quantidade "$novaQuantidade")',
    );
  }

  // Verifica se é duplicado
  for (int i = 0; i < listaAntes.length; i++) {
    final produtoExistente = listaAntes[i];
    final produtoRefExistente = extrairValor(produtoExistente, 'produtoRef');
    final lojaRefExistente = extrairValor(produtoExistente, 'lojaRef');
    final varianteExistente = extrairValor(produtoExistente, 'variante');
    final variante2Existente = extrairValor(produtoExistente, 'variante2');
    final variacaoRefExistente = extrairValor(produtoExistente, 'variacaoRef');

    // Verifica correspondência
    final mesmoProdutoRef = produtoRefExistente == itens.path;
    final mesmoLojaRef = lojaRefExistente == lojaRef.path;
    final mesmaVariante = varianteExistente == (variante ?? '');
    final mesmaVariante2 = variante2Existente == (variante2 ?? '');
    final mesmaVariacaoRef = variacaoRefExistente == (variacaoRef?.path ?? '');

    // Verifica combinação de variantes e referência de variação
    final variantesIguais = (variante == null || variante.isEmpty)
        ? (variante2 == null || variante2.isEmpty)
            ? variacaoRef == null ||
                variacaoRef.path.isEmpty ||
                mesmaVariacaoRef
            : mesmaVariante2 &&
                (variacaoRef == null ||
                    variacaoRef.path.isEmpty ||
                    mesmaVariacaoRef)
        : (variante2 == null || variante2.isEmpty)
            ? mesmaVariante &&
                (variacaoRef == null ||
                    variacaoRef.path.isEmpty ||
                    mesmaVariacaoRef)
            : mesmaVariante &&
                mesmaVariante2 &&
                (variacaoRef == null ||
                    variacaoRef.path.isEmpty ||
                    mesmaVariacaoRef);

    if (mesmoProdutoRef && mesmoLojaRef && variantesIguais) {
      final qtdExistente =
          int.tryParse(extrairValor(produtoExistente, 'quantidade')) ?? 0;
      final novaLista = List<String>.from(listaAntes);
      novaLista[i] =
          atualizarQuantidade(produtoExistente, qtdExistente + quantidade);
      return novaLista;
    }
  }

  // Se não encontrou duplicado, adiciona novo produto
  final formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final novoProduto = StringBuffer()
    ..write('(foto "$fotocapa") ')
    ..write('(titulo "$titulo") ')
    ..write(
        '(data_adicao "${DateFormat('dd/MM/yyyy HH:mm').format(dataadicao)}") ')
    ..write('(valor_unidade "${formatador.format(preco)}") ')
    ..write('(valor_antes "${formatador.format(precoantes)}") ')
    ..write('(quantidade "$quantidade") ')
    ..write('(nacional "${nacional ? 'Sim' : 'Não'}") ')
    ..write('(selecionado "${selecionado ? 'Sim' : 'Não'}") ');

  if (variante != null && variante.isNotEmpty) {
    novoProduto.write('(variante "$variante") ');
  }

  if (variante2 != null && variante2.isNotEmpty) {
    novoProduto.write('(variante2 "$variante2") ');
  }

  novoProduto
    ..write('(produtoRef "${itens.path}") ')
    ..write('(lojaRef "${lojaRef.path}") ');

  // Adiciona variacaoRef apenas se existir
  if (variacaoRef != null) {
    novoProduto.write('(variacaoRef "${variacaoRef.path}") ');
  }

  // Adiciona afiliadoComissao apenas se existir
  if (afiliadoComissao != null) {
    novoProduto.write('(afiliadoComissao "$afiliadoComissao") ');
  }

  // Adiciona afiliadoRef apenas se existir
  if (afiliadoRef != null) {
    novoProduto.write('(afiliadoRef "${afiliadoRef.path}") ');
  }

  return List<String>.from(listaAntes)..add(novoProduto.toString());
}

DocumentReference carrinhoTemporarioLojaRef(String texto) {
  // Expressão regular para encontrar o lojaRef
  final regex = RegExp(r'\(lojaRef\s"([^"]*)"\)');
  final match = regex.firstMatch(texto);

  if (match == null || match.groupCount < 1) {
    throw Exception('Formato inválido: lojaRef não encontrado');
  }

  final lojaRefPath = match.group(1)!;
  return FirebaseFirestore.instance.doc(lojaRefPath);
}

bool carrinhoLoja22(
  List<String> queryList,
  String produtoString,
) {
  // Função para extrair um valor específico da string formatada
  String extrairValor(String texto, String campo) {
    final regex = RegExp('\\\\($campo\\s"([^"]*)"\\\\)');
    final match = regex.firstMatch(texto);
    return match?.group(2) ?? '';
  }

  // Extrai o produtoRef alvo
  final produtoRefAlvo = extrairValor(produtoString, 'produtoRef');
  if (produtoRefAlvo.isEmpty) return false;

  // Conjunto para rastrear as lojas já processadas
  final Set<String> lojasVistas = {};

  // Itera sobre os produtos na lista do carrinho
  for (final produtoStr in queryList) {
    final lojaRef = extrairValor(produtoStr, 'lojaRef');
    final produtoRef = extrairValor(produtoStr, 'produtoRef');

    if (lojaRef.isNotEmpty) {
      // Verifica se a loja já foi vista
      if (!lojasVistas.contains(lojaRef)) {
        lojasVistas.add(lojaRef);

        // Verifica se o produto atual é o produtoRef alvo
        if (produtoRef == produtoRefAlvo) {
          return true; // É o primeiro produto da loja
        }
      } else {
        // Se a loja já foi vista, verifica se é o produto alvo
        if (produtoRef == produtoRefAlvo) {
          return false; // Não é o primeiro produto da loja
        }
      }
    }
  }

  // Caso o produtoRef não seja encontrado na lista
  return false;
}

List<String> carrinhoAfiliadoSelecionado(
  List<String> listaCarrinho,
  String produto,
) {
  // Extrai o produtoRef do produto que queremos modificar
  final produtoRefMatch =
      RegExp(r'\(produtoRef\s+"([^"]+)"\)').firstMatch(produto);
  if (produtoRefMatch == null || produtoRefMatch.groupCount < 1) {
    return listaCarrinho;
  }
  final produtoRef = produtoRefMatch.group(1);

  // Extrai o variacaoRef do produto, se existir
  final variacaoRefMatch =
      RegExp(r'\(variacaoRef\s+"([^"]+)"\)').firstMatch(produto);
  final variacaoRef = variacaoRefMatch?.group(1);

  // Criamos uma nova lista para armazenar os resultados
  List<String> novaLista = [];

  for (String item in listaCarrinho) {
    // Verifica o produtoRef do item atual
    final itemProdutoRefMatch =
        RegExp(r'\(produtoRef\s+"([^"]+)"\)').firstMatch(item);
    final itemProdutoRef = itemProdutoRefMatch?.group(1);

    // Verifica se é o mesmo produto
    if (itemProdutoRef == produtoRef) {
      // Se tiver variacaoRef no produto original, verifica se é a mesma variante
      if (variacaoRef != null) {
        final itemVariacaoRefMatch =
            RegExp(r'\(variacaoRef\s+"([^"]+)"\)').firstMatch(item);
        final itemVariacaoRef = itemVariacaoRefMatch?.group(1);

        // Se as variacoes forem diferentes, mantém o item original
        if (itemVariacaoRef != variacaoRef) {
          novaLista.add(item);
          continue;
        }
      }

      // Extrai o valor atual de "selecionado"
      final selecionadoMatch =
          RegExp(r'\(selecionado\s+"([^"]+)"\)').firstMatch(item);
      final valorAtual = selecionadoMatch?.group(1) ?? 'Não';

      // Determina o novo valor
      final novoValor = valorAtual == 'Sim' ? 'Não' : 'Sim';

      // Atualiza o item
      final itemAtualizado = item.replaceAll(
        '(selecionado "$valorAtual")',
        '(selecionado "$novoValor")',
      );

      novaLista.add(itemAtualizado);
    } else {
      // Mantém o item original se não for o produto que queremos modificar
      novaLista.add(item);
    }
  }

  return novaLista;
}

List<String> carrinhoAfiliadoLoja(
  List<String> listaProdutos,
  String lojaRef,
) {
  // Extrai o valor da lojaRef da string de entrada
  final lojaRefMatch = RegExp(r'\(lojaRef\s+"([^"]+)"\)').firstMatch(lojaRef);
  if (lojaRefMatch == null || lojaRefMatch.groupCount < 1) {
    return listaProdutos; // Retorna original se não encontrar lojaRef
  }
  final lojaRefAlvo = lojaRefMatch.group(1);

  // Filtra os produtos da loja alvo e verifica se todos estão selecionados
  final produtosDaLoja = listaProdutos.where((produto) {
    final match = RegExp(r'\(lojaRef\s+"([^"]+)"\)').firstMatch(produto);
    return match != null && match.group(1) == lojaRefAlvo;
  }).toList();

  if (produtosDaLoja.isEmpty) {
    return listaProdutos; // Retorna original se não encontrar produtos da loja
  }

  // Verifica se todos os produtos da loja estão selecionados
  final todosSelecionados = produtosDaLoja.every((produto) {
    final match = RegExp(r'\(selecionado\s+"([^"]+)"\)').firstMatch(produto);
    return match != null && match.group(1) == 'Sim';
  });

  // Determina o novo valor para selecionado
  final novoValor = todosSelecionados ? 'Não' : 'Sim';

  // Atualiza a lista de produtos
  return listaProdutos.map((produto) {
    // Verifica se é um produto da loja alvo
    final matchLojaRef = RegExp(r'\(lojaRef\s+"([^"]+)"\)').firstMatch(produto);
    if (matchLojaRef == null || matchLojaRef.group(1) != lojaRefAlvo) {
      return produto; // Mantém inalterado se não for da loja alvo
    }

    // Atualiza o valor selecionado
    return produto.replaceAllMapped(
      RegExp(r'\(selecionado\s+"([^"]+)"\)'),
      (match) => '(selecionado "$novoValor")',
    );
  }).toList();
}

List<String> carrinhoAfiliadoNacionalFiltro(List<String> produtosCarrinho) {
  return produtosCarrinho.where((produto) {
    // Procura pelo campo "nacional" no produto
    final nacionalMatch =
        RegExp(r'\(nacional\s+"([^"]+)"\)').firstMatch(produto);

    // Verifica se encontrou o campo e se o valor é "Sim"
    return nacionalMatch != null && nacionalMatch.group(1) == 'Sim';
  }).toList();
}

int somarQuantidadesCarrinhoSemLogin(
  List<String> carrinhoNacional,
  List<String> carrinhoInternacional,
) {
  int somaTotal = 0;

  // Função para extrair a quantidade de um produto
  int extrairQuantidade(String produto) {
    final match = RegExp(r'\(quantidade\s+"(\d+)"\)').firstMatch(produto);
    return match != null ? int.tryParse(match.group(1)!) ?? 0 : 0;
  }

  // Soma quantidades do carrinho nacional
  for (final produto in carrinhoNacional) {
    somaTotal += extrairQuantidade(produto);
  }

  // Soma quantidades do carrinho internacional
  for (final produto in carrinhoInternacional) {
    somaTotal += extrairQuantidade(produto);
  }

  return somaTotal;
}

List<String> juntarListaCarrinhoAfiliado(
  List<String> carrinhoNacional,
  List<String> carrinhoInternacional,
) {
  // Cria uma nova lista combinando os dois carrinhos
  return [...carrinhoNacional, ...carrinhoInternacional];
}

int subtrairTresDaLista(List<String> lista) {
  return lista.length - 3;
}

int calcularTotalProdutosMenosTres(
  List<String> carrinhoNacional,
  List<String> carrinhoInternacional,
) {
  // Combina as duas listas
  final listaCompleta = [...carrinhoNacional, ...carrinhoInternacional];

  // Calcula o total de produtos menos 3
  final resultado = listaCompleta.length - 3;

  // Se o resultado for 0, retorna 1, caso contrário retorna o resultado normal
  return resultado == 0 ? 1 : resultado;
}

bool carrinhoAfiliadoIndex(
  String produto,
  List<String> listaProdutos,
) {
  // Verifica se a lista tem pelo menos 1 item e compara com o index 0
  if (listaProdutos.isNotEmpty && listaProdutos[0] == produto) {
    return true;
  }

  // Verifica se a lista tem pelo menos 2 itens e compara com o index 1
  if (listaProdutos.length > 1 && listaProdutos[1] == produto) {
    return true;
  }

  // Se não for igual ao index 0 nem ao 1, retorna false
  return false;
}

String confirmarEmail(String email) {
  // Verifica se o email é válido
  if (email.isEmpty || !email.contains('@')) {
    return email;
  }

  // Divide o email em nome e domínio
  final parts = email.split('@');
  final nome = parts[0];
  final dominio = parts[1];

  // Se o nome tiver 4 caracteres ou menos, mostra apenas o primeiro caractere
  if (nome.length <= 4) {
    return '${nome[0]}***@$dominio';
  }

  // Mantém os 3 primeiros caracteres e os 3 últimos antes do @
  final inicio = nome.substring(0, 3);
  final fim = nome.substring(nome.length - 3);

  // Retorna o email mascarado
  return '${inicio}***${fim}@$dominio';
}

String afiliadoValianteValores(List<VarianteRecord> documentList) {
  // Initialize variables to track min and max prices
  double? minPrice;
  double? maxPrice;

  // Iterate through all documents to find prices
  for (final doc in documentList) {
    // Assuming the price field is called 'preco' and is a double
    // Adjust the field name if it's different in your Firestore
    final preco = doc.preco; // Replace 'preco' with your actual field name

    if (preco != null) {
      // Initialize min and max with the first price found
      minPrice ??= preco;
      maxPrice ??= preco;

      // Update min and max prices
      if (preco < minPrice!) {
        minPrice = preco;
      }
      if (preco > maxPrice!) {
        maxPrice = preco;
      }
    }
  }

  // Format the output string based on the prices found
  if (minPrice == null) {
    return 'Preço não disponível';
  } else if (minPrice == maxPrice) {
    // Single price format
    return 'R\$${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(minPrice).trim()}';
  } else {
    // Range price format
    return 'R\$${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(minPrice).trim()} - R\$${NumberFormat.currency(locale: 'pt_BR', symbol: '').format(maxPrice).trim()}';
  }
}

String afiliadoVendaEntre(String valorAntes) {
  try {
    // Verifica se é um intervalo (contém "-")
    if (valorAntes.contains("-")) {
      // Divide a string em partes
      List<String> partes = valorAntes.split("-");

      // Processa o primeiro valor (antes do "-")
      String primeiroValorStr = partes[0].trim();
      double primeiroValor = double.parse(primeiroValorStr
              .replaceAll("R\$", "")
              .replaceAll(".", "")
              .replaceAll(",", ".")) +
          1.0;

      // Processa o segundo valor (depois do "-")
      String segundoValorStr = partes[1].trim();
      double segundoValor = double.parse(segundoValorStr
              .replaceAll("R\$", "")
              .replaceAll(".", "")
              .replaceAll(",", ".")) +
          1.0;

      // Formata os novos valores
      final formatador = NumberFormat.currency(
          locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);

      String novoPrimeiroValor = formatador.format(primeiroValor);
      String novoSegundoValor = formatador.format(segundoValor);

      return "$novoPrimeiroValor - $novoSegundoValor";
    } else {
      // Processa um único valor
      double valorUnico = double.parse(valorAntes
              .replaceAll("R\$", "")
              .replaceAll(".", "")
              .replaceAll(",", ".")) +
          1.0;

      final formatador = NumberFormat.currency(
          locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);

      return formatador.format(valorUnico);
    }
  } catch (e) {
    // Em caso de erro, retorna o valor original
    return valorAntes;
  }
}

List<String> listaVarianteAfiliado(
  List<VarianteRecord> documentList,
  double addValor,
) {
  List<String> resultado = [];

  for (final doc in documentList) {
    try {
      // Obtém a referência do documento
      String varianteRef = doc.reference.path;

      // Obtém o preço (ajuste o nome do campo se necessário)
      double preco =
          (doc.preco ?? 0.0) + addValor; // Adiciona o valor extra aqui

      // Garante que o preço não fique negativo
      if (preco < 0) preco = 0.0;

      // Formata o preço (sem símbolo R$ e com . como separador decimal)
      String precoFormatado = NumberFormat.currency(
        locale: 'pt_BR',
        symbol: '',
        decimalDigits: 2,
      ).format(preco).trim().replaceAll(",", ".");

      // Adiciona a string formatada à lista
      resultado.add('(varianteRef "$varianteRef") (Preco "$precoFormatado")');
    } catch (e) {
      // Se houver erro, continua para o próximo documento
      continue;
    }
  }

  return resultado;
}

double valorProdutoAfiliado(
  DocumentReference varianteRef,
  List<String> listVariantes,
) {
  try {
    String refProcurada = varianteRef.path.replaceAll('"', '');

    for (String item in listVariantes) {
      try {
        int startRef = item.indexOf('(varianteRef "') + 13;
        int endRef = item.indexOf('") (Preco "', startRef);

        if (startRef >= 13 && endRef != -1) {
          String refAtual =
              item.substring(startRef, endRef).replaceAll('"', '');

          if (refAtual == refProcurada) {
            int startPreco = item.indexOf('(Preco "', endRef) + 8;
            int endPreco = item.lastIndexOf('")');

            if (startPreco >= 8 && endPreco != -1) {
              String precoStr = item.substring(startPreco, endPreco);

              // Não altera nada, converte direto para double
              double valor = double.parse(precoStr);

              // Garante 2 casas decimais
              return double.parse(valor.toStringAsFixed(2));
            }
          }
        }
      } catch (e) {
        continue;
      }
    }
  } catch (e) {
    print('Erro ao processar: $e');
  }

  return 0.0;
}

double menorValorVatiente(List<VarianteRecord> documentList) {
  if (documentList.isEmpty) return 0.0; // Retorna 0 se a lista estiver vazia

  double menorValor = double.maxFinite; // Inicia com o maior valor possível

  for (final doc in documentList) {
    try {
      // Acessa o campo Preco (ajuste o nome do campo se necessário)
      // Verifica se o campo existe e é numérico
      if (doc.preco != null) {
        double valorAtual = doc.preco.toDouble();
        if (valorAtual < menorValor) {
          menorValor = valorAtual;
        }
      }
    } catch (e) {
      // Ignora documentos com formato inválido
      continue;
    }
  }

  // Se não encontrou nenhum valor válido, retorna 0
  return menorValor == double.maxFinite ? 0.0 : menorValor;
}

bool indexAddCardLogado(
  List<CarrinhoRecord> documentList,
  DocumentReference documentoReference,
) {
  // Define o limite máximo de itens a serem verificados (3)
  final int maxItens = 3;
  final int tamanhoLista = documentList.length;

  // Verifica até 3 itens ou o total disponível (se for menor que 3)
  final int limiteVerificacao = math.min(maxItens, tamanhoLista);

  // Verifica se a referência está dentro do limite definido
  for (int i = 0; i < limiteVerificacao; i++) {
    if (documentList[i].reference == documentoReference) {
      return true;
    }
  }

  return false;
}

bool addCardEvitarDuplicar(
  DocumentReference produtoRef,
  String variante,
  List<CarrinhoRecord> carrinhoList,
) {
  // Check if any item in cart already has the same product reference and variation
  for (var item in carrinhoList) {
    if (item.itens == produtoRef && item.variacao == variante) {
      return false; // Found a duplicate
    }
  }
  return true; // No duplicates found
}

bool addCardEvitarDuplicarSemVariante(
  DocumentReference produtoRef,
  List<CarrinhoRecord> carrinhoList,
) {
  // Check if any item in cart already has the same product reference
  for (var item in carrinhoList) {
    if (item.itens == produtoRef) {
      return false; // Found a duplicate
    }
  }
  return true; // No duplicates found
}

List<int> listaFiltroAfiliado(int numeroLista) {
  return List<int>.generate(numeroLista, (index) => index + 1);
}

List<double> filtroGraficoyAfiliado(
  List<PedidosTotalRecord> documentList,
  int numeroLista,
) {
  // Caso especial quando numeroLista é 1
  if (numeroLista == 1) {
    // Cria lista com 3 índices [0, 1, 2]
    final List<double> resultado = List.filled(3, 0.0);

    final hoje = DateTime.now();
    final hojeMidnight = DateTime(hoje.year, hoje.month, hoje.day);

    for (final pedido in documentList) {
      if (pedido.dataPedido != null && pedido.comissaoAfiliado != null) {
        final dataPedido = pedido.dataPedido!;
        final dataPedidoMidnight =
            DateTime(dataPedido.year, dataPedido.month, dataPedido.day);

        // Verifica se é hoje (vai para o índice 1)
        if (dataPedidoMidnight.isAtSameMomentAs(hojeMidnight)) {
          resultado[1] += pedido.comissaoAfiliado!;
        }
        // Índices 0 e 2 permanecem 0
      }
    }
    return resultado;
  }

  // Lógica original para outros casos
  final List<double> resultado = List.filled(numeroLista + 1, 0.0);
  final hoje = DateTime.now();
  final hojeMidnight = DateTime(hoje.year, hoje.month, hoje.day);

  for (final pedido in documentList) {
    if (pedido.dataPedido != null && pedido.comissaoAfiliado != null) {
      final dataPedido = pedido.dataPedido!;
      final dataPedidoMidnight =
          DateTime(dataPedido.year, dataPedido.month, dataPedido.day);

      final diferencaDias = hojeMidnight.difference(dataPedidoMidnight).inDays;

      if (diferencaDias >= 0 && diferencaDias <= numeroLista) {
        resultado[diferencaDias] += pedido.comissaoAfiliado!;
      }
    }
  }

  return resultado;
}

String afilitadoTotalValor(List<PedidosTotalRecord> listaPedidos) {
  double total = 0.0;

  // Soma todas as comissões válidas
  for (final pedido in listaPedidos) {
    if (pedido.comissaoAfiliado != null) {
      total += pedido.comissaoAfiliado!;
    }
  }

  // Formata para moeda brasileira
  final formatador = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  return formatador.format(total);
}

String afiliadoSaldo(List<PedidosTotalRecord> documentoList) {
  double total = 0.0;

  for (final pedido in documentoList) {
    // Verifica se a comissão existe e se o afiliado não sacou o dinheiro
    if (pedido.comissaoAfiliado != null &&
        (pedido.afiliadoSacouDinheiro == null ||
            pedido.afiliadoSacouDinheiro == false)) {
      total += pedido.comissaoAfiliado!;
    }
  }

  // Formata para moeda brasileira e remove o espaço após o R$
  final formatador = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  String valorFormatado = formatador.format(total);
  valorFormatado =
      valorFormatado.replaceAll(' ', ''); // Remove todos os espaços

  return valorFormatado;
}

String saqueDisponivel(
  List<PedidosTotalRecord> documentoList,
  DocumentReference afiliadoRef,
) {
  double total = 0.0;
  final hoje = DateTime.now();
  final seteDiasAtras = hoje.subtract(Duration(days: 7));

  // Percorre todos os documentos na lista
  for (var documento in documentoList) {
    // Filtro 1: Verifica se o afiliadoRef do documento é igual ao afiliadoRef passado
    if (documento.afiliadoRef != afiliadoRef) {
      continue;
    }

    // Filtro 2: Verifica se afiliadoSacouDinheiro é false ou não existe
    if (documento.afiliadoSacouDinheiro == true) {
      continue;
    }

    // Filtro 3: Verifica se a data_pedido é anterior a 7 dias atrás
    if (documento.dataPedido == null ||
        !documento.dataPedido!.isBefore(seteDiasAtras)) {
      continue;
    }

    // Se passou por todos os filtros, soma a comissão
    if (documento.comissaoAfiliado != null) {
      total += documento.comissaoAfiliado!;
    }
  }

  // Formata o valor para o padrão monetário brasileiro
  final formatador = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  return formatador.format(total);
}

String mesAtual() {
  final agora = DateTime.now();

  // Formata o mês em português (configuração 'pt_BR')
  final formatador = DateFormat('MMMM', 'pt_BR');

  // Retorna o mês em minúsculas
  return formatador.format(agora).toLowerCase();
}

List<String> listaAfiliadoSaque(List<PedidosTotalRecord> documentos) {
  final Map<String, Map<String, dynamic>> comissoesPorAfiliado = {};
  final hoje = DateTime.now();
  final seteDiasAtras = hoje.subtract(Duration(days: 7));

  // 1. Processa cada documento
  for (final doc in documentos) {
    // 2. Filtra documentos onde afiliadoSacouDinheiro é true
    if (doc.afiliadoSacouDinheiro == true) continue;

    // 3. Filtra pedidos com menos de 7 dias
    if (doc.dataPedido == null || !doc.dataPedido!.isBefore(seteDiasAtras)) {
      continue;
    }

    final afiliadoId = doc.afiliadoRef?.id ?? '';
    if (afiliadoId.isEmpty) continue;

    // 4. Acumula os valores por afiliado e armazena as referências dos pedidos
    comissoesPorAfiliado.putIfAbsent(
        afiliadoId,
        () => {
              'quantidade': 0,
              'comissao': 0.0,
              'pedidosRef': <String>[], // Lista para armazenar as referências
            });

    comissoesPorAfiliado[afiliadoId]!['quantidade'] += 1;
    comissoesPorAfiliado[afiliadoId]!['comissao'] +=
        doc.comissaoAfiliado ?? 0.0;

    // Adiciona a referência do pedido à lista
    if (doc.reference != null) {
      comissoesPorAfiliado[afiliadoId]!['pedidosRef'].add(doc.reference!.path);
    }
  }

  // 5. Formata os resultados
  return comissoesPorAfiliado.entries.map((entry) {
    final pedidosRef = (entry.value['pedidosRef'] as List<String>)
        .map((ref) => '"$ref"')
        .join(' ');

    return '(afiliadoRef "/users/${entry.key}") '
        '(quantidadeVendas "${entry.value['quantidade']}") '
        '(valorTotalComissao "${NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2).format(entry.value['comissao'])}") '
        '(lista pedidoRef $pedidosRef)';
  }).toList();
}

DocumentReference afiliadoDocumentoRef(String texto) {
  try {
    // Expressão regular para extrair o ID do usuário
    final regex = RegExp(r'\(afiliadoRef "/users/([^"]+)"\)');
    final match = regex.firstMatch(texto);

    if (match != null && match.groupCount >= 1) {
      final userId = match.group(1)!;
      // Cria e retorna o DocumentReference
      return FirebaseFirestore.instance.collection('users').doc(userId);
    }
    // Retorna uma referência inválida se não encontrar (ou pode lançar uma exceção)
    return FirebaseFirestore.instance.doc('null/null');
  } catch (e) {
    return FirebaseFirestore.instance.doc('null/null');
  }
}

List<DocumentReference> afiliadoListaPedidoRef(String texto) {
  try {
    final firestore = FirebaseFirestore.instance;
    final List<DocumentReference> references = [];

    // 1. Encontra a parte da string que contém a lista de pedidoRef
    final listaMatch = RegExp(r'\(lista pedidoRef ([^)]+)\)').firstMatch(texto);
    if (listaMatch == null) return [];

    // 2. Extrai todos os paths individuais
    final paths = listaMatch
        .group(1)!
        .split('" "')
        .map((path) => path.replaceAll('"', '').trim())
        .where((path) => path.isNotEmpty)
        .toList();

    // 3. Converte para DocumentReference
    for (final path in paths) {
      final fullPath =
          path.startsWith('pedidos_total/') ? path : 'pedidos_total/$path';
      references.add(firestore.doc(fullPath));
    }

    return references;
  } catch (e) {
    print('Erro ao extrair referências: $e');
    return [];
  }
}

List<ProdutoRecord> testeScrolInfinito(
  List<ProdutoRecord> documentList,
  int paginaAtual,
) {
  final itensPorPagina = 10;
  final inicio = paginaAtual * itensPorPagina;
  final fim = inicio + itensPorPagina;

  return fim < documentList.length
      ? documentList.sublist(inicio, fim)
      : documentList.sublist(inicio);
}

String esconderContato(String contato) {
  // Verifica se a string tem pelo menos 2 caracteres
  if (contato.length >= 2) {
    // Pega os 2 últimos caracteres
    String ultimosDois = contato.substring(contato.length - 2);
    // Retorna "*****" + os 2 últimos caracteres
    return '*****$ultimosDois';
  } else {
    // Se a string tiver menos de 2 caracteres, retorna apenas os asteriscos
    return '*****';
  }
}

String esconderEmail(String email) {
  // Verifica se é um email válido (contém @)
  if (!email.contains('@')) {
    return '*****'; // Retorna padrão caso não seja email válido
  }

  // Divide o email em parte local e domínio
  List<String> partes = email.split('@');
  String parteLocal = partes[0];
  String dominio = '@' + partes[1];

  // Processa a parte local do email
  if (parteLocal.isEmpty) {
    return '*****' + dominio;
  }

  // Mantém a primeira letra
  String primeiroChar = parteLocal[0];

  // Mantém a última letra (se houver mais de 1 caractere)
  String ultimoChar =
      parteLocal.length > 1 ? parteLocal[parteLocal.length - 1] : '';

  // Cria a parte mascarada
  String mascarado = primeiroChar +
      '*' * (parteLocal.length - (ultimoChar.isEmpty ? 1 : 2)) +
      ultimoChar;

  return mascarado + dominio;
}

String criandoTextoChat(
  String texto,
  String identificacao,
) {
  // Obtém o horário atual formatado como HH:mm
  String horarioAtual = DateFormat('HH:mm').format(DateTime.now());

  // Retorna o texto original + horário + identificação, cada um entre aspas
  return '$texto "$horarioAtual" "$identificacao"';
}

String textoChatHorario(String textoCompleto) {
  // Usando expressão regular para encontrar o padrão "HH:mm"
  var regex = RegExp(r'"(\d{2}:\d{2})"');
  Match? match = regex.firstMatch(textoCompleto);

  // Se encontrou o padrão, retorna o horário (grupo 1 da regex)
  if (match != null) {
    return match.group(1)!;
  }

  return ''; // Retorna string vazia se não encontrar horário
}

bool textoChatIdentificacao(
  String identificacao,
  String textoCompleto,
) {
  var regex = RegExp(r'"([^"]*)"[^"]*$');
  Match? match = regex.firstMatch(textoCompleto);

  if (match != null) {
    String identificacaoNoTexto = match.group(1)!;
    return identificacaoNoTexto == identificacao;
  }

  return false; // Retorna false se não encontrar a identificação
}

String textoChatCopy(String textoCompleto) {
  // Remove tudo que está entre aspas (incluindo as aspas)
  // Usando expressão regular para encontrar padrões "qualquercoisa"
  var regex = RegExp(r' ".*?"');
  String textoLimpo = textoCompleto.replaceAll(regex, '');

  return textoLimpo.trim(); // trim() remove espaços extras no final
}

List<String> recomendarProdutosComprouAntes2(List<PedidosTotalRecord> query) {
  final Set<String> produtoIds = {};

  for (final pedido in query) {
    final produtoRef = pedido.produtoRef;
    if (produtoRef != null) {
      produtoIds.add(produtoRef.id); // Adiciona apenas IDs únicos
    }
  }

  return produtoIds.toList(); // Converte o Set em lista para retorno
}

DocumentReference recomendarProdutosComprouAntes3(String id) {
  return FirebaseFirestore.instance.collection('produto').doc(id);
}

List<ProdutoRecord> recomendarProdutosSimilares(
  List<ProdutoRecord> documentList,
  DocumentReference doc,
  String? quantidadeItem,
) {
  final matchingList =
      documentList.where((p) => p.reference.id == doc.id).toList();
  if (matchingList.isEmpty) return [];

  final produtoBase = matchingList.first;

  final categoriasDoc = [
    produtoBase.lider1?.toLowerCase(),
    produtoBase.lider2?.toLowerCase(),
    produtoBase.lider3?.toLowerCase(),
    produtoBase.lider4?.toLowerCase(),
  ].whereType<String>().toList();

  final palavrasDoc =
      produtoBase.palavrasChaveList?.map((p) => p.toLowerCase()).toSet() ?? {};

  final produtosPontuados = <Map<String, dynamic>>[];

  for (final produto in documentList) {
    if (produto.reference.id == doc.id) continue;

    int pontuacao = 0;

    final categoriasProduto = [
      produto.lider1?.toLowerCase(),
      produto.lider2?.toLowerCase(),
      produto.lider3?.toLowerCase(),
      produto.lider4?.toLowerCase(),
    ].whereType<String>().toList();

    for (int i = 0;
        i < math.min(categoriasDoc.length, categoriasProduto.length);
        i++) {
      if (categoriasDoc[i] == categoriasProduto[i]) {
        pontuacao += (4 - i) * 2;
      }
    }

    final palavrasProduto =
        produto.palavrasChaveList?.map((p) => p.toLowerCase()).toSet() ?? {};
    for (final palavra in palavrasDoc) {
      if (palavrasProduto.contains(palavra)) {
        pontuacao += 1;
      }
    }

    if (pontuacao > 0) {
      produtosPontuados.add({
        'produto': produto,
        'pontuacao': pontuacao,
      });
    }
  }

  produtosPontuados.sort((a, b) => b['pontuacao'].compareTo(a['pontuacao']));

  final int extra = int.tryParse(quantidadeItem ?? '0') ?? 0;
  final int quantidadeTotal = 8 + extra;

  final resultado = produtosPontuados
      .map((item) => item['produto'] as ProdutoRecord)
      .take(quantidadeTotal)
      .toList();

  return resultado;
}

String converterDoRefemIDstring(DocumentReference docRef) {
  return docRef.id;
}

List<String> updateImagemVariante(
  List<String> listImagem,
  String imagemApagar,
) {
  // Cria uma nova lista baseada na listImagem original
  List<String> novaLista = List.from(listImagem);

  // Remove a imagem que corresponde à imagemApagar
  novaLista.removeWhere((imagem) => imagem == imagemApagar);

  // Retorna a lista atualizada
  return novaLista;
}

String notificacaoIdentificarUsuario(String texto) {
  // Procura pelo padrão "/user/" seguido de caracteres alfanuméricos
  final pattern = RegExp(r'\/user\/([a-zA-Z0-9]+)');
  final match = pattern.firstMatch(texto);

  if (match != null && match.groupCount >= 1) {
    final userId = match.group(1);
    if (userId != null && userId.isNotEmpty) {
      return 'user/$userId'; // Retorna com prefixo 'user/'
    }
  }

  // Retorna "user/invalid" se não encontrar o padrão
  return 'user/invalid';
}

String notificacaoSomarComissao(String texto) {
  // Expressão regular para encontrar todos os valores de comissão no formato "R$X,XX"
  final pattern = RegExp(r'comissao\d+\s+"R\$(\d+),(\d+)"');
  final matches = pattern.allMatches(texto);

  double total = 0.0;

  for (final match in matches) {
    // Extrai reais e centavos
    final reais = int.parse(match.group(1)!);
    final centavos = int.parse(match.group(2)!);

    // Converte para valor decimal e soma ao total
    total += reais + (centavos / 100);
  }

  // Formata o valor total para o formato de moeda brasileira
  final formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  return formatter.format(total);
}

DocumentReference notificacaoStringEmRef(String caminho) {
  // Divide a string em partes: coleção e ID
  final partes = caminho.split('/');
  if (partes.length == 2) {
    final colecao = partes[0];
    final docId = partes[1];

    if (colecao.isNotEmpty && docId.isNotEmpty) {
      return FirebaseFirestore.instance.collection(colecao).doc(docId);
    }
  }

  // Se a string estiver malformada, retorna referência inválida
  return FirebaseFirestore.instance.doc('invalid/invalid');
}

bool validarCPF(String cpf) {
// Remove formatação (pontos e traços)
  cpf = cpf.replaceAll(RegExp(r'\D'), '');

// Verifica se o CPF tem 11 dígitos
  if (cpf.length != 11) {
    return false;
  }

// Verifica se todos os dígitos são iguais (ex: 111.111.111-11)
  if (RegExp(r'(\d)\1{10}').hasMatch(cpf)) {
    return false;
  }

// Cálculo do primeiro dígito verificador
  var sum = 0;
  for (var i = 0; i < 9; i++) {
    sum += int.parse(cpf[i]) * (10 - i);
  }
  var firstDigit = (sum * 10) % 11;
  if (firstDigit == 10) {
    firstDigit = 0;
  }

// Verifica se o primeiro dígito verificador está correto
  if (firstDigit != int.parse(cpf[9])) {
    return false;
  }

// Cálculo do segundo dígito verificador
  sum = 0;
  for (var i = 0; i < 10; i++) {
    sum += int.parse(cpf[i]) * (11 - i);
  }
  var secondDigit = (sum * 10) % 11;
  if (secondDigit == 10) {
    secondDigit = 0;
  }

// Verifica se o segundo dígito verificador está correto
  if (secondDigit != int.parse(cpf[10])) {
    return false;
  }

// Se passou por todas as verificações, o CPF é válido
  return true;
}

bool cepCompleto(String cep) {
  //
  // Remove qualquer caractere que não seja um número da string do CEP.
  // Isso lida com a formatação como '12345-678'.
  String cepLimpo = cep.replaceAll(RegExp(r'\D'), '');

  // Verifica se o comprimento da string limpa é exatamente 8.
  // O CEP brasileiro tem 8 dígitos.
  return cepLimpo.length == 8;
}

bool digitosCPF(String cpf) {
  // Remove qualquer caractere que não seja um número da string do CPF.
  // Isso lida com formatações como '503.777.818-27'.
  String cpfLimpo = cpf.replaceAll(RegExp(r'\D'), '');

  // Verifica se o comprimento da string limpa é exatamente 11.
  // O CPF brasileiro tem 11 dígitos.
  return cpfLimpo.length == 11;
}

DocumentReference stringEmDocRef(String id) {
  // Verifica se o ID não é nulo ou vazio
  if (id == null || id.isEmpty) {
    throw ArgumentError('O ID não pode ser nulo ou vazio');
  }

  // Retorna a referência do documento no formato /produto/[ID]
  return FirebaseFirestore.instance.collection('produto').doc(id);
}

String peridoCriacaoLoja(DateTime data) {
  final agora = DateTime.now();
  final diferencaEmMeses =
      (agora.year - data.year) * 12 + (agora.month - data.month);

  if (diferencaEmMeses < 24) {
    final unidade = diferencaEmMeses == 1 ? 'mês' : 'meses';
    return '$diferencaEmMeses $unidade atrás';
  } else {
    final anos = (diferencaEmMeses / 12).floor();
    final unidade = anos == 1 ? 'ano' : 'anos';
    return '$anos $unidade atrás';
  }
}

String gerarQrPagamento(String pixCode) {
  // Use Uri.encodeComponent para garantir que o código Pix seja seguro para a URL
  final encodedPixCode = Uri.encodeComponent(pixCode);

  // Defina os parâmetros da URL
  final String baseUrl = 'https://api.qrserver.com/v1/create-qr-code/';
  final String color = '000000';
  final String bgColor = 'FFFFFF';
  final String size = '400x400';
  final String ecc = 'L';
  final String qzone = '1';
  final String margin = '0';

  // Constrói a URL completa com os parâmetros
  final String url =
      '$baseUrl?color=$color&bgcolor=$bgColor&data=$encodedPixCode&qzone=$qzone&margin=$margin&size=$size&ecc=$ecc';

  return url;
}

double menorValirAfiliado(List<String> listaTexto) {
  double menorPreco = double.infinity;

  for (String texto in listaTexto) {
    try {
      // Encontrar a posição do padrão (Preco "X.XX")
      int inicioPreco = texto.indexOf('(Preco "');
      if (inicioPreco == -1) continue;

      // Avançar para o início do valor numérico
      inicioPreco += 8; // Tamanho de '(Preco "'

      // Encontrar o fim do valor (fechamento das aspas)
      int fimPreco = texto.indexOf('"', inicioPreco);
      if (fimPreco == -1) continue;

      // Extrair a string do preço
      String precoStr = texto.substring(inicioPreco, fimPreco);

      // Converter para double, tratando possíveis vírgulas como ponto
      precoStr = precoStr.replaceAll(',', '.');
      double preco = double.tryParse(precoStr) ?? 0.0;

      // Atualizar o menor preço encontrado
      if (preco < menorPreco) {
        menorPreco = preco;
      }
    } catch (e) {
      // Continuar processando mesmo se um item falhar
      continue;
    }
  }

  // Retornar 0.0 se nenhum preço válido foi encontrado
  return menorPreco == double.infinity ? 0.0 : menorPreco;
}

String buildWebpUrl(String publicId) {
  const cloudName = "dul9tr5i1";

  // Monta a URL final no formato WebP otimizado
  return "https://res.cloudinary.com/$cloudName/image/upload/f_webp,q_auto/$publicId";
}

DocumentReference stringEmDocRefAfiliadoProduto(String id) {
  if (id.isEmpty) {
    throw ArgumentError('O ID não pode ser vazio');
  }

  // Ajuste: coloque o nome exato da sua coleção no Firestore
  return FirebaseFirestore.instance.collection('produtoAfiliado').doc(id);
}
