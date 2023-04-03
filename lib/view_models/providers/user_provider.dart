import 'package:calori_app/models/usermodel_realtime.dart';
import 'package:calori_app/view_models/services/services.dart';
import 'package:calori_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_food_model.dart';
import '../../models/user_login_model.dart';
import '../../models/usermodel.dart';
import 'nav_provider.dart';

class UserProvider with ChangeNotifier {
  UserModel _userModel = UserModel(
      email: "email",
      password: "password",
      weight: "weight",
      height: "height",
      age: "age",
      id: "id",
      name: "name");


  UserModel get getUser => _userModel;

  var services = Services();
  static bool statusCheck = false;

  void setUser(UserModel user) {
    _userModel = user;
    notifyListeners();
  }

  getUserById(String id) async {
    _userModel = await services.getUserById(id) ?? _userModel;
    notifyListeners();
  }

  addFood(UserFoodModel food) async {
    if (_userModel.foods == null) {
      _userModel.foods = [];
    }
    int index = _userModel.foods!.indexWhere((element) => food == element);

    if (index == -1) {
      _userModel.foods!.add(food);
      await services.postUserInfo(_userModel);

      notifyListeners();
    }
  }

  deleteFood(UserFoodModel food) async {
    if (_userModel.foods == null) _userModel.foods = [];
    int index = _userModel.foods!.indexWhere((element) => food == element);
    if (index > -1) _userModel.foods!.removeAt(index);
    await services.postUserInfo(_userModel);

    notifyListeners();
  }

  /* void setUserRt(UserModel userrt){
    _userModel = userrt;
    notifyListeners();
  }*/

  Future<void> postUser(String email, password, age, weight, height) async {
    _userModel = (await services.postUser(email, password))!;
    setUser(_userModel);

    _userModel.age = age;
    _userModel.weight = weight;
    _userModel.height = height;
    statusCheck = true;
    services.postUserInfo(_userModel);
    notifyListeners();
  }

  /*Future<void> postUserRT(UserModel user) async {
        if(statusCheck == true)
          {
            UserModel? uRT = await services.postUserInfo(user);
            setUser(uRT!);
          }
  }*/

  Future<void> login(
      UserLoginModel userLoginModel, BuildContext context) async {
    var data = await services.signIn(userLoginModel, context);
    if (data != null) {
      await getUserById(data["localId"]);

      Provider.of<NavigationProvider>(context, listen: false)
          .setToken(data["idToken"]);
      Provider.of<NavigationProvider>(context, listen: false)
          .setUserID(data["localId"]);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
            settings: RouteSettings(arguments: data["idToken"]),
          ));
    }
    notifyListeners();
  }
}
