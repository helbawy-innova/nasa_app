import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utility/app_widgets/svg_icon.dart';
import '../../../../utility/app_widgets/titled_widget.dart';
import '../../../../utility/colors/app_colors.dart';
import '../models/chart_data.dart';

class TotalEmissionCard extends StatelessWidget {
  const TotalEmissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(4, 5),
            )
          ],
        ),
        child: TitledWidget(
          title: 'Carbon Dioxide',
          titlePadding: const EdgeInsets.all(0),
          action: Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: MainThemeColors.primary.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  drawSvgIcon("calendar", width: 16,height: 16,iconColor: MainThemeColors.primary),
                  SizedBox(width: 4),
                  Text(
                    "Last 7 days",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: MainThemeColors.primary,
                    ),
                  ),
                ],
              )
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  SfCircularChart(

                    series: <CircularSeries>[
                      RadialBarSeries<ChartData,dynamic>(
                        maximumValue: 100,
                        dataSource: <ChartData>[
                          ChartData('Carbon Dioxide', 54, Colors.red),
                        ],
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        pointColorMapper: (ChartData data, _) => MainThemeColors.primary,
                        innerRadius: '90%',
                      ),
                    ],
                  ),
                  const Positioned.fill(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "54%",
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: MainThemeColors.primary,
                            ),
                          ),
                          Text(
                            "of total emissions",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MainThemeColors.grey1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
