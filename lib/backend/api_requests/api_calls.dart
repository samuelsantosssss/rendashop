import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'pagamentoRendaShop';

class PuxarCEPCall {
  static Future<ApiCallResponse> call({
    String? cepVariavel = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Puxar CEP',
      apiUrl: 'viacep.com.br/ws/${cepVariavel}/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? cep(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cep''',
      ));
  static String? rua(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
  static String? cidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.localidade''',
      ));
  static String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.estado''',
      ));
  static String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
      ));
  static String? erro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.erro''',
      ));
}

class AsaasTokenClienteCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? dateCreated = '',
    String? name = '',
    String? email = '',
    String? mobilePhone = '',
    String? address = '',
    String? addressNumber = '',
    String? complement = '',
    String? province = '',
    String? cpfCnpj = '',
    String? personType = '',
    String? postalCode = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AsaasTokenClienteCall',
        'variables': {
          'id': id,
          'dateCreated': dateCreated,
          'name': name,
          'email': email,
          'mobilePhone': mobilePhone,
          'address': address,
          'addressNumber': addressNumber,
          'complement': complement,
          'province': province,
          'cpfCnpj': cpfCnpj,
          'personType': personType,
          'postalCode': postalCode,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? idCliente(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class AsaasPagamentoCall {
  static Future<ApiCallResponse> call({
    String? customer = '',
    String? billingType = '',
    String? dueDate = '',
    String? holderName = '',
    String? number = '',
    String? expiryMonth = '',
    String? expiryYear = '',
    String? ccv = '',
    String? name = '',
    String? email = '',
    String? cpfCnpj = '',
    String? postalCode = '',
    String? addressNumber = '',
    String? addressComplement = '',
    String? phone = '',
    String? mobilePhone = '',
    String? remoteIp = '',
    double? value,
    String? description = '',
    double? installmentCount,
    double? totalValue,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AsaasPagamentoCall',
        'variables': {
          'customer': customer,
          'billingType': billingType,
          'dueDate': dueDate,
          'holderName': holderName,
          'number': number,
          'expiryMonth': expiryMonth,
          'expiryYear': expiryYear,
          'ccv': ccv,
          'name': name,
          'email': email,
          'cpfCnpj': cpfCnpj,
          'postalCode': postalCode,
          'addressNumber': addressNumber,
          'addressComplement': addressComplement,
          'phone': phone,
          'mobilePhone': mobilePhone,
          'remoteIp': remoteIp,
          'value': value,
          'description': description,
          'installmentCount': installmentCount,
          'totalValue': totalValue,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? erro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.errors[:].description''',
      ));
}

class BinCall {
  static Future<ApiCallResponse> call({
    int? bin,
  }) async {
    final ffApiRequestBody = '''
{
  "bin": "${bin}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'bin',
      apiUrl: 'https://bin-ip-checker.p.rapidapi.com/?bin=${bin}',
      callType: ApiCallType.POST,
      headers: {
        'x-rapidapi-key': '3e4a4a5425mshe7d44e46c4aa9f6p11b72ejsn77bdf77b32de',
        'x-rapidapi-host': 'bin-ip-checker.p.rapidapi.com',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? bandeira(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.BIN.scheme''',
      ));
  static String? bin(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.BIN.issuer.name''',
      ));
}

class ObterIPCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ObterIP',
      apiUrl: 'https://api64.ipify.org?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? ip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ip''',
      ));
}

class PagPixMPCall {
  static Future<ApiCallResponse> call({
    double? amount,
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    String? identificationType = '',
    String? numberCpf = '',
    String? productTitle = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PagPixMPCall',
        'variables': {
          'amount': amount,
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'identificationType': identificationType,
          'numberCpf': numberCpf,
          'productTitle': productTitle,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static int? idPix(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? chavePix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code''',
      ));
}

class StatusPixMPCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? idPix,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Status Pix MP',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${idPix}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-6793465446446494-052816-aa47d981fbe10fedf66f18f7c60d3810-222286824',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GerarQrCodeCall {
  static Future<ApiCallResponse> call({
    String? pixCode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'gerarQrCode',
      apiUrl: 'https://api.qrserver.com/v1/create-qr-code/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'data': pixCode,
        'size': "200x200",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imagem(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
