import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/Page/loginPage.dart';
import 'package:dio/dio.dart';

class SigninHomePage extends StatefulWidget {
  @override
  _SigninHomePageState createState() => new _SigninHomePageState();
}

class _SigninHomePageState extends State<SigninHomePage> {
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
                  height: screenHeight * 0.45,
                  alignment:Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/SignIn.png'),
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
  TextEditingController doublePwdController = new TextEditingController();
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

  bool checkSignIn() {
    String ?user = box.read(username+'Name');
    if (user != null){
      print(user);
      return false;
    }
    box.write(username+'Name', password);
    return true;
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
                labelText: "User Name",
                hintText: "e-mail address",
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
              style: TextStyle(
                color: Colors.white70,
              ),
              obscureText: true,
              validator: (val)=> (val == null || val.trim().length < 5) ? "password cannot less than 5": null,
              onSaved: (val)=> this.password = val!,
            ),
          ),

          Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              autofocus: false,
              controller: doublePwdController,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Inter your password again",
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
              style: TextStyle(
                color: Colors.white70,
              ),
              obscureText: true,
              validator: (val)=> (val == null || val.compareTo(pwdController.text)!=0)
                  ? "The password is different from the above": null,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text("Sign in",style: TextStyle(fontSize: 24)),
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
                        // response = await dio.get('http://172.20.10.2:8080/user/signUpCheck', queryParameters: {'password': password,
                        //  'userName': username});
                        // if do not have back-end, change if loop conditions to true
                        if(/* response.data */checkSignIn()){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Sign up successful'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => {
                                    Navigator.pop(context, 'OK'),
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => LoginHomePage()),
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
                              title: const Text('Failed to Sign up'),
                              content: const Text('Name has been used'),
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
                  MaterialPageRoute(builder: (context) => LoginHomePage()),
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

