import 'dart:convert';
import 'dart:io';
import 'package:grupo_ferroeste/data/database_dao.dart';
import 'package:grupo_ferroeste/helpers/formats.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import '../exceptions/bank_report_exception.dart';
import 'http_interceptor.dart';
import 'package:grupo_ferroeste/models/bank.dart';

class SapService {
  static const String sapConection =
      'http://sap-qas-ecc01.ferroeste.com.br:8080/rest_ferroeste?sap-client=400';

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  DatabaseDao localDatabase = DatabaseDao();

  String getSapConection() {
    return sapConection;
  }

  Future<List<dynamic>> getSapData(String apiName) async {
    http.Response response = await client.post(Uri.parse(getSapConection()),
        headers: {"BUSINESS_OBJECT": apiName});
    if (response.statusCode != 200) {
      throw HttpException(
          'A requisição HTTP falhou. \n Body: ${response.body} \n StatusCode: ${response.statusCode}');
    }

    switch (apiName) {
      case ApiNames.apiMobileBank:
        List<Bank> bankList = bodyToList(response.body);
        await localDatabase.save(
            DataFormats().latestUpdate(), response.body, apiName);
        return bankList;
      default:
        throw ApiNameNotValid(message: apiName);
    }
  }

  List<Bank> bodyToList(String responseBody) {
    List<dynamic> jsonList = jsonDecode(responseBody);
    List<Bank> bankList = [];
    for (var jsonMap in jsonList) {
      bankList.add(Bank.fromJson(jsonMap));
    }
    return bankList;
  }
}

class ApiNames {
  static const String apiMobileBank = 'APIMOBILE_BANK';


}