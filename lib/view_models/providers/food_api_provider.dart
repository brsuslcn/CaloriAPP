import 'package:calori_app/models/food_modal.dart';
import 'package:calori_app/view_models/services/food_services.dart';
import 'package:flutter/material.dart';

class FoodApiProvider with ChangeNotifier {
  List<FoodModal> _foodModals = [];

  List<FoodModal> get getFoodModels => _foodModals;

  var foodServices = FoodServices();

  // void setFoodModel(FoodModal food) {
  //   _foodModals = food;
  //   notifyListeners();
  // }

  Future<void> getFood(String query) async {
    List<FoodModal> temp = [];
    temp = await foodServices.getFood(query);
    temp.forEach((f) => _foodModals.add(f));

    notifyListeners();

  }
}
