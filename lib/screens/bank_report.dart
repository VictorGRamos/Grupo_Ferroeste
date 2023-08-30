import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/components/bank_table.dart';
import 'package:grupo_ferroeste/components/sections/report_box.dart';
import 'package:grupo_ferroeste/data/database_dao.dart';
import 'package:grupo_ferroeste/helpers/formats.dart';
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
  DatabaseDao localDatabase = DatabaseDao();
  Future<List<Widget>>? widgetList;
  String latestUpdateIn =
      ''; //variavel pra guardar data do consumo da api (data das informações)

  //METODOS

  @override
  void initState() {
    super.initState();
    widgetList = buildWidgetList();
  }

  Future<List<Widget>> buildWidgetList() async {
    List<dynamic> bankDataTable = [];
    List<Widget> widgetList = [];

    //Preenche campo com data atual do consumo da api, se api der erro a data será substituida pela ultima data salva localmente
    if (latestUpdateIn.isEmpty) {
      latestUpdateIn = DataFormats().latestUpdate();
    }

    //Tenta pegar os dados da API, se falhar, pega os ultimos dados salvos localmente  
    try {
      bankDataTable = await service.getSapData(ApiNames.apiMobileBank);
    } catch (e) {
      //se API der erro, pega o ultimo registro local salvo
      List<Map<String, dynamic>> localRegister =
          await localDatabase.readLatestByApiName(ApiNames.apiMobileBank);

      bankDataTable = service.bodyToList(localRegister[0]['json']);
      setState(() {
        latestUpdateIn = localRegister[0]['date'];
      });
    }

    for (var index in bankDataTable) {
      widgetList.add(ReportBoxWithTitle(
          widget: BankTable(
            bankSaldo: index.saldo,
          ),
          title: index.title));
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(latestUpdateIn: latestUpdateIn),
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
                if (snapshot.data!.isNotEmpty) {
                  List<Widget> wList = snapshot.data!;
                  return Expanded(
                    child: ListView(
                      children: wList,
                    ),
                  );
                }
              }
              //TODO verificar snapshot.hasError == true, se tiver erro a api não funcionou. Melhorar tratativa
              //| Ideia 1 = Set State pra tentar novamente || voltar pra tela inicial quando ela existir
              //| Ideia 2 = Metodo POST pra enviar pro SAP um log de erro e tratar no sap
              //| Ideia 3 = adicionar timeout pra requisição 
              return InkWell(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.40,
                        bottom: MediaQuery.of(context).size.height * 0.45),
                    child: CircularProgressIndicator(
                        color: mainTheme.primaryColor,
                        backgroundColor:
                            MainThemeColors.circularProgressIndicator),
                  ),
                ),
                onTap: () => setState(
                  () {
                    widgetList = buildWidgetList();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
