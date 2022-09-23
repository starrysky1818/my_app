import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:my_app/bar_chart_model.dart';
import 'bar_chart_model.dart';

// "Demi's code"
class BarChartGraph extends StatefulWidget {
  final List<BarChartModel> data;

  const BarChartGraph({required this.data});

  @override
  _BarChartGraphState createState() => _BarChartGraphState();
}

class _BarChartGraphState extends State<BarChartGraph> {
  late List<BarChartModel> _barChartList;

  @override
  void initState() {
    super.initState();
    _barChartList = [
      BarChartModel(month: "", sleepDuration: 7, day:"",
          color: charts.ColorUtil.fromDartColor
        (Colors.white70)),
    ];
  }

  @override
  Widget build(BuildContext context) {

    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
          id: "Sleep Statistics",
          data: widget.data,
          domainFn: (BarChartModel series, _) => series.day,
          measureFn: (BarChartModel series, _) => series.sleepDuration,
          colorFn: (BarChartModel series, _) => series.color),
    ];

    return _buildSleepDurationList(series);

  }

  Widget _buildSleepDurationList(series) {
    return _barChartList != null
        ? ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: Colors.white24,
        height: 3,
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _barChartList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: MediaQuery.of(context).size.height/ 4,
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_barChartList[index].month,
                      style: TextStyle(
                          color: Colors.white, fontSize: 22,
                          fontWeight: FontWeight.bold)
                  ),
                ],
              ),
              Expanded( child: charts.BarChart(series, animate: true,
                domainAxis: new charts.OrdinalAxisSpec(
                    renderSpec: new charts.SmallTickRendererSpec(
                      // Tick and Label styling here.
                        labelStyle: new charts.TextStyleSpec(
                            fontSize: 14, // size in Pts.
                            color: charts.MaterialPalette.white),
                        // Change the line colors to match text color.
                        lineStyle: new charts.LineStyleSpec(
                            color: charts.MaterialPalette.white))),
                /// Assign a custom style for the measure axis.
                primaryMeasureAxis: new charts.NumericAxisSpec(
                    renderSpec: new charts.GridlineRendererSpec(
                      // Tick and Label styling here.
                        labelStyle: new charts.TextStyleSpec(
                            fontSize: 14, // size in Pts.
                            color: charts.MaterialPalette.white),
                        // Change the line colors to match text color.
                        lineStyle: new charts.LineStyleSpec(
                            color: charts.MaterialPalette.white))),
              ),
              ),
            ],
          ),
        );
      },
    )
        : SizedBox();
  }
}


