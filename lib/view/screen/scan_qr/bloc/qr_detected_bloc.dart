import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:network_repository/network_repository.dart';
import 'package:vms/logic/vehicle_inventory/vehicle_inventory_repository.dart';
import 'package:vms/models/vehicle_inventory.dart';

part 'qr_detected_event.dart';
part 'qr_detected_state.dart';

class QrDetectedBloc extends Bloc<QrDetectedEvent, QrDetectedState> {
  QrDetectedBloc({required this.url}) : super(QrInitial());

  final String url;

  @override
  Stream<QrDetectedState> mapEventToState(
    QrDetectedEvent event,
  ) async* {
    if (event is QrDetectedInitialEvent) {
      await _mapQrDetectedInitialEvent(event);
    } else if (event is QrErrorEvent) {
      yield QrError();
    } else if (event is QrVehicleEvent) {
      yield QrVehicleDetected(vehicleInventory: event.vehicleInventory);
    }
  }

  Future<void> _mapQrDetectedInitialEvent(event) async {
    await Future.delayed(Duration(seconds: 2));

    String _url = NetworkRepository().domain;

    if (!url.contains(_url)) {
      add(QrErrorEvent());
    }

    String _repStr = url.replaceFirst(_url, '');

    if (_repStr.contains('vehicle')) {
      String param = _repStr.replaceFirst('vehicle/', '');

      try {
        VehicleInventory _vehicleInfo = await VehicleInventoryRepository()
            .getVehicleInventory(param: param)
            .onError((error, stackTrace) => throw Exception(error));

        if (_vehicleInfo.props.isEmpty) throw Exception("No Data");

        add(QrVehicleEvent(vehicleInventory: _vehicleInfo));
      } catch (e) {
        print(e);
        add(QrErrorEvent());
      }
    }
  }
}
