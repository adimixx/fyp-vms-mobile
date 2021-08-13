part of 'qr_detected_bloc.dart';

abstract class QrDetectedEvent extends Equatable {
  const QrDetectedEvent();

  @override
  List<Object> get props => [];
}

class QrDetectedInitialEvent extends QrDetectedEvent {
  const QrDetectedInitialEvent() : super();
}

class QrErrorEvent extends QrDetectedEvent {
  const QrErrorEvent() : super();
}

class QrVehicleEvent extends QrDetectedEvent {
  const QrVehicleEvent({required this.vehicleInventory}) : super();

  final VehicleInventory vehicleInventory;
}
