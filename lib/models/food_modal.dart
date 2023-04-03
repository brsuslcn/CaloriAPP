import 'dart:convert';

class FoodModal {
  double? sugarG;
  int? fiberG;
  double? servingSizeG;
  int? sodiumMg;
  String? name;
  int? potassiumMg;
  double? fatSaturatedG;
  double? fatTotalG;
  double? calories;
  int? cholesterolMg;
  double? proteinG;
  double? carbohydratesTotalG;
  FoodModal({
    this.sugarG,
    this.fiberG,
    this.servingSizeG,
    this.sodiumMg,
    this.name,
    this.potassiumMg,
    this.fatSaturatedG,
    this.fatTotalG,
    this.calories,
    this.cholesterolMg,
    this.proteinG,
    this.carbohydratesTotalG,
  });

  FoodModal copyWith({
    double? sugarG,
    int? fiberG,
    double? servingSizeG,
    int? sodiumMg,
    String? name,
    int? potassiumMg,
    double? fatSaturatedG,
    double? fatTotalG,
    double? calories,
    int? cholesterolMg,
    double? proteinG,
    double? carbohydratesTotalG,
  }) {
    return FoodModal(
      sugarG: sugarG ?? this.sugarG,
      fiberG: fiberG ?? this.fiberG,
      servingSizeG: servingSizeG ?? this.servingSizeG,
      sodiumMg: sodiumMg ?? this.sodiumMg,
      name: name ?? this.name,
      potassiumMg: potassiumMg ?? this.potassiumMg,
      fatSaturatedG: fatSaturatedG ?? this.fatSaturatedG,
      fatTotalG: fatTotalG ?? this.fatTotalG,
      calories: calories ?? this.calories,
      cholesterolMg: cholesterolMg ?? this.cholesterolMg,
      proteinG: proteinG ?? this.proteinG,
      carbohydratesTotalG: carbohydratesTotalG ?? this.carbohydratesTotalG,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sugarG': sugarG,
      'fiberG': fiberG,
      'servingSizeG': servingSizeG,
      'sodiumMg': sodiumMg,
      'name': name,
      'potassiumMg': potassiumMg,
      'fatSaturatedG': fatSaturatedG,
      'fatTotalG': fatTotalG,
      'calories': calories,
      'cholesterolMg': cholesterolMg,
      'proteinG': proteinG,
      'carbohydratesTotalG': carbohydratesTotalG,
    };
  }

  factory FoodModal.fromMap(Map<String, dynamic> map) {
    return FoodModal(
      sugarG: map['sugar_g']?.toDouble(),
      fiberG: map['fiber_g']?.toInt(),
      servingSizeG: map['serving_size_g']?.toDouble(),
      sodiumMg: map['sodium_mg']?.toInt(),
      name: map['name'],
      potassiumMg: map['potassium_mg']?.toInt(),
      fatSaturatedG: map['fat_saturated_g']?.toDouble(),
      fatTotalG: map['fat_total_g']?.toDouble(),
      calories: map['calories']?.toDouble(),
      cholesterolMg: map['cholesterol_mg']?.toInt(),
      proteinG: map['protein_g']?.toDouble(),
      carbohydratesTotalG: map['carbohydrates_total_g']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModal.fromJson(String source) =>
      FoodModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FoodModal(sugarG: $sugarG, fiberG: $fiberG, servingSizeG: $servingSizeG, sodiumMg: $sodiumMg, name: $name, potassiumMg: $potassiumMg, fatSaturatedG: $fatSaturatedG, fatTotalG: $fatTotalG, calories: $calories, cholesterolMg: $cholesterolMg, proteinG: $proteinG, carbohydratesTotalG: $carbohydratesTotalG)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodModal &&
        other.sugarG == sugarG &&
        other.fiberG == fiberG &&
        other.servingSizeG == servingSizeG &&
        other.sodiumMg == sodiumMg &&
        other.name == name &&
        other.potassiumMg == potassiumMg &&
        other.fatSaturatedG == fatSaturatedG &&
        other.fatTotalG == fatTotalG &&
        other.calories == calories &&
        other.cholesterolMg == cholesterolMg &&
        other.proteinG == proteinG &&
        other.carbohydratesTotalG == carbohydratesTotalG;
  }

  @override
  int get hashCode {
    return sugarG.hashCode ^
        fiberG.hashCode ^
        servingSizeG.hashCode ^
        sodiumMg.hashCode ^
        name.hashCode ^
        potassiumMg.hashCode ^
        fatSaturatedG.hashCode ^
        fatTotalG.hashCode ^
        calories.hashCode ^
        cholesterolMg.hashCode ^
        proteinG.hashCode ^
        carbohydratesTotalG.hashCode;
  }
}
