import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vms/app/bloc/app_bloc.dart';
import 'package:vms/models/vehicle_inventory.dart';
import 'package:vms/view/screen/complaint/create/bloc/complaint_create_bloc.dart';
import 'package:vms/view/screen/home/cubit/home_cubit.dart';
import 'package:vms/view/screen/vehicle/vehicle_inventory_detail/vehicle_inventory_detail.dart';
import 'package:vms/view/screen/widget/form/bs_text_field.dart';

part '_generate_vehicle_inventory_detail.dart';
part '_complaint_form.dart';

class ComplaintCreateScreenArgs {
  final String? qrUrl;
  final VehicleInventory? vehicleInventory;

  const ComplaintCreateScreenArgs({this.qrUrl, this.vehicleInventory});
}

class ComplaintCreateScreen extends StatelessWidget {
  ComplaintCreateScreen({Key? key, this.args}) : super(key: key);

  final ComplaintCreateScreenArgs? args;

  @override
  Widget build(BuildContext context) {
    ComplaintCreateBloc _complaintCreateBloc = ComplaintCreateBloc();

    if (this.args?.vehicleInventory?.props.isNotEmpty ?? false) {
      _complaintCreateBloc
        ..add(
            ComplaintFromModel(vehicleInventory: this.args!.vehicleInventory!));
    }

    return BlocProvider<ComplaintCreateBloc>(
      create: (_) => _complaintCreateBloc,
      child: _ComplaintCreateScreenUI(),
    );
  }
}

class _ComplaintCreateScreenUI extends StatelessWidget {
  const _ComplaintCreateScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Header and Vehicle Detail
                Container(
                  color: Theme.of(context).primaryColor,
                  child: SafeArea(
                    minimum: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Complaint',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Text(
                                'Please fill in vehicle complaint',
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            ],
                          ),
                        ),
                        // Vehicle Inventory Detail
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: _GenerateVehicleInventoryDetail(),
                        ),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                )
              ],
            ),

            // Complaint Form
            SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 10.0),
              child: _ComplaintForm(),
            ),
            BlocListener<ComplaintCreateBloc, ComplaintCreateState>(
              listener: (context, state) {
                if (state is ComplaintFormSubmitState) {
                  BlocProvider.of<AppBloc>(context).add(
                    AppComplaintPost(message: 'Complaint has been added'),
                  );
                  Navigator.of(context).pop();
                } else if (state is ComplaintFormExceptionState) {}
              },
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
