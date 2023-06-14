
class Bank {
  String title = '';
  List<Saldo> saldo = [];

  Bank({required this.title, required this.saldo});

  factory Bank.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson['SALDO'] as List;
    List<Saldo> saldoList = list.map((e) => Saldo.fromJson(e)).toList(); 

    return Bank(
      title: parsedJson['TITLE'],
      saldo: saldoList,
    );
  }
}

class Saldo {
  final String? data;
  final String? clientes;
  final double? valor;
  final String? situacao;
  final String? nomeEmpresa;
  final double? saldo;

  Saldo(
      {this.data,
      this.clientes,
      this.valor,
      this.situacao,
      this.nomeEmpresa,
      this.saldo});

  factory Saldo.fromJson(Map<String, dynamic> parsedJson) {
    return Saldo(
      data: parsedJson['DATA'],
      clientes: parsedJson['CLIENTES'],
      valor: parsedJson['VALOR'],
      situacao: parsedJson['SITUACAO'],
      nomeEmpresa: parsedJson['NOME_EMPR'],
      saldo: parsedJson['SALDO'],
    );
  }
}
