import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/exceptions/bank_report_exception.dart';
import 'package:grupo_ferroeste/models/bank.dart';

import '../helpers/formats.dart';

class BankTable extends StatelessWidget {
  final List<Saldo> bankSaldo;

  late List<String> columns;

  double columnSpacing = 0;
  int columnsLenght = 0;
  bool isShortReport = true;

  BankTable({super.key, required this.bankSaldo});

  @override
  Widget build(BuildContext context) {
    defineReportType();
    return buildDataTable(context);
  }

  Widget buildDataTable(context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          horizontalMargin: 0,
          columnSpacing: columnSpacing,
          headingRowColor:
              MaterialStateProperty.resolveWith((states) => Colors.grey[850]),
          headingTextStyle: const TextStyle(fontSize: 16),
          columns: getColumns(context),
          rows: getRows(context),
        ),
      ),
    );
  }

  List<DataColumn> getColumns(context) {
    if (isShortReport == true) {
      return columns.map(
        (String columns) {
          return DataColumn(
              label: SizedBox(
                  width: getWidgetWidth(context) / columnsLenght,
                  child: Center(child: Text(columns))));
        },
      ).toList();
    } else {
      return columns.map(
        (String columns) {
          return DataColumn(
              label: SizedBox(
                  width: getWidgetWidth(context) / 3,
                  child: Center(child: Text(columns))));
        },
      ).toList();
    }
  }

  List<DataRow> getRows(context) {
    List<DataRow> rows = [];

    //Se tem apenas 2 colunas, é o primeiro modelo de relatorio
    if (isShortReport == true) {
      for (var index in bankSaldo) {
        rows.add(
          DataRow(
            cells: [
              DataCell(SizedBox(
                  width: getWidgetWidth(context) / columns.length,
                  child: Center(child: Text(index.nomeEmpresa!)))),
              DataCell(SizedBox(
                  width: getWidgetWidth(context) / columns.length,
                  child: Center(child: Text(DataFormats(valueFormat: index.saldo!).valueToUsd())))),
            ],
          ),
        );
      }
    } else {
      for (var index in bankSaldo) {
        rows.add(
          DataRow(
            cells: [
              DataCell(SizedBox(
                  width: getWidgetWidth(context) / 3,
                  child: Center(child: Text(DataFormats(dateString: index.data!).stringToDate())))),
              DataCell(SizedBox(
                  width: getWidgetWidth(context) / 3,
                  child: Center(child: Text(index.clientes!)))),
              DataCell(SizedBox(
                  width: getWidgetWidth(context) / 3,
                  child: Center(child: Text(DataFormats(valueFormat: index.valor!).valueToUsd())))),
              DataCell(SizedBox(
                  width: getWidgetWidth(context) / 3,
                  child: Center(child: Text(index.situacao!)))),
              DataCell(SizedBox(
                  width: getWidgetWidth(context) / 3,
                  child: Center(child: Text(DataFormats(valueFormat: index.saldo).valueToUsd())))),
            ],
          ),
        );
      }
    }
    return rows;
  }

  double getWidgetWidth(context) {
    double width = MediaQuery.of(context).size.width - 32; //32 é o padding
    return width;
  }

  void defineReportType() {
    if (bankSaldo[0].nomeEmpresa == null) {
      throw NoDataReceivedOnTables();
    } else if (bankSaldo[0].nomeEmpresa!.isNotEmpty) {
      columns = ['Empresa', 'Saldo'];
      columnsLenght = columns.length;
      isShortReport = true;
      columnSpacing = 0;
    } else {
      columns = ['Data', 'Cliente', 'Valor', 'Situação', 'Saldo'];
      isShortReport = false;
      columnSpacing = 20;
    }
  }
}
