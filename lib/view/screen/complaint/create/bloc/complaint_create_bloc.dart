import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vms/logic/vehicle_inventory/vehicle_inventory_repository.dart';
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
    if (event is ComplaintFromQR) {
      yield await _mapComplaintFromQrEvent(event);
    }
  }

  Future<ComplaintCreateState> _mapComplaintFromQrEvent(
      ComplaintFromQR _event) async {
    const String _url = 'http://vms.psm.test/vehicle/';

    if (_event.qrResult.contains(_url)) {
      String _repStr = _event.qrResult.replaceFirst(_url, '');

      VehicleInventory _vehicleInfo = await VehicleInventoryRepository()
          .getVehicleInventory(param: _repStr);
      return ComplaintCreateState.withVehicleData(
          vehicleInventory: _vehicleInfo);

      // try {
      //   VehicleInventory _vehicleInfo = await VehicleInventoryRepository()
      //       .getVehicleInventory(param: _repStr);
      //   return ComplaintCreateState.withVehicleData(
      //       vehicleInventory: _vehicleInfo);
      // } catch (e) {
      //   print(e.toString());
      // }
    }
    return ComplaintCreateState.init();
  }
}
