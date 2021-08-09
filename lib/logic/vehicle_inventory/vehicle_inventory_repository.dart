import 'dart:convert';

import 'package:network_repository/network_repository.dart';
import 'package:vms/models/vehicle_inventory.dart';

class VehicleInventoryRepository {
  Future<VehicleInventory> getVehicleInventory({required String param}) async {
    var res =
        await NetworkRepository().getData(apiUrl: '/vehicle/inventory/$param');

    VehicleInventory _vehicleInventory =
        VehicleInventory.fromJson(jsonDecode(res.body));

    return _vehicleInventory;
  }
}
