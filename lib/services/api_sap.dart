import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'http_interceptor.dart';

class SapService {
  static const String sapConection =
      'http://sap-qas-ecc01.ferroeste.com.br:8080/rest_ferroeste?sap-client=400';

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getSapConection() {
    return sapConection;
  }

  getSapData(String apiName) async {
    http.Response response = await client.post(Uri.parse(getSapConection()),
        headers: {"BUSINESS_OBJECT": apiName});
    if (response.statusCode != 200) {
      //TODO pegar objeto que fará as linhas da tabela e retornar um lista desse objeto
    }
  }
}
