import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import '../models/vacancy.dart';

class ConnectedModel extends Model {

  // keep data needed by both vacancies and users
  User _authenticatedUser;


  // keep the methods needed by both vacancies and users

}



class UserModel extends ConnectedModel {

  void login(String email, String password){
    _authenticatedUser = User(id: 'ABCDEFGHIabcdefghi',email: email, password: password,token: 'hello' );
  }
}


class VacancyModel extends ConnectedModel {

}