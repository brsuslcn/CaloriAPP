import 'package:calori_app/components/persentage_widget.dart';
import 'package:calori_app/view_models/providers/user_provider.dart';
import 'package:calori_app/views/profile_page.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/piechart_widget.dart';
import '../models/usermodel.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  String get formatted {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    int age = int.parse(
        context.read<UserProvider>().getUser.age!); //değer firebase'den gelecek
    double weight = double.parse(context
        .read<UserProvider>()
        .getUser
        .weight!); //değer firebase'den gelecek
    double height = double.parse(context
        .read<UserProvider>()
        .getUser
        .height!); //değer firebase'den gelecek

    double useAge(double height, double weight) {
      var weightCal = 25 * height / 100 * height / 100 * 1.25;
      if (weightCal < weight) {
        weight = weightCal;
      }
      return weight;
    }

    double totalCalories() {
      double caloriesCal;
      if (age <= 18) {
        caloriesCal = (17.7 * weight + 458.2) * 1.4;
      } else if (age <= 30) {
        caloriesCal = (15.1 * weight + 658.2) * 1.4;
      } else if (age <= 60) {
        caloriesCal = (11.5 * weight + 873.1) * 1.4;
      } else {
        caloriesCal = (11.7 * weight + 587.7) * 1.4;
      }
      return caloriesCal;
    }

    double totalCarbs = totalCalories() * 0.55;
    double totalFat = totalCalories() * 0.30;
    double totalProt = totalCalories() * 0.15;
    double consumedCalories = context
        .read<UserProvider>()
        .getUser
        .consumedCalories; //Fİrebaseden gelecek
    double consumedFat =
        context.read<UserProvider>().getUser.consumedFat; //Fİrebaseden gelecek
    double consumedCarbs = context
        .read<UserProvider>()
        .getUser
        .consumedCarbs; //Fİrebaseden gelecek
    double consumedProt =
        context.read<UserProvider>().getUser.consumedProt; //Fİrebaseden gelecek

    double caloriesRatio = consumedCalories / totalCalories();
    double carbsRatio = consumedCarbs / totalCarbs;
    double fatRatio = consumedFat / totalFat;
    double protRatio = consumedProt / totalFat;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 23),
                  ),
                  Text("Have a nice day", style: TextStyle(fontSize: 12))
                ],
              ),
            ),
            GestureDetector(
              child: Icon(Icons.person_2_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            //Yüzde gösterdiğimiz bölge
            child: Column(
              children: [
                Text(
                  formatted,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Calories",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 300,
                          child: FittedBox(
                            child: PersentageWidget(
                              ratio: "${(caloriesRatio * 100).round()} %",
                              percent: caloriesRatio,
                              color: Colors.purple,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        PersentageWidget(
                          ratio: "${(carbsRatio * 100).round()} %",
                          percent: carbsRatio,
                          color: Colors.tealAccent,
                        ),
                        Text(
                          "Carbs",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        PersentageWidget(
                          ratio: "${(fatRatio * 100).round()} %",
                          percent: fatRatio,
                          color: Colors.amber,
                        ),
                        Text(
                          "Fat",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        PersentageWidget(
                          ratio: "${(protRatio * 100).round()} %",
                          percent: protRatio,
                          color: Colors.redAccent,
                        ),
                        Text(
                          "Protein",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      height: 100,
                      color: Colors.purple,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Left",
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${(totalCalories() - consumedCalories).round()}",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                                Text(
                                  "/kcal",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ]),
                    ),
                   Container(
                     padding: const EdgeInsets.symmetric(
                         vertical: 3, horizontal: 20),
                     height: 100,
                     color: Colors.teal,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text(
                           "Consumed",
                           style: TextStyle(color: Colors.white),
                         ),
                         Row(
                           children: [
                             Text(
                               "${(consumedCalories).round()}",
                               style: TextStyle(
                                   fontSize: 22, color: Colors.white),
                             ),
                             Text(
                               "/kcal",
                               style: TextStyle(color: Colors.white),
                             )
                           ],
                         ),
                       ],
                     ),
                   ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
