
import 'package:flutter/material.dart';
import 'package:my_app/Bottom.dart';
import 'package:my_app/top.dart';
import 'package:my_app/Page/loginPage.dart';
import 'package:my_app/Page/timeSetting.dart';
import 'package:my_app/Page/homePage.dart';
import 'package:my_app/Page/setting.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/Page/reward/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Application.initAppSetup();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RestartWidget(
      child: MaterialApp(
        home: LoginHomePage()
        ),
    );
  }
}
class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({Key? key, required this.child})
      : assert(child != null),
        super(key: key);

  static restartApp(BuildContext context) {
    final _RestartWidgetState? state =
    context.findAncestorStateOfType<_RestartWidgetState>();
    state?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}