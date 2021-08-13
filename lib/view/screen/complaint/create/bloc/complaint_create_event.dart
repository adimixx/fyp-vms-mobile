part of 'complaint_create_bloc.dart';

abstract class ComplaintCreateEvent extends Equatable {
  const ComplaintCreateEvent();

  @override
  List<Object> get props => [];
}

class ComplaintFromModel extends ComplaintCreateEvent {
  const ComplaintFromModel({required this.vehicleInventory});

  final VehicleInventory vehicleInventory;

  @override
  List<Object> get props => [vehicleInventory];
}
