import 'dart:convert';

import 'package:calori_app/models/food_modal.dart';
import 'package:calori_app/models/user_model_food.dart';
import 'package:calori_app/models/usermodel.dart';
import 'package:calori_app/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../models/user_login_model.dart';
import '../../models/usermodel_realtime.dart';
import '../providers/nav_provider.dart';

const webApiKey = ".........";

const String _baseUrl = "https://......firebasedatabase.app";

class Services {
  Uri getUrl(String endpoint) => Uri.parse("$_baseUrl/$endpoint.json");
  Uri getUrl2(String endpoint) => Uri.parse("$_baseUrl/$endpoint");

  Future<UserModel?> getUserById(String id) async {
    http.Response response = await http.get(getUrl("users/$id"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      return UserModel.fromJson(data)..id = id;
    }
    return null;
  }

  Future<UserModel?> postUserInfo(UserModel user) async {
    http.Response response = await http.put(getUrl("users/${user.id}"),
        body: json.encode(user.toJson()),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);

      UserModel rtUser = UserModel.fromJson(data);
      return rtUser;
    } else {
      return null;
    }
  }

  Future<UserModel?> postUser(String email, password) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$webApiKey"),
        body: json.encode({"email": email, "password": password, "returnSecureToken": true}),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      UserModel authUser = UserModel.fromJson(data);
      return authUser;
    }
  }

  Future<Map<String, dynamic>?> signIn(
      UserLoginModel user, BuildContext context) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$webApiKey');
    final response = await http.post(
      url,
      body: json.encode({
        'email': user.email,
        'password': user.password,
        'returnSecureToken': true,
      }),
    );

    if (response.statusCode == 200) {
      print("Giriş Yapıldı!!!");

      var data = json.decode(response.body);
      return (data);
    } else {
      print("Giriş Başarısız!!!");
    }
  }

  Future<UserModel?> getFoodById(localId) async {
    http.Response response = await http.get(getUrl("users/$localId/foods"));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return UserModel.fromJson(jsonDecode(response.body))..id = localId;
    } else {
      return null;
    }
  }

  Future<UserModel?> postUserFood(
      foodName, foodCal, foodProt, foodFat, foodCarbs, id, token) async {
    http.Response response =
        await http.post(getUrl2("users/$id/foods.json?auth=$token"),
            body: json.encode({
              "food": foodName,
              "calories": foodCal,
              "proteinG": foodProt,
              "fatTotalG": foodFat,
              "carbohydratesTotalG": foodCarbs,
              "date": DateTime.now().millisecondsSinceEpoch
            }),
            headers: {"Content-Type": "application/json"});

    print(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      UserModel rtUser = UserModel.fromJson(data);

      print(rtUser);

      return rtUser;
    } else {
      return null;
    }
  }
}
