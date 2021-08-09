import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/view/screen/complaint/create/bloc/complaint_create_bloc.dart';

class ComplaintCreateScreenArgs {
  final String? qrUrl;

  const ComplaintCreateScreenArgs({this.qrUrl});
}

class ComplaintCreateScreen extends StatelessWidget {
  const ComplaintCreateScreen({Key? key, this.args}) : super(key: key);

  final ComplaintCreateScreenArgs? args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComplaintCreateBloc>(
      create: (_) => ComplaintCreateBloc()
        ..add(ComplaintFromQR(qrResult: args?.qrUrl ?? '')),
      child: _ComplaintCreateScreenUI(),
    );
  }
}

class _ComplaintCreateScreenUI extends StatelessWidget {
  const _ComplaintCreateScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    Color _primaryColor = Color.fromARGB(255, 12, 25, 70);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Complaint'),
        backgroundColor: _primaryColor,
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
