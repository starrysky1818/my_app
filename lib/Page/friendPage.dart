import 'package:flutter/material.dart';
import 'package:my_app/Page/homePage.dart';
import 'package:my_app/Page/searchFriends.dart';

class _MyFriends extends StatelessWidget {
  List<User> friends = [
    User(name: "Hari Prasad Chaudhary", accNumber: 12345, password: "ss123"),
    User(name:"David Mars", accNumber: 23456, password: "ss123"),
    User(name:"Aurn Thapa", accNumber: 34567, password: "ss123"),
    User(name: "John Bal", accNumber: 45678, password: "ss123")
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //top navigation bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Container(
                    width: screenWidth*0.5,
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
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
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => searchFriends()),
                    );
                  },
                  child: Container(
                    width: screenWidth*0.5,
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
                    color: const Color.fromRGBO(10,39,59,1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                            Icons.add,
                            color: Colors.white
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
          Container(
            width: screenWidth,
            height: screenWidth * 0.42,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/friends.png'),
              ),
            ),
          ),
          Container(
            width: screenWidth,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(20,47,67,1),
                border: Border.all(color: const Color.fromRGBO(39,69,92,1)),
                borderRadius: const BorderRadius.all(Radius.circular(35))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "haha",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 12.0),
                            shape: const StadiumBorder(),
                            primary: Colors.blueGrey,
                            textStyle: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          child: const Text('Visit'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child:ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              shape: const StadiumBorder(),
                              primary: Colors.blueGrey,
                              textStyle: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            child: const Text('Message'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}

class MyFriends extends StatelessWidget {
  List<User> friends = [
    User(name: "Hari Prasad Chaudhary", accNumber: 12345, password: "ss123"),
    User(name:"David Mars", accNumber: 23456, password: "ss123"),
    User(name:"Aurn Thapa", accNumber: 34567, password: "ss123"),
    User(name: "John Bal", accNumber: 45678, password: "ss123")
  ];

   Widget _mapWidget() {
     //double screenWidth = MediaQuery.of(context).size.width;
     return Column(
           children: [
             Expanded(
               child: ListView.separated(
                 scrollDirection: Axis.vertical,
                 shrinkWrap: true,
                 itemCount: friends.length,
                 itemBuilder: (context, index) {
                   return
                       ListTile(
                         title: Text(
                             friends[index].name,
                           style: TextStyle(color: Colors.white, fontSize: 18.0),
                         ),
                         trailing: Wrap(
                           children :<Widget> [
                             ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                                 padding: const EdgeInsets.fromLTRB(25.0, 12.0, 25.0, 12.0),
                                 shape: const StadiumBorder(),
                                 primary: Colors.blueGrey,
                                 textStyle: const TextStyle(
                                   fontSize: 18.0,
                                   color: Colors.white,
                                 ),
                               ),
                               child: const Text('Visit'),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 6),
                               child:ElevatedButton(
                                 onPressed: () {},
                                 style: ElevatedButton.styleFrom(
                                   padding: const EdgeInsets.all(12),
                                   shape: const StadiumBorder(),
                                   primary: Colors.blueGrey,
                                   textStyle: const TextStyle(
                                     fontSize: 18.0,
                                     color: Colors.white,
                                   ),
                                 ),
                                 child: const Text('Message'),
                               ),
                             ),
                           ],
                         )
                       );
                 },
                 separatorBuilder: (context, index) {
                   return Divider(
                     color: Colors.white12,
                     indent: 10,
                     endIndent: 10,
                   );
                 },
               ),
             ),
           ],
     );
   }

 @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          //top navigation bar
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Container(
                width: screenWidth*0.5,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
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
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchFriends()),
                );
              },
              child: Container(
                width: screenWidth*0.5,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
                color: const Color.fromRGBO(10,39,59,1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                        Icons.add,
                        color: Colors.white
                    ),
                  ],
                ),
              )
          ),
          ],),
          const Divider(
            color: Colors.white12,
            indent: 30,
            endIndent: 30,
          ),
          Container(
            width: screenWidth*0.97,
            height: screenWidth * 0.42,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/friends.png'),
              ),
            ),
          ),

          //friends listView
          Container(
            width: screenWidth,
            height: screenWidth*0.6,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(20,47,67,1),
                border: Border.all(color: const Color.fromRGBO(39,69,92,1)),
                borderRadius: const BorderRadius.all(Radius.circular(30))
            ),
            child: _mapWidget(),
            ),
         ],
      ),
      backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}

class User{
  String name;
  int accNumber;
  String password;
  List<User> users = <User>[];

  User({required this.name, required this.accNumber, required this.password});

  void visit(String name, String password) {
    for (var item in users) {
      if((item.name == name) && (item.password == password)) {
        return item.getPlanet();
      }
    }
  }

  void getPlanet() {}
}
