import 'package:flutter/material.dart';
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
    return BlocBuilder<ComplaintCreateBloc, ComplaintCreateState>(
      builder: (context, state) => SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('${state.vehicleInventory?.regWithName ?? 'Nope'}'),
            ),
          ],
        ),
      ),
    );
  }
}
