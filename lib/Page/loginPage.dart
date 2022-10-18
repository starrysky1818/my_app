import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Bottom.dart';
import 'package:dio/dio.dart';
import 'package:my_app/Page/signinPage.dart';
import 'package:get_storage/get_storage.dart';


class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState() => new _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10,39,59,1),
      body: ListView (
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: screenHeight * 0.5,
                alignment:Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/login.png'),
                  ),
                  color: Color.fromRGBO(10,39,59,1),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left:screenWidth*0.06,right: screenWidth*0.06),
                child: new Container(
                  child: buildForm(),
                ),
              ),
            ],
          ),
        ],
      )

    );
  }

  TextEditingController unameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  GlobalKey < FormState > formKey = GlobalKey();
  String username = "";
  String password = "";
  late Response response;
  Dio dio = Dio();
  final GetStorage box = GetStorage();

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
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
              ],
              decoration: InputDecoration(
                labelText: "User Name",
                hintText: "Your Name, Only text allowed",
                labelStyle: const TextStyle(color: Colors.white),
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.person, color: Colors.cyanAccent,),
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
                color: Colors.white,
              ),
              validator: (val)=> (val == null || val.trim().length < 4) ? "User name cannot less than 3": null,
              onSaved: (val)=> this.username = val!,
            ),
          ),

          Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              autofocus: false,
              controller: pwdController,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Your Password",
                labelStyle: const TextStyle(color: Colors.white),
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.lock, color: Colors.cyanAccent,),
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
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
              ),
              validator: (val)=> (val == null || val.trim().length < 5) ? "password cannot less than 5": null,
              onSaved: (val)=> this.password = val!,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text("Log in",style: TextStyle(fontSize: 24)),
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
                        // connect to back-end
                         response = await dio.get('http://172.20.10.2:8080/user/logInCheck', queryParameters: {'password': password,
                          'userName': username});
                        // if do not have back-end, change if loop conditions to true
                        if(response.data/*true*/){
                          box.write('user', username.toString());
                          box.write(username.toString()+'Age', 'Secret');
                          box.write(username.toString()+'Gender', 'Secret');
                          box.save();
                          print(box.read('user'));
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Welcome to sleep planet'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => {
                                    Navigator.pop(context, 'OK'),
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
                                    ),
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Failed to login'),
                                  content: const Text('Please check your account and password'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
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
                  MaterialPageRoute(builder: (context) => SigninHomePage()),
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
                        'Sign up now',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
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

