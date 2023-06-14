import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/components/sections/report_box.dart';
import 'package:grupo_ferroeste/themes/main_theme.dart';
import 'package:grupo_ferroeste/themes/theme_colors.dart';
import '../components/header.dart';
import 'package:grupo_ferroeste/components/bank_table.dart';

import '../services/api_sap.dart';

class BankReport extends StatefulWidget {
  BankReport({super.key});

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
    // widgetList.add(const Header());
    for (var index in bankDataTable) {
      widgetList.add(ReportBoxWithTitle(
          widget: Container(), height: 200, title: index.title));
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
                return const Center(child: CircularProgressIndicator()); 
              } else if (snapshot.hasData) {
                List<Widget> wList = snapshot.data!;
                return Expanded(child: ListView(children: wList,));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: mainTheme.primaryColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            boxShadow: const [BoxShadow(blurRadius: 5)]),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: mainTheme.primaryColor,
            fixedColor: MainThemeColors.bottomNavBarButtons,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_rounded),
                label: 'Saldo',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.zoom_out_rounded),
                label: 'Test',
              )
            ],
          ),
        ),
      ),
    );
  }
}
