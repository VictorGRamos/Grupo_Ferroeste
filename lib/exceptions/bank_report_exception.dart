class ApiNameNotValid implements Exception{

  String? message;
  ApiNameNotValid({this.message});

}
class NoDataReceivedOnTables implements Exception{}