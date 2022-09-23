import 'package:flutter/material.dart';
import 'package:my_app/Page/homePage.dart';

class MySummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            GestureDetector(
            onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
                );
                },
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
          color: Color.fromRGBO(10,39,59,1),
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
    Container(
      width: screenWidth,
      height: screenWidth * 0.3,
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
      height: screenWidth * 0.4,
      decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 13.0),
      child: Card(
        color: const Color.fromRGBO(20,47,67,1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 22.0, bottom: 8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(13.0, 2.0, 13.0, 2.0),
                child: Text("Avg.Sleep Duration",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,),
                  textAlign: TextAlign.left,),
                ),
              ),
              // child: Text("Avg. Sleep Duration",
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20.0,),
              //     textAlign: TextAlign.end,),
            Divider(
              color: Colors.white38,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    ) ,
        ],
      ),
      backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}