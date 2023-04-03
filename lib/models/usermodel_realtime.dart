class UserModelRT {
  String? id;
  String? name;
  String? email;
  String? height;
  String? weight;
  String? age;
  //String? password;

  UserModelRT({this.name, required this.email, required this.height, required this.weight, required this.age, this.id});

  factory UserModelRT.fromJson(Map<String, dynamic> json) {
    return UserModelRT(

      id: json['id'],
      name: json['name'],
      email: json['email'],
      height: json['height'],
      weight: json['weight'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']=this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['age'] = this.age;
    return data;
  }
}
