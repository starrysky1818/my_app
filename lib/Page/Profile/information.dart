import 'package:flutter/material.dart';
import 'package:my_app/Page/Profile/body.dart';
import 'package:my_app/Page/Profile/accountPage.dart';
import 'package:my_app/Page/Profile/profile_pic.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/Page/Profile/Edit.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    GetStorage box = GetStorage();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyAccount()),
                );
              },
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                color: const Color.fromRGBO(10, 39, 59, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.chevron_left, color: Colors.white),
                  ],
                ),
              )),
          Container(
              width: screenWidth,
              margin: const EdgeInsets.all(10),
              padding: new EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(20,47,67,1),
                  border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text("Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0),
                  ),
                  SizedBox(width: 75),
                  Text(box.read("user"),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0),
                  ),
                ],
              ),
          ),
          SizedBox(height: 10),
          Container(
              width: screenWidth,
              margin: const EdgeInsets.all(10),
              padding: new EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(20,47,67,1),
                  border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text("Account Number",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0),
                  ),
                  SizedBox(width: 75),
                  Text("100099993",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0),
                  ),
                ],
              ),
          ),
          SizedBox(height: 10),
          Container(
            width: screenWidth,
            margin: const EdgeInsets.all(10),
            padding: new EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Text("Age",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0),
                ),
                SizedBox(width: 75),
                Text("25",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: screenWidth,
            margin: const EdgeInsets.all(10),
            padding: new EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Text("Gender",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0),
                ),
                SizedBox(width: 75),
                Text("Male",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child:
            Expanded(
              child: Container(
                width: screenWidth*0.5,
                child: ElevatedButton(
                  child: Text("Edit",style: TextStyle(fontSize: 24)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => editPage()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(10, 39, 59, 1),
    );
  }
}