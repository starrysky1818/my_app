import 'package:flutter/material.dart';
import 'package:my_app/Page/homePage.dart';

class MyFriends extends StatelessWidget {
  List<User> friends = [
    User(name: "Hari Prasad Chaudhary", accNumber: 12345),
    User(name:"David Mars", accNumber: 23456),
    User(name:"Aurn Thapa", accNumber: 34567),
    User(name: "John Bal", accNumber: 45678)
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
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
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
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Container(
                    width: screenWidth*0.5,
                    padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
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
              borderRadius: BorderRadius.all(Radius.circular(20)),
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
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "haha",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Visit'),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Colors.blueGrey,
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child:ElevatedButton(
                            onPressed: () {},
                            child: Text('Message'),
                            style: ElevatedButton.styleFrom(
                              //side:BorderSide(width:3, color:Color.fromRGBO(20,47,67,1)),
                              shape: StadiumBorder(),
                              primary: Colors.blueGrey,
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
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

class _MyFriends extends StatelessWidget {
  List<User> friends = [
    User(name: "Hari Prasad Chaudhary", accNumber: 12345),
    User(name:"David Mars", accNumber: 23456),
    User(name:"Aurn Thapa", accNumber: 34567),
    User(name: "John Bal", accNumber: 45678)
  ];

   Widget _mapWidget(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     return Container(
       width: screenWidth,
       height: screenWidth*0.5,
       margin: const EdgeInsets.all(10),
       padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
       decoration: BoxDecoration(
           color: const Color.fromRGBO(20,47,67,1),
           border: Border.all(color: const Color.fromRGBO(39,69,92,1)),
           borderRadius: const BorderRadius.all(Radius.circular(20))
       ),
       child: SingleChildScrollView(
         child: Column(
           children: [
             Expanded(
               child: ListView.builder(
                 itemCount: friends.length,
                 prototypeItem: ListTile(
                   title: Text("friends"),
                 ),
                 itemBuilder: (context, index) {
                   return Row(
                     children: [
                       ListTile(
                         title: Text(friends[index].name),
                       ),
                       Row(
                         children: [
                           ElevatedButton(
                             onPressed: () {},
                             child: Text('Visit'),
                             style: ElevatedButton.styleFrom(
                               shape: StadiumBorder(),
                               primary: Colors.blueGrey,
                               textStyle: TextStyle(
                                 fontSize: 20.0,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 3),
                             child:ElevatedButton(
                               onPressed: () {},
                               child: Text('Message'),
                               style: ElevatedButton.styleFrom(
                                 //side:BorderSide(width:3, color:Color.fromRGBO(20,47,67,1)),
                                 shape: StadiumBorder(),
                                 primary: Colors.blueGrey,
                                 textStyle: TextStyle(
                                   fontSize: 20.0,
                                   color: Colors.white,
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   );
                 },
               ),
             ),
           ],
         ),
       ),
     );
   }

 @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //top navigation bar
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
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
          Container(
            width: screenWidth,
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
          //_mapWidget(context),
          Container(
            width: screenWidth,
            height: screenWidth*0.5,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(20,47,67,1),
                border: Border.all(color: const Color.fromRGBO(39,69,92,1)),
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              children: friends.map((index){
                return Row(
                  children: [
                    ListTile(
                      title: Text(index.name),
                    ),
                    Row(
                      children: [
                       ElevatedButton(
                        onPressed: () {},
                        child: Text('Visit'),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.blueGrey,
                          textStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 3),
                         child:ElevatedButton(
                           onPressed: () {},
                           child: Text('Message'),
                           style: ElevatedButton.styleFrom(
                             shape: StadiumBorder(),
                             primary: Colors.blueGrey,
                             textStyle: TextStyle(
                               fontSize: 20.0,
                               color: Colors.white,
                             ),
                           ),  //style
                         ),
                       ),
                    ],
                   ),
                  ],
                 );
                }).toList(),
              ),
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
  User({required this.name, required this.accNumber});
}
