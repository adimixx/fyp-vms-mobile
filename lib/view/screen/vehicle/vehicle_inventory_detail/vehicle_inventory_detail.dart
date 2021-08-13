import 'package:flutter/material.dart';
import 'package:vms/models/vehicle_inventory.dart';

class VehicleInventoryDetail extends StatelessWidget {
  const VehicleInventoryDetail({Key? key, required this.vehicleInventory})
      : super(key: key);

  final VehicleInventory vehicleInventory;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vehicle Information',
                style: Theme.of(context).textTheme.subtitle2),
            Text(
              '${vehicleInventory.regNo}',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Text(
              '${vehicleInventory.vehicleCatalog?.name}',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
