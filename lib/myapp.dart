import 'package:flutter/material.dart';
import 'package:looking4jobs/pages/auth.dart';
import 'package:looking4jobs/pages/myhomepage.dart';
import 'package:looking4jobs/scoped-models/main_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Color bgColor = const Color(0xFF07575B);

    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 0xFF07575B
        primaryColor: Color(0xFF66A5AD),
        backgroundColor: Color(0xFF66A5AD),
        bottomAppBarColor: Color(0xFF66A5AD),
        scaffoldBackgroundColor: Color(0xFF66A5AD),
        buttonColor:  Color(0xFF66A5AD),
        primaryColorLight: Colors.white,
        // accentColor: Colors.lightGreen
      ),
      title: 'looking4jobsinoman.com',
      home: MyHomePage(),
      routes: <String,WidgetBuilder>{
        // "/userpage":(BuildContext context)=>new Page(),
        "/loginpage":(BuildContext context)=>new AuthPage(),
        // "/signup":(BuildContext context)=>new SignUpPage()
      }
    ),);
  }
}