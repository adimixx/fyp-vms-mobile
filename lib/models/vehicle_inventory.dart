import 'package:equatable/equatable.dart';
import 'package:vms/models/status.dart';
import 'package:vms/models/vehicle_catalog.dart';

class VehicleInventory extends Equatable {
  const VehicleInventory(
      {this.id,
      this.regNo,
      this.lastServiceDate,
      this.nextServiceMileage,
      this.nextServiceDate,
      this.vehicleCatalog,
      this.regWithName});

  final int? id;
  final String? regNo;
  final String? lastServiceDate;
  final double? nextServiceMileage;
  final String? nextServiceDate;
  final VehicleCatalog? vehicleCatalog;

  final String? regWithName;

  @override
  List<Object> get props => [id!];

  static const empty = VehicleInventory();

  factory VehicleInventory.fromJson(Map<String, dynamic> json) {
    return VehicleInventory(
      id: json['id'],
      regNo: json['reg_no'],
      lastServiceDate: json['last_service_date'],
      nextServiceMileage:
          double.tryParse(json['next_service_mileage'].toString()),
      nextServiceDate: json['next_service_date'],
      vehicleCatalog: (json['vehicle_catalog'] != null)
          ? VehicleCatalog.fromJson(json['vehicle_catalog'])
          : null,
      regWithName: json['reg_with_name'],
    );
  }
}
