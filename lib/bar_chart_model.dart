import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

// Demi's code

class BarChartModel {
  String month;
  String day;
  double sleepDuration;
  final charts.Color color;

  BarChartModel({required this.month,
    required this.day, required this.sleepDuration,
    required this.color,}
      );
}

final List<BarChartModel> data = [
  BarChartModel(
    day: "Mon",
    sleepDuration: 6.5,
    color: charts.ColorUtil.fromDartColor
      (Colors.white70), month: '',
  ),
  BarChartModel(
    day: "Tues",
    sleepDuration: 7,
    color: charts.ColorUtil.fromDartColor
      (Colors.white70), month: '',
  ),
  BarChartModel(
    day: "Wed",
    sleepDuration: 8,
    color: charts.ColorUtil.fromDartColor
      (Colors.white70), month: '',
  ),
  BarChartModel(
    day: "Thurs",
    sleepDuration: 7.5,
    color: charts.ColorUtil.fromDartColor
      (Colors.white70), month: '',
  ),
  BarChartModel(
    day: "Fri",
    sleepDuration: 6,
    color: charts.ColorUtil.fromDartColor
      (Colors.white70), month: '',
  ),
  BarChartModel(
    day: "Sat",
    sleepDuration: 7,
    color: charts.ColorUtil.fromDartColor
      (Colors.white70), month: '',
  ),
  BarChartModel(
    day: "Sun",
    sleepDuration: 8,
    color: charts.ColorUtil.fromDartColor
      (Colors.white70), month: '',
  ),
];