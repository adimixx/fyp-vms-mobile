import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vms/models/vehicle_inventory.dart';
import 'package:vms/view/screen/complaint/create/bloc/complaint_create_bloc.dart';
import 'package:vms/view/screen/vehicle/vehicle_inventory_detail/vehicle_inventory_detail.dart';
import 'package:vms/view/screen/widget/form/bs_text_field.dart';

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
    ComplaintCreateBloc _complaintCreateBloc = ComplaintCreateBloc(
      titleController: TextEditingController(),
      descriptionController: TextEditingController(),
      formKey: GlobalKey<FormState>(),
    );

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
            )
          ],
        ),
      ),
    );
  }
}

class _ComplaintForm extends StatelessWidget {
  const _ComplaintForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplaintCreateBloc, ComplaintCreateState>(
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Complaint Title',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                child: BsTextField(
                  enabled: !state.isSubmit,
                  borderRadius: 10,
                  controller: state.titleController,
                  // labelText: "Complaint Title",
                  validator: BlocProvider.of<ComplaintCreateBloc>(context)
                      .titleInputValidator,
                ),
                margin: EdgeInsets.only(bottom: 20, top: 10),
              ),
              Text(
                'Complaint Description',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                child: BsTextField(
                  enabled: !state.isSubmit,
                  borderRadius: 10,
                  maxLength: 250,
                  maxLines: 8,
                  controller: state.descriptionController,
                  // labelText: "Complaint Title",
                  validator: BlocProvider.of<ComplaintCreateBloc>(context)
                      .descriptionInputValidator,
                ),
                margin: EdgeInsets.only(bottom: 20, top: 10),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: (state.isSubmit)
                      ? SpinKitRing(
                          color: Colors.white,
                          size: 20.0,
                          lineWidth: 3.0,
                        )
                      : Text('Submit Complaint'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                  onPressed: state.isSubmit
                      ? null
                      : () {
                          context
                              .read<ComplaintCreateBloc>()
                              .add(ComplaintSubmit());
                        },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GenerateVehicleInventoryDetail extends StatelessWidget {
  const _GenerateVehicleInventoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplaintCreateBloc, ComplaintCreateState>(
      builder: (context, state) {
        if (state.vehicleInventory?.props.isNotEmpty ?? false) {
          return VehicleInventoryDetail(
              vehicleInventory: state.vehicleInventory!);
        }
        return Container();
      },
    );
  }
}
