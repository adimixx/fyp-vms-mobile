part of 'qr_detected_bloc.dart';

class QrDetectedState extends Equatable {
  const QrDetectedState();

  @override
  List<Object> get props => [];
}

class QrInitial extends QrDetectedState {}

class QrError extends QrDetectedState {}

class QrVehicleDetected extends QrDetectedState {
  const QrVehicleDetected({required this.vehicleInventory}) : super();

  final VehicleInventory vehicleInventory;
}
