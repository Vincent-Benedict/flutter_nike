import 'package:flutter/material.dart';
import 'package:myapp/views/pages/home.dart';
import 'package:myapp/views/pages/login.dart';
import 'package:myapp/globals/global.dart' as globals;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: globals.isDarkTheme$.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:
                  snapshot.data == true ? ThemeData.dark() : ThemeData.light(),
              home: LoginPage());
        });
  }
}
