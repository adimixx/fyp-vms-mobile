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

class ComplaintSubmit extends ComplaintCreateEvent {
  const ComplaintSubmit({required this.title, required this.description});

  final String title;
  final String description;
}

class ComplaintSubmitSuccess extends ComplaintCreateEvent {}

class ComplaintSubmitError extends ComplaintCreateEvent {
  final String? errorMessage;

  ComplaintSubmitError({this.errorMessage}) : super();
}
