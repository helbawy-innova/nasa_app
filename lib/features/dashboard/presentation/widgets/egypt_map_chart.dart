import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';


class MapChartModel {
  MapChartModel(this.name, this.value);

  String name;
  String value;
}
///
///  ## Countries:
///  Copy the names as you see in description


class EgyptMapChart extends StatefulWidget {
  const EgyptMapChart({super.key, required this.chartData});
  final List<MapChartModel> chartData;

  @override
  State<EgyptMapChart> createState() => _EgyptMapChartState();
}

class _EgyptMapChartState extends State<EgyptMapChart> {
  final List<Color> colors = [
    Color(0xffFFC107),
    Color(0xffE91E63),
    Color(0xff2196F3),
    Color(0xff673AB7),
    Color(0xff3F51B5),
    Color(0xff009688),
    Color(0xffFF5722),
    Color(0xff795548),
    Color(0xff9C27B0),
    Color(0xff00BCD4),
    Color(0xff4CAF50),
    Color(0xffFFEB3B),
    Color(0xffFF9800),
    Color(0xff607D8B),
    Color(0xff9E9E9E),
    Color(0xff03A9F4),
    Color(0xff8BC34A),
    Color(0xffCDDC39),
  ];

  late MapShapeSource _dataSource ;

  @override
  void initState() {
    _dataSource = MapShapeSource.asset(
      "assets/json/eg.json",
      shapeDataField: 'name',
      dataCount: widget.chartData.length,
      primaryValueMapper: (int index) => widget.chartData[index].name,
      dataLabelMapper: null,//(int index) => widget.chartData[index].value,
      shapeColorValueMapper: (int index) => colors[index % 17].withOpacity(.6),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfMaps(
          layers: <MapShapeLayer>[
            MapShapeLayer(
              source: _dataSource,
              showDataLabels: false,
              strokeColor: Colors.black,
              strokeWidth: 1,
              color: Colors.transparent,
              dataLabelSettings: MapDataLabelSettings(
                textStyle: TextStyle(color: Colors.transparent, fontWeight: FontWeight.w300, fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(widget.chartData.length, (index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors[index % 17],
                ),
              ),
              SizedBox(width: 4),
              Text(
                widget.chartData[index].name.toLowerCase(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
              ),
              SizedBox(width: 4),
              Text(
                widget.chartData[index].value,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
              ),

            ],
          ),),
        ),
      ],
    );
  }
}
