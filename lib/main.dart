import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'Login.dart';
import 'tabbed.dart';
import 'Store.dart';
import 'DBHelper.dart';

bool res;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  res = _preferences.getBool("login");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: res == true ? "/welcome" : "/login",
      routes: {
        '/login': (context) => Login(),
        "/welcome": (context) => tabbed(),
      },
    );
  }
}
