import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/themes/theme_colors.dart';

class ReportBoxWithTitle extends StatelessWidget {
  final Widget widget;
  final String title;

  const ReportBoxWithTitle(
      {super.key,
      required this.widget,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: MainThemeColors.reportBox,
              boxShadow: const [BoxShadow(blurRadius: 6)],
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.maxFinite,
            child: widget,
          ),
        ],
      ),
    );
  }
}
