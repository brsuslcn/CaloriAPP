class UserLoginModel{
  String? email;
  String? password;


  UserLoginModel({required this.email, required this.password});

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}
