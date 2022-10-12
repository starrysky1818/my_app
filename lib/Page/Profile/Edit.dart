import 'package:flutter/material.dart';
import 'package:my_app/Page/Profile/accountPage.dart';
import 'package:my_app/Page/loginPage.dart';
import 'package:dio/dio.dart';
import 'package:my_app/Page/reward/reward_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/Page/Profile/information.dart';

const List<String> list = <String>['Secret', 'Male', 'Female'];
String Gender = "Secret";

class editPage extends StatefulWidget {
  @override
  _editPageState createState() => new _editPageState();
}
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      underline: Container(),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.white70,),
      dropdownColor: Color.fromRGBO(10,39,59,1),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          Gender = dropdownValue.toString();
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class _editPageState extends State<editPage> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(10,39,59,1),
        body:
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left:screenWidth*0.06,right: screenWidth*0.06),
                  child: new Container(
                    child: buildForm(),
                  ),
                ),
              ],
        )

    );
  }

  TextEditingController unameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController doublePwdController = new TextEditingController();
  GlobalKey < FormState > formKey = GlobalKey();
  String username = "";
  String age = "";
  late Response response;
  Dio dio = Dio();
  GetStorage box = GetStorage();

  bool _validateAndSaveForm() {
    final form = formKey.currentState!;
    if (form.validate()) {
      return true;
    }
    return false;
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              autofocus: false,
              controller: unameController,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "edit your name",
                labelStyle: const TextStyle(color: Colors.white),
                hintStyle: const TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.cyanAccent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(39,69,92,1),
                    width: 2.0,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white70,
              ),
              validator: (val)=> (val == null || val.trim().length < 3) ? "User name cannot less than 3": null,
              onSaved: (val)=> this.username = val!,
            ),
          ),

          Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              autofocus: false,
              controller: ageController,
              decoration: InputDecoration(
                labelText: "your age",
                hintText: "Your age",
                labelStyle: const TextStyle(color: Colors.white),
                hintStyle: const TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.cyanAccent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(39,69,92,1),
                    width: 2.0,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white70,
              ),
              obscureText: true,
              onSaved: (val)=> this.age = val!,
            ),
          ),

          Container(
            padding: EdgeInsets.all(8),
            width: screenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(39,69,92,1),width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
                color: Color.fromRGBO(10,39,59,1)
            ),
            child: DropdownButtonExample()
          ),

          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text("Finish",style: TextStyle(fontSize: 24)),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0)
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                    ),

                    onPressed: () async {
                      if(_validateAndSaveForm()){
                        formKey.currentState!.save();
                        if(true){
                          box.write('user', username.toString());
                          String User = box.read('user');
                          box.write(User+'Age', age);
                          box.write(box.read('user')+'Gender', Gender);
                          box.save();
                          //print(box.read(User+'Age'));
                          //print(box.read(User+'Gender'));
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Edit successful'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => {
                                    Navigator.pop(context, 'OK'),
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Info()),
                                    ),
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Info()),
                );
              },
              child: Container(
                width: screenWidth*0.6,
                padding: EdgeInsets.only(top: 38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

