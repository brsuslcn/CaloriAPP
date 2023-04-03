// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserFoodModel {
  String food;
  double calories;
  double proteinG;
  double fatTotalG;
  double carbohydratesTotalG;
  DateTime date;
  UserFoodModel({
    required this.food,
    required this.calories,
    required this.proteinG,
    required this.fatTotalG,
    required this.carbohydratesTotalG,
    required this.date,
  });

  UserFoodModel copyWith({
    String? food,
    double? calories,
    double? proteinG,
    double? fatTotalG,
    double? carbohydratesTotalG,
    DateTime? date,
  }) {
    return UserFoodModel(
      food: food ?? this.food,
      calories: calories ?? this.calories,
      proteinG: proteinG ?? this.proteinG,
      fatTotalG: fatTotalG ?? this.fatTotalG,
      carbohydratesTotalG: carbohydratesTotalG ?? this.carbohydratesTotalG,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'food': food,
      'calories': calories,
      'proteinG': proteinG,
      'fatTotalG': fatTotalG,
      'carbohydratesTotalG': carbohydratesTotalG,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory UserFoodModel.fromMap(Map<String, dynamic> map) {
    return UserFoodModel(
      food: map['food'] as String,
      calories: map['calories'] as double,
      proteinG: map['proteinG'] as double,
      fatTotalG: map['fatTotalG'] as double,
      carbohydratesTotalG: map['carbohydratesTotalG'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFoodModel.fromJson(String source) =>
      UserFoodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserFoodModel(food: $food, calories: $calories, proteinG: $proteinG, fatTotalG: $fatTotalG, carbohydratesTotalG: $carbohydratesTotalG, date: $date)';
  }

  @override
  bool operator ==(covariant UserFoodModel other) {
    if (identical(this, other)) return true;

    return other.food == food &&
        other.calories == calories &&
        other.proteinG == proteinG &&
        other.fatTotalG == fatTotalG &&
        other.carbohydratesTotalG == carbohydratesTotalG;
  }

  @override
  int get hashCode {
    return food.hashCode ^
        calories.hashCode ^
        proteinG.hashCode ^
        fatTotalG.hashCode ^
        carbohydratesTotalG.hashCode ^
        date.hashCode;
  }
}
