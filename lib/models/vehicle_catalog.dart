import 'package:equatable/equatable.dart';
import 'package:vms/models/vehicle_category.dart';

class VehicleCatalog extends Equatable {
  const VehicleCatalog(
      {required this.id,
      required this.brand,
      required this.model,
      this.variant,
      this.year,
      this.name,
      required this.vehicleCategory});

  final int id;
  final String brand;
  final String model;
  final String? variant;
  final String? year;
  final String? name;
  final VehicleCategory vehicleCategory;

  @override
  List<Object> get props => [id];

  factory VehicleCatalog.fromJson(Map<String, dynamic> json) {
    return VehicleCatalog(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      variant: json['variant'],
      year: json['year'],
      name: json['name'],
      vehicleCategory: VehicleCategory.fromJson(json['vehicle_category']),
    );
  }
}
