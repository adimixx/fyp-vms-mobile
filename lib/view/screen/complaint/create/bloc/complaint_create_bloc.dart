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
  ComplaintCreateBloc(
      {required TextEditingController titleController,
      required TextEditingController descriptionController,
      required GlobalKey<FormState> formKey})
      : _titleController = titleController,
        _descriptionController = descriptionController,
        _formKey = formKey,
        super(ComplaintCreateState.init(
            titleController: titleController,
            descriptionController: descriptionController,
            formKey: formKey));

  late TextEditingController _titleController;
  final TextEditingController _descriptionController;
  final GlobalKey<FormState> _formKey;
  late VehicleInventory _vehicleInventory;

  @override
  Stream<ComplaintCreateState> mapEventToState(
    ComplaintCreateEvent event,
  ) async* {
    if (event is ComplaintFromModel) {
      _vehicleInventory = event.vehicleInventory;
      yield ComplaintCreateState.withVehicleData(
          vehicleInventory: _vehicleInventory,
          titleController: _titleController,
          descriptionController: _descriptionController,
          formKey: _formKey);
    } else if (event is ComplaintSubmit) {
      yield ComplaintCreateState.changeFormState(
          vehicleInventory: _vehicleInventory,
          titleController: _titleController,
          descriptionController: _descriptionController,
          formKey: _formKey,
          isSubmit: true);

      await _mapComplaintSubmitEvent();

      yield ComplaintCreateState.changeFormState(
          vehicleInventory: _vehicleInventory,
          titleController: _titleController,
          descriptionController: _descriptionController,
          formKey: _formKey,
          isSubmit: false);
    } else if (event is ComplaintSubmitSuccess) {
    } else if (event is ComplaintSubmitError) {
      print('Error Mes : ${event.errorMessage}');
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

  Future<void> _mapComplaintSubmitEvent() async {
    if (_formKey.currentState!.validate()) {
      try {
        var _data = {
          'vehicle_inventory_id': state.vehicleInventory!.id,
          'title': state.titleController.text,
          'description': state.descriptionController.text
        };

        await ComplaintRepository().postComplaint(_data);
        add(ComplaintSubmitSuccess());
      } catch (e) {
        add(ComplaintSubmitError(errorMessage: e.toString()));
      }
    }
  }
}
