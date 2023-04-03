import 'package:calori_app/view_models/providers/food_api_provider.dart';
import 'package:calori_app/view_models/providers/nav_provider.dart';
import 'package:calori_app/view_models/providers/user_provider.dart';
import 'package:calori_app/view_models/services/food_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/food_modal.dart';
import '../view_models/services/services.dart';

import '../models/user_food_model.dart';

class AddFormWidget extends StatefulWidget {
  const AddFormWidget({super.key});

  @override
  State<AddFormWidget> createState() => _AddFormWidgetState();
}

class _AddFormWidgetState extends State<AddFormWidget> {
  TextEditingController _tcontrol = TextEditingController();

  // foodAdd() {
  //   setState(() {
  //     foodList.add(_tcontrol.text);
  //     _tcontrol.clear();
  //   });
  // }

  // todoCelete() {
  //   setState(() {
  //     foodList.remove(_tcontrol.text);
  //     _tcontrol.clear();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _tcontrol,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                prefixIcon: Icon(
                  Icons.lunch_dining,
                  color: Colors.purple,
                ),
                prefixIconColor: Colors.grey,
                hintText: "Add Food",
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.purple,
                      width: 2,
                    )),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 45,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder()),
                  onPressed: () async {
                    Provider.of<FoodApiProvider>(context, listen: false)
                        .getFood(_tcontrol.text);
                  },
                  child: const Text(
                    "Add Food",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
            Consumer<FoodApiProvider>(
              builder: (context, foodApiProvider, _) {
                return foodApiProvider.getFoodModels.isNotEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: foodApiProvider.getFoodModels.length,
                            itemBuilder: (context, index) => Card(
                                  color: Colors.black38,
                                  child: ListTile(
                                    textColor: Colors.white,
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(foodApiProvider
                                            .getFoodModels[index].name!),
                                        Text(
                                            "Cal: ${foodApiProvider.getFoodModels[index].calories} g")
                                      ],
                                    ),
                                    subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Prot: ${foodApiProvider.getFoodModels[index].proteinG}"),
                                          Text(
                                              "Fat: ${foodApiProvider.getFoodModels[index].calories}"),
                                          Text(
                                              "Carbs: ${foodApiProvider.getFoodModels[index].carbohydratesTotalG}")
                                        ]),
                                    onTap: () async {
                                      FoodModal f =
                                          foodApiProvider.getFoodModels[index];
                                      UserFoodModel food = UserFoodModel(
                                          food: f.name!,
                                          calories: f.calories!,
                                          proteinG: f.proteinG!,
                                          fatTotalG: f.fatTotalG!,
                                          carbohydratesTotalG:
                                              f.carbohydratesTotalG!,
                                          date: DateTime.now());
                                      context
                                          .read<UserProvider>()
                                          .addFood(food);
                                    },
                                  ),
                                )),
                      )
                    : const Center(
                        child: Text(
                          "NO FOOD!",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
