class UserFoodModel {
  String? food;
  String? date;


  UserFoodModel({required this.food, required this.date});

  factory UserFoodModel.fromJson(Map<String, dynamic> json) {
    return UserFoodModel(
      food: json['food'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    food: data['food'] = this.food;
    date: data['date'] = this.date;

    return data;
  }
}
