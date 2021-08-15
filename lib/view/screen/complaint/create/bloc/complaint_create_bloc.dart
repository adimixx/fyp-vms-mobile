import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:vms/logic/complaint/repository/complaint_repository.dart';
import 'package:vms/models/vehicle_inventory.dart';

part 'complaint_create_event.dart';
part 'complaint_create_state.dart';

class ComplaintCreateBloc
    extends Bloc<ComplaintCreateEvent, ComplaintCreateState> {
  ComplaintCreateBloc() : super(ComplaintCreateInitState());

  late VehicleInventory _vehicleInventory;

  @override
  Stream<ComplaintCreateState> mapEventToState(
    ComplaintCreateEvent event,
  ) async* {
    if (event is ComplaintFromModel) {
      _vehicleInventory = event.vehicleInventory;
      yield ComplaintWithVehicleDataState(vehicleInventory: _vehicleInventory);
    } else if (event is ComplaintSubmit) {
      yield ComplaintFormSubmitState(vehicleInventory: _vehicleInventory);

      await _mapComplaintSubmitEvent(event);
    } else if (event is ComplaintSubmitSuccess) {
      yield ComplaintFormSubmitSuccessState(
          vehicleInventory: _vehicleInventory);
    } else if (event is ComplaintSubmitError) {
      print('Error Mes : ${event.errorMessage}');
      yield ComplaintFormExceptionState(
          vehicleInventory: _vehicleInventory,
          errorBody: event.errorMessage ?? 'Error');
    }
  }

  String? titleInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Title';
    }

    return null;
  }

  String? descriptionInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Description';
    }

    return null;
  }

  Future<void> _mapComplaintSubmitEvent(ComplaintSubmit event) async {
    try {
      var _data = {
        'vehicle': state.vehicleInventory!.id,
        'title': event.title,
        'description': event.description,
      };

      await ComplaintRepository().postComplaint(_data);
      add(ComplaintSubmitSuccess());
    } catch (e) {
      add(ComplaintSubmitError(errorMessage: e.toString()));
    }
  }
}
