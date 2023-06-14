import 'package:flutter/material.dart';

class BankTable extends StatelessWidget {
  const BankTable({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BuildDataTable(),
      );

  Widget BuildDataTable() {
    final columns = ['Data', 'Cliente'];

    return DataTable(columns: getColumns(columns), rows: getRows(),);
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String columns) {
      return DataColumn(label: Text(columns));
    }).toList();
  }

  List<DataRow> getRows() {
    final List<DataRow> rows = [
      const DataRow(cells: [DataCell(Text('a')), DataCell(Text('a'))]),
      const DataRow(cells: [DataCell(Text('a')), DataCell(Text('a'))]),
      const DataRow(cells: [DataCell(Text('a')), DataCell(Text('a'))]),
    ];
    return rows;
  }
}
