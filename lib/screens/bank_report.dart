import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/components/sections/report_box.dart';
import 'package:grupo_ferroeste/themes/main_theme.dart';
import 'package:grupo_ferroeste/themes/theme_colors.dart';
import '../components/header.dart';

class BankReport extends StatelessWidget {
  const BankReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Header(),
          ReportBoxWithTitle(
            widget: Container(),
            height: 400,
            title: 'Banco do Brasil - Mercado Externo',
          ),
          ReportBoxWithTitle(
            widget: Container(),
            height: 140,
            title: 'Itáu Nassau - Mercado Externo',
          ),
          ReportBoxWithTitle(
            widget: Container(),
            height: 140,
            title: 'Banco do Brasil - Nova York',
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

// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 