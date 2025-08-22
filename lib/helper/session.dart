import 'package:learning/helper/user.dart';

class UserSession{
  static final UserSession _instance = UserSession._internal();

  factory UserSession(){
    return _instance;
  }

  UserSession._internal();

  User? currentUser;
}