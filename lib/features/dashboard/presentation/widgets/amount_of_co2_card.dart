import 'package:flutter/material.dart';

import '../../../../utility/app_widgets/svg_icon.dart';
import '../../../../utility/colors/app_colors.dart';

class AmountOfCo2Card extends StatelessWidget {
  const AmountOfCo2Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(4, 5),
        )
      ]),
      child: Row(
        children: [
          drawSvgIcon("co2", width: 32, height: 32),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amount of CO2", style: TextStyle(fontSize: 12, color: MainThemeColors.grey1)),
                Text(
                  "54",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: MainThemeColors.primary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
