import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _screenIndex = 0;
  String _token = "";
  String _userID = "";

  int get getScreenIndex => _screenIndex;
  String get token => _token;
  String get userID => _userID;

  void setScreenIndex(int val) {
    _screenIndex = val;
    notifyListeners();
  }

  void setToken(String tok){
    _token=tok;
    notifyListeners();
  }

  void setUserID(String id)
  {
    _userID = id;
    notifyListeners();
  }
}
