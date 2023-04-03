import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/food_modal.dart';

const _baseUrl = "https://api.calorieninjas.com/v1/nutrition?query=";

class FoodServices {
  Uri getUrl(String query) => Uri.parse("$_baseUrl$query");

  Future<List<FoodModal>> getFood(String query) async {
    http.Response response = await http.get(getUrl(query),
        headers: {"X-Api-Key": "pnm5Yj4UY643yQRvkZBT3A==ZsETOsKqKa5PDsSb"});
    List<FoodModal> list = [];
    var data = jsonDecode(response.body)["items"];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      for (var i in data) {
        list.add(FoodModal.fromMap(i));
      }
    }
    return list;
  }
  // Future<List<FoodModal>> postFood(FoodModal foodModal)async {
  //   http.Response response = await http.post(
  //       getUrl("users"),
  //       body: foodModal.toJson(),
  //       headers: {"Content-Type": "application/json"});
  //   if (response.statusCode >= 200 &&
  //       response.statusCode < 300) {
  //     var data = json.decode(response.body);
  //     foodModal.id = data;
  //     return foodModal;
  //   } else {
  //     return null;
  //   }
  // }
}
