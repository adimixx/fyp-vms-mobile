import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/models/vehicle_inventory.dart';
import 'package:vms/view/screen/complaint/create/bloc/complaint_create_bloc.dart';

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
      appBar: AppBar(
        title: Text('New Complaint'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: BlocBuilder<ComplaintCreateBloc, ComplaintCreateState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Column(
                  children: [Text('test')],
                ),
              ),

              // Container - Scanned Vehicle Detail
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text('Vehicle :'),
                    ),
                    Container(
                      child: Text(
                        '${state.vehicleInventory?.regWithName}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              // Container - Complaint Title
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TextFormField(
                        // controller: state.,
                        decoration: InputDecoration(
                            filled: true,
                            border: UnderlineInputBorder(),
                            labelText: 'Complaint Title'),
                      ),
                    ),
                  ],
                ),
              ),
              // Container - Complaint Description
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TextFormField(
                        // controller: state.,
                        maxLines: 3,
                        maxLength: 250,
                        decoration: InputDecoration(
                            filled: true,
                            border: UnderlineInputBorder(),
                            labelText: 'Complaint Description'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
