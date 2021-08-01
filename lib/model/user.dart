class User {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, Object> json) {
    return User(
        id: int.parse(json['id'].toString()),
        name: json['name'].toString(),
        email: json['email'].toString());
  }
}
