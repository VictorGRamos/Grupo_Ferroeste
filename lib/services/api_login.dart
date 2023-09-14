import 'dart:convert';
import 'dart:io';
import 'dart:math';
import '../models/login.dart';
import 'http_interceptor.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http/http.dart' as http;
import 'package:cryptography/cryptography.dart';

class LoginService {
  static const String loginApiConection = 'http://192.168.0.224:8000/';
  static const String pepper = 'appseguroexportacao';

  //TODO verificar performance, se demorar mto diminuir iterations
  final pbkdf2 =
      Pbkdf2(macAlgorithm: Hmac.sha256(), iterations: 10000, bits: 256);

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getLoginConection() {
    return loginApiConection;
  }

  Future<List<dynamic>> getAccount(String email) async {
    String apiUrl = '${getLoginConection()}Login?email=$email';
    try {
      http.Response? response = await client.get(
        Uri.parse(apiUrl),
        headers: {"Content-Type": 'application/json'},
      );
      if (response.statusCode != 200) {
        throw HttpException(
            'A requisição HTTP falhou. \n Body: ${response.body} \n StatusCode: ${response.statusCode}');
      }
      return bodyToList(response.body);
    } catch (e) {
      //TODO enviar log de erro ao sap;
      return ['error'];
    }
    
  }

  Future<Map<String,dynamic>> checkAccountExist(String email) async {
    var listAccount = await getAccount(email);
    if (listAccount.contains('error')) {
      return {'error': true};
    }
    if (listAccount.isEmpty) {
      return {'exists': false, 'error': false};
    }
    return {'exists': true, 'error': false};
  }

  List<Login> bodyToList(String responseBody) {
    List<dynamic> jsonList = jsonDecode(responseBody);
    List<Login> loginList = [];
    for (var jsonMap in jsonList) {
      loginList.add(Login.fromJson(jsonMap));
    }
    return loginList;
  }

  Future<Map<String, dynamic>> createAccont(String email, String senha) async {
    //Adiciona pepper a senha e gera o salt
    final String senhaPepper = senha + pepper;
    final nonce = generateRandomNonce();

    //criptografa a senha e transforma numa String
    final key =
        await pbkdf2.deriveKeyFromPassword(password: senhaPepper, nonce: nonce);
    final decoded = String.fromCharCodes(await key.extractBytes());

    //Transforma os dados da conta em json para mandar ao banco
    final data = {'email': email, 'senha': decoded, 'nonce': nonce};
    final String dataJson = jsonEncode(data);

    //Envia a requisição para criar a conta
    try {
      http.Response response = await client.post(
          Uri.parse('${getLoginConection()}Login/'),
          headers: {"Content-Type": 'application/json'},
          body: dataJson);
      if (response.statusCode != 201) {
        throw HttpException(
            'A requisição HTTP falhou. \n Body: ${response.body} \n StatusCode: ${response.statusCode}');
      }
      return {'bool': true};
    } catch (e) {
      return {'bool': false, 'e': e};
    }
  }

  List<int> generateRandomNonce() {
    List<int> nonce = [];
    //Gera uma lista de 5 inteiros diferentes
    for (var i = 0; i < 5; i++) {
      int value = Random().nextInt(51);
      if (nonce.contains(value)) {
        i--;
      } else {
        nonce.add(value);
      }
    }
    return nonce;
  }
}
