import 'package:flutter/material.dart';

class Vacancy {
  String vacDetRefID;
  String occupCode;
  String sponsorName;
  String cRNo;
  String vacContactPerson;
  String vacContactTelNno;
  String regionDesc;
  String salary;
  String occupationDesc;
  String wilayatDesc;
  String educationDesc;
  String noReqMale;
  String noReqfemale;
  String vacdBothGender;
  String vacExpDuration;
  String vacRefNum;
  String specialization;
  String rowNumber;

  Vacancy(
     {@required this.vacDetRefID,
      @required this.occupCode,
      @required this.sponsorName,
      @required this.cRNo,
      @required this.vacContactPerson,
      @required this.vacContactTelNno,
      @required this.regionDesc,
      @required this.salary,
      @required this.occupationDesc,
      @required this.wilayatDesc,
      @required this.educationDesc,
      @required this.noReqMale,
      @required this.noReqfemale,
      @required this.vacdBothGender,
      @required this.vacExpDuration,
      @required this.vacRefNum,
      @required this.specialization,
      @required this.rowNumber});
}
