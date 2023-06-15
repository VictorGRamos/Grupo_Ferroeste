import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/components/bank_table.dart';
import 'package:grupo_ferroeste/components/sections/report_box.dart';
import 'package:grupo_ferroeste/themes/main_theme.dart';
import 'package:grupo_ferroeste/themes/theme_colors.dart';
import '../components/header.dart';
import '../services/api_sap.dart';

class BankReport extends StatefulWidget {
  const BankReport({super.key});

  @override
  State<BankReport> createState() => _BankReportState();
}

class _BankReportState extends State<BankReport> {
  //ATRIBUTOS E VARIAVEIS

  SapService service = SapService();
  Future<List<Widget>>? widgetList;

  //METODOS

  @override
  void initState() {
    super.initState();
    widgetList = buildWidgetList();
  }

  Future<List<Widget>> buildWidgetList() async {
    List<dynamic> bankDataTable = [];
    List<Widget> widgetList = [];

    bankDataTable = await service.getSapData("APIMOBILE_BANK");
    for (var index in bankDataTable) {
      widgetList.add(ReportBoxWithTitle(
          widget: BankTable(bankSaldo: index.saldo,), title: index.title));
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          FutureBuilder(
            future: widgetList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.40),
                  child: CircularProgressIndicator(
                    color: mainTheme.primaryColor,
                    backgroundColor: MainThemeColors.circularProgressIndicator,
                  ),
                );
              } else if (snapshot.hasData) {
                List<Widget> wList = snapshot.data!;
                return Expanded(
                  child: ListView(
                    children: wList,
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.40),
                child: CircularProgressIndicator(
                  color: mainTheme.primaryColor,
                  backgroundColor: MainThemeColors.circularProgressIndicator,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
