import 'package:equatable/equatable.dart';
import 'package:vms/models/status.dart';
import 'package:vms/models/vehicle_inventory.dart';

class Complaint extends Equatable {
  const Complaint(
      {this.id, this.name, this.detail, this.status, this.vehicleInventory});

  final int? id;
  final String? name;
  final String? detail;
  final Status? status;
  final VehicleInventory? vehicleInventory;

  @override
  List<Object> get props => [id!];

  static const empty = Complaint();

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['id'],
      name: json['name'],
      detail: json['email'],
      status: Status.fromJson(json['status']),
      vehicleInventory: VehicleInventory.fromJson(json['vehicle_inventory']),
    );
  }
}
