import 'package:equatable/equatable.dart';

class VehicleCategory extends Equatable {
  const VehicleCategory({required this.id, required this.name});

  final int id;
  final String name;

  @override
  List<Object> get props => [id];

  factory VehicleCategory.fromJson(Map<String, dynamic> json) {
    return VehicleCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}
