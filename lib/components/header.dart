import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/themes/main_theme.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        alignment: AlignmentDirectional.center,
        width: double.infinity,
        height:
            MediaQuery.of(context).size.height * 0.08, //10% do tamanho da tela
        decoration: BoxDecoration(
          color: mainTheme.primaryColor,
          boxShadow: const [BoxShadow(blurRadius: 5),],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('Última atualização em:'),
                  Text('29/05 às 11:41')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
