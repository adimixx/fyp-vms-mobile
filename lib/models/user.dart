import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {this.id = 0,
      this.name,
      this.email,
      this.staffNo,
      this.nric,
      this.phone});

  final int id;
  final String? name;
  final String? email;
  final String? staffNo;
  final String? nric;
  final String? phone;

  @override
  List<Object> get props => [id];

  static const empty = User();

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'].toString(),
        email: json['email'].toString(),
        staffNo: json['staff_no'].toString(),
        nric: json['nric'].toString(),
        phone: json['phone'].toString());
  }
}
