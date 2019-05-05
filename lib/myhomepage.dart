import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'vacancies.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> vacancyDetailsList = [];
  String errorMessage = 'الرجاء الضغط على التحميل';
  bool isSuccess;

  int _selectedIndex = 0;
  final _widgetOptions = [
    Text('الوظائف المؤقتة'),
    Text('الوظائف الدائمة'),
    Text('إعلانات الباحثين'),
    Text('وظائف بعقد')
  ];

  void _fetchDataFromAPI() {
    var url =
        "https://www.manpower.gov.om/api/api/Vacancy?PageSize=9999&CurrentPage=1&EducationCode=0&RefCode=0&OccupationName=&RegCode=0&WilayatCode=0&SponsorName=&Gender=ANY&LanguageID=1";
    http.get(url).then((http.Response res) {
      final Map<String, dynamic> responsData = jsonDecode(res.body);
      isSuccess = responsData['IsSuccess'];
      if (isSuccess) {
        print('request Sucess');
        setState(() {
          vacancyDetailsList = responsData['RequestVacancyDetailsList'];
        });
      } else {
        print('request Fail');
        print(responsData['ErrorMessage']);
        setState(() {
          errorMessage = responsData['ErrorMessage'];
        });
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // final Color bgColor = const Color(0xFF07575B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('البحث عن وظيفة'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("إضافة إعلان"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("التسجيل"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("تسجيل الدخول"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
              child: Image.asset(
            'logo/logo.png',
            height: 100.0,
          )),
          Expanded(
            child: Vacancies(
              vacanciesList: vacancyDetailsList,
              errorMessage: errorMessage,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.av_timer,
              color: Theme.of(context).backgroundColor,
            ),
            title: Text('الوظائف المؤقتة'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.gps_fixed,
              color: Theme.of(context).backgroundColor,
            ),
            title: Text('الوظائف الدائمة'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).backgroundColor,
            ),
            title: Text('إعلانات الباحثين'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_contact_calendar,
              color: Theme.of(context).backgroundColor,
            ),
            title: Text('وظائف بعقد'),
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        selectedItemColor: Colors.black,
        // fixedColor: Colors.deepPurple,

        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchDataFromAPI,
        tooltip: 'Get Data',
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
