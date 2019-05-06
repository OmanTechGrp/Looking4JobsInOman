import 'package:flutter/material.dart';

class Vacancies extends StatelessWidget {
  final List<dynamic> vacanciesList;
  final String errorMessage;
  const Vacancies(
      {Key key, @required this.vacanciesList, @required this.errorMessage})
      : super(key: key);

  Widget _displayList(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(
        borderOnForeground: true,
        child: Column(
          children: <Widget>[
            Center(
              child: vacanciesList[index]['SponsorName'] != null
                  ? Text(
                      vacanciesList[index]['SponsorName'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    )
                  : Text('-'),
            ),

            vacanciesList[index]['OccupationDesc'] != null
                ? Text(
                    vacanciesList[index]['OccupationDesc'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : Text('-'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                vacanciesList[index]['VacDetRefID'] != null
                    ? Text(
                        vacanciesList[index]['VacDetRefID'],
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      )
                    : Text('-'),
                Text(
                  'المرجع في الوزارة: ',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                vacanciesList[index]['OccupCode'] != null
                    ? Text(
                        vacanciesList[index]['OccupCode'],
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      )
                    : Text('-'),
                Text(
                  'رقم الوظيفة: ',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            // Row(
            //   children: <Widget>[
            //     Text('SponsorName: '),
            //     vacanciesList[index]['SponsorName'] != null ? Text(vacanciesList[index]['SponsorName']) : Text('-'),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                vacanciesList[index]['CRNo'] != null
                    ? Text(vacanciesList[index]['CRNo'])
                    : Text('-'),
                Text(
                  'رقم السجل التجاري: ',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                vacanciesList[index]['VacContactPerson'] != null
                    ? Text(vacanciesList[index]['VacContactPerson'])
                    : Text('-'),
                Text(
                  'التواصل: ',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                vacanciesList[index]['VacContactTelNno'] != null
                    ? Text(vacanciesList[index]['VacContactTelNno'])
                    : Text('-'),
                Text(
                  'رقم التلفون: ',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                vacanciesList[index]['Salary'] != null
                    ? Text(
                        vacanciesList[index]['Salary'],
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      )
                    : Text('-'),
                Text(
                  'الراتب: ',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            // Row(
            //   children: <Widget>[
            //     Text('OccupationDesc: '),
            //     vacanciesList[index]['OccupationDesc'] != null
            //         ? Text(vacanciesList[index]['OccupationDesc'])
            //         : Text('-'),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                vacanciesList[index]['EducationDesc'] != null
                    ? Text(vacanciesList[index]['EducationDesc'])
                    : Text('-'),
                Text(
                  'المؤهل الدراسي : ',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                // Text('NoReqMale: '),
                Text('${vacanciesList[index]['NoReqMale']} عدد الذكور            '),
                Text('${vacanciesList[index]['NoReqfemale']} عدد الإناث              '),
                Text('${vacanciesList[index]['VacdBothGender']} العدد من الجنسين  ')
              ],
            ),
            Row(
              children: <Widget>[
                // Text('NoReqfemale: '),
              ],
            ),
            Row(
              children: <Widget>[
                // Text('VacdBothGender: '),
                
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget retValue;
    if (vacanciesList.length > 0) {
      retValue = ListView.builder(
        itemBuilder: _displayList,
        itemCount: vacanciesList.length,
      );
    } else {
      retValue = Center(
        child: Text(
          errorMessage,
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
      );
    }
    return retValue;
  }
}
