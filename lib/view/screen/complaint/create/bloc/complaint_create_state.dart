part of 'complaint_create_bloc.dart';

abstract class ComplaintCreateState extends Equatable {
  const ComplaintCreateState({
    this.vehicleInventory,
    this.isSubmit = false,
  });

  final VehicleInventory? vehicleInventory;
  final bool isSubmit;

  @override
  List<Object?> get props => [
        vehicleInventory,
        isSubmit,
      ];
}

class ComplaintCreateInitState extends ComplaintCreateState {
  const ComplaintCreateInitState() : super();
}

class ComplaintWithVehicleDataState extends ComplaintCreateState {
  const ComplaintWithVehicleDataState(
      {required VehicleInventory vehicleInventory})
      : super(vehicleInventory: vehicleInventory);
}

class ComplaintFormSubmitState extends ComplaintCreateState {
  const ComplaintFormSubmitState({required VehicleInventory vehicleInventory})
      : super(vehicleInventory: vehicleInventory, isSubmit: true);
}

class ComplaintFormSubmitSuccessState extends ComplaintCreateState {
  const ComplaintFormSubmitSuccessState(
      {required VehicleInventory vehicleInventory})
      : super(vehicleInventory: vehicleInventory, isSubmit: false);
}

class ComplaintFormExceptionState extends ComplaintCreateState {
  const ComplaintFormExceptionState(
      {required VehicleInventory vehicleInventory, required this.errorBody})
      : super(vehicleInventory: vehicleInventory, isSubmit: false);

  final String errorBody;

  @override
  List<Object?> get props => [vehicleInventory, isSubmit, errorBody];
}
