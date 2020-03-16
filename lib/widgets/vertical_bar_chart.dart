import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VerticalBarChart extends StatelessWidget {
  final List<VerticalBarChartModel> dataList;

  VerticalBarChart(
    this.dataList,
  );

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(seriesList(), animate: true);
  }

  List<charts.Series<VerticalBarChartModel, String>> seriesList() {
    return [
      new charts.Series<VerticalBarChartModel, String>(
        id: 'Sales',
        domainFn: (VerticalBarChartModel sales, _) => sales.day,
        measureFn: (VerticalBarChartModel sales, _) => sales.measure,
        data: dataList,
      )
    ];
  }
}

class VerticalBarChartModel {
  final DateTime domain;
  final double measure;

  VerticalBarChartModel(this.domain, this.measure);

  String get day => DateFormat('EEE').format(domain);
}
