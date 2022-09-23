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
      BarChartModel(month: "Oct", sleepDuration: 7, day:"",
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
        color: Colors.white,
        height: 5,
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _barChartList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: MediaQuery.of(context).size.height/ 2.3,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_barChartList[index].month,
                      style: TextStyle(
                          color: Colors.black, fontSize: 22,
                          fontWeight: FontWeight.bold)
                  ),
                ],
              ),
              Expanded( child: charts.BarChart(series, animate: true)),
            ],
          ),
        );
      },
    )
        : SizedBox();
  }
}


