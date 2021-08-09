part of 'complaint_create_bloc.dart';

class ComplaintCreateState extends Equatable {
  const ComplaintCreateState._({this.vehicleInventory});

  const ComplaintCreateState.init() : this._();

  const ComplaintCreateState.withVehicleData(
      {required VehicleInventory vehicleInventory})
      : this._(vehicleInventory: vehicleInventory);

  final VehicleInventory? vehicleInventory;

  @override
  List<Object?> get props => [vehicleInventory];
}
