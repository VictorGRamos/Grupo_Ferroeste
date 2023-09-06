import 'dart:convert';
import 'dart:io';
import '../models/login.dart';
import 'http_interceptor.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static const String loginApiConection = 'http://192.168.0.224:8000/';

  http.Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getLoginConection(){
    return loginApiConection;
  }  

  Future<List<dynamic>> getAccount(String email) async{
    String apiUrl = '${getLoginConection()}Login?email=$email';
    http.Response? response = await client.get(Uri.parse(apiUrl), headers: {"Content-Type": 'application/json'}, );

    if (response.statusCode != 200) {
      throw HttpException(
          'A requisição HTTP falhou. \n Body: ${response.body} \n StatusCode: ${response.statusCode}');
    }
    //TODO testar oque vem no body em requisições vazias (email inexistente)
    return bodyToList(response.body);

  }  

  Future<bool> checkAccountExist(String email) async{
    var listAccount = [];
    listAccount = await getAccount(email);
    if (listAccount.isEmpty) {
      return false;
    }
    return true;
  }

  List<Login> bodyToList(String responseBody) {
    List<dynamic> jsonList = jsonDecode(responseBody);
    List<Login> loginList = [];
    for (var jsonMap in jsonList) {
      loginList.add(Login.fromJson(jsonMap));
    }
    return loginList;
  }

  void createAccont(){
    
  }

}
