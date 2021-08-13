import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vms/models/vehicle_inventory.dart';

part 'complaint_create_event.dart';
part 'complaint_create_state.dart';

class ComplaintCreateBloc
    extends Bloc<ComplaintCreateEvent, ComplaintCreateState> {
  ComplaintCreateBloc() : super(ComplaintCreateState.init());

  @override
  Stream<ComplaintCreateState> mapEventToState(
    ComplaintCreateEvent event,
  ) async* {
    if (event is ComplaintFromModel) {
      yield ComplaintCreateState.withVehicleData(
          vehicleInventory: event.vehicleInventory);
    }
  }
}
