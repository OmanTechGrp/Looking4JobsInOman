import 'package:flutter/material.dart';
import 'package:looking4jobs/myhomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Color bgColor = const Color(0xFF07575B);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //         locale: model.appLocal,
        // localizationsDelegates: [
        //   const TranslationsDelegate(),
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   const Locale('ar', ''), // Arabic
        //   const Locale('en', ''), // English
        // ],
        // primarySwatch: Colors.deepOrange,
        primaryColor: Color(0xFF07575B),
        backgroundColor: Color(0xFF07575B),
        bottomAppBarColor: Color(0xFF07575B),
        scaffoldBackgroundColor: Color(0xFF07575B),
        buttonColor:  Color(0xFF07575B),
        primaryColorLight: Colors.white,
        // accentColor: Colors.lightGreen
      ),
      title: 'looking4jobsinoman.com',
      home: MyHomePage(),
    );
  }
}