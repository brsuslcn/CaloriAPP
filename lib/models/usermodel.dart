import 'user_food_model.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? height;
  String? weight;
  String? age;
  List<UserFoodModel>? foods;

  double get consumedCalories =>
      foods?.fold(
          0,
          (previousValue, element) =>
              element.calories + (previousValue ?? 0)) ??
      0; //Fİrebaseden gelecek
  double get consumedProt =>
      foods?.fold(
          0,
          (previousValue, element) =>
              element.proteinG + (previousValue ?? 0)) ??
      0; //Fİrebaseden gelecek
  double get consumedFat =>
      foods?.fold(
          0,
          (previousValue, element) =>
              element.fatTotalG + (previousValue ?? 0)) ??
      0; //Fİrebaseden gelecek
  double get consumedCarbs =>
      foods?.fold(
          0,
          (previousValue, element) =>
              element.carbohydratesTotalG + (previousValue ?? 0)) ??
      0; //Fİrebaseden gelecek

  UserModel(
      {this.name,
      required this.email,
      required this.password,
      required this.height,
      required this.weight,
      required this.age,
      this.foods,
      this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['localId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      height: json['height'],
      weight: json['weight'],
      foods: json['foods'] != null
          ? List<UserFoodModel>.from(
              (json['foods']).map<UserFoodModel?>(
                (x) => UserFoodModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localId'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['age'] = this.age;
    data['foods'] = foods?.map((x) => x.toMap()).toList();

    return data;
  }
}
