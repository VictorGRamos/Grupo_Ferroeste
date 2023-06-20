import 'package:intl/intl.dart';

class DataFormats {
  String? dateString;
  double? valueFormat;

  var numberFormat = NumberFormat.currency(locale: 'pt-BR', symbol: 'USD');

  DataFormats({this.dateString, this.valueFormat});

  String stringToDate() {
    if (dateString != null) {
      // formato enviado pelo SAP = YYYY-MM-DD
      String ano = dateString!.substring(0, 4);
      String mes = dateString!.substring(5, 7);
      String dia = dateString!.substring(8, 10);
      String dataBR = '$dia/$mes/$ano';
      return dataBR;
    } else {
      return '00/00/0000';
    }
  }

  String valueToUsd() {
    String currency = numberFormat.format(valueFormat);
    return currency;
  }

  String latestUpdate() {

    String dateNow = DateTime.now().subtract(const Duration(hours: 3)).toString();

    String latestUpdate = '${dateNow.substring(8, 10)}'
        '/'
        '${dateNow.substring(5, 7)}'
        ' às '
        '${dateNow.substring(11, 13)}'
        ':'
        '${dateNow.substring(14, 16)}';

    return latestUpdate;
  }
}
