import 'package:flutter/material.dart';
import 'package:my_app/Bottom.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:my_app/bar_chart_model.dart';
import 'package:my_app/bar_chart_graph.dart';

//Demi's code

class MySummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            GestureDetector(
            onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
                );
                },
        child: Container(
          alignment: Alignment(-1,0),
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(20.0, 27.0, 20.0, 27.0),
          color: const Color.fromRGBO(10,39,59,1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                  Icons.chevron_left,
                  color: Colors.white
              ),
            ],
          ),
        )
    ),
    Expanded(
        child: ListView(
          children: <Widget> [
            Container(
              width: screenWidth,
              height: screenHeight * 0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('images/sleep_trend_bar.png'),
                ),
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.3,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 13.0),
              child: Card(
                color: const Color.fromRGBO(20,47,67,1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 17.0, bottom: 5.0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(13.0, 1.0, 13.0, 1.0),
                        child: Row(
                          children: [
                            const Text("Avg.Sleep Duration",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Inter')),
                            const Text(":",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'Inter'),
                            ),
                            SizedBox(width: 60),
                            const Text("7.23 hours",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Inter'
                            ),)
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white38,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(13.0, 1.0, 13.0, 1.0),
                        child: Row(
                          children: [
                            const Text("Daily Sleep Debt",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,),
                              textAlign: TextAlign.left,),
                            const Text(":",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Inter'),
                            ),
                            SizedBox(width: 85),
                            const Text("0.77 hours",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Inter'
                              ),)
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white38,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(13.0, 1.0, 13.0, 1.0),
                        child: Row(
                          children: [
                            const Text("Sleep Quality",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,),
                              textAlign: TextAlign.left,),
                            const Text(":",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Inter'),
                            ),
                            SizedBox(width: 160),
                            const Text("Good",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Inter'
                              ),)
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white38,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                ),
              ),
            ) ,
            Container(
                width: screenWidth,
                height: screenHeight * 0.3,
                margin: const EdgeInsets.all(10),
                padding: new EdgeInsets.fromLTRB(5, 0.0, 5.0, 0.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(20,47,67,1),
                    border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: BarChart(
                )
            ),
          ],
        ),
    )
      ],
    ),
        backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}

class BarChart extends StatefulWidget {
  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {

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

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              BarChartGraph(data: data),
            ],
          ),

        ),
      );
  }
}