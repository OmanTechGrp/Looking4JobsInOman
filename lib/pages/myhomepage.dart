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
    Text(
      'وظائف معروضة  من قبل وزارة القوى العاملة ',
      style: TextStyle(color: Colors.white70),
    ),
    Text(
      'وظائف بدوام جزئى',
      style: TextStyle(color: Colors.white70),
    ),
    Text(
      'وظائف بعقد مؤقت',
      style: TextStyle(color: Colors.white70),
    ),
    Text(
      'وظائف بعقد دائم',
      style: TextStyle(color: Colors.white70),
    ),
    Text(
      'إعلانات الباحثين',
      style: TextStyle(color: Colors.white70),
    )
  ];

  bool isLoading = false;

  Widget headerTitle;

  void _fetchDataFromAPI() {
    setState(() {
      headerTitle = _widgetOptions[_selectedIndex];
      isLoading = true;
    });
    var url =
        "https://www.manpower.gov.om/api/api/Vacancy?PageSize=9999&CurrentPage=1&EducationCode=0&RefCode=0&OccupationName=&RegCode=0&WilayatCode=0&SponsorName=&Gender=ANY&LanguageID=1";
    http.get(url).then((http.Response res) {
      final Map<String, dynamic> responsData = jsonDecode(res.body);
      isSuccess = responsData['IsSuccess'];
      if (isSuccess) {
        print('request Sucess');
        setState(() {
          isLoading = false;
          vacancyDetailsList = responsData['RequestVacancyDetailsList'];
        });
      } else {
        print('request Fail');
        print(responsData['ErrorMessage']);
        setState(() {
          isLoading = false;
          errorMessage = responsData['ErrorMessage'];
        });
      }
    });
  }

  void _partTime() {
    setState(() {
      headerTitle = _widgetOptions[_selectedIndex];
    });
  }

  void _tempContract() {
    setState(() {
      headerTitle = _widgetOptions[_selectedIndex];
    });
  }

  void _perContract() {
    setState(() {
      headerTitle = _widgetOptions[_selectedIndex];
    });
  }

  void _jobSercher() {
    setState(() {
      headerTitle = _widgetOptions[_selectedIndex];
    });
  }

  void _refreshData() {
    switch (_selectedIndex) {
      case 0:
        {
          print("Excellent");
          _fetchDataFromAPI();
        }
        break;

      case 1:
        {
          print("Good");
        }
        break;

      case 2:
        {
          print("Fair");
        }
        break;

      case 3:
        {
          print("Poor");
        }
        break;

      case 4:
        {
          print("Fail");
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

    void _onItemTapped(int index) {
    if (!isLoading) {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          {
            print("Excellent");
            _fetchDataFromAPI();
          }
          break;

        case 1:
          {
            print("Good");
            _partTime();
          }
          break;

        case 2:
          {
            print("Fair");
            _tempContract();
          }
          break;

        case 3:
          {
            print("Poor");
            _perContract();
          }
          break;

        case 4:
          {
            print("Fail");
            _jobSercher();
          }
          break;

        default:
          {
            print("Invalid choice");
          }
          break;
      }
    }
  }


  Widget drawerMenu() {
    return Drawer(

      child: ListView(
        
        children: <Widget>[
          ListTile(
            title: Text("إضافة إعلان"),
            trailing: Icon(Icons.arrow_forward),
          ),

          ListTile(
            title: Text("تسجيل الدخول"),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.of(context).pushNamed('/loginpage');
            },
            
          ),
        ],
      ),
    );
  }

  Widget bottomMenu() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.location_city,
            color: Theme.of(context).backgroundColor,
          ),
          title: Text(
            'الوزارة',
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.av_timer,
            color: Theme.of(context).backgroundColor,
          ),
          title: Text(
            'دوام جزئى',
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.gps_fixed,
            color: Theme.of(context).backgroundColor,
          ),
          title: Text(
            'عقد مؤقت',
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.perm_contact_calendar,
            color: Theme.of(context).backgroundColor,
          ),
          title: Text(
            'عقد دائم',
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).backgroundColor,
          ),
          title: Text(
            'إعلانات',
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
      ],
      currentIndex: _selectedIndex,
      //backgroundColor: Theme.of(context).bottomAppBarColor,
      // selectedItemColor: Colors.black,
      fixedColor: Theme.of(context).backgroundColor,
      //  type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
    );
  }


  Widget screenDispay() {
    Widget _whatDisplayOnScreen;

    if (isLoading) {
      _whatDisplayOnScreen = Center(child: CircularProgressIndicator());
    } else {
      _whatDisplayOnScreen = Vacancies(
        vacanciesList: vacancyDetailsList,
        errorMessage: errorMessage,
      );
    }

    return _whatDisplayOnScreen;
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
      drawer: drawerMenu(),
      body: Column(
        children: <Widget>[
          Center(
              child: Image.asset(
            'logo/logo2.png',
            height: 100.0,
          )),
          Container(
            margin: EdgeInsets.all(10.0),
              child: Center(
            child: headerTitle,
          )),
          Expanded(
            child: screenDispay(),
          )
        ],
      ),
      bottomNavigationBar: bottomMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshData,
        tooltip: 'Get Data',
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
