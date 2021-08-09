import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/view/screen/complaint/create/complaint_create_screen.dart';
import 'package:vms/view/screen/home/cubit/home_cubit.dart';
import 'package:vms/view/screen/widget/qr_code_scanner/qr_code_scanner_widget.dart';

class ScanCarWidget extends StatelessWidget {
  ScanCarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromARGB(255, 12, 25, 70);

    Function(String) _callback = (String _callback) {
      Navigator.of(context).pushNamed('/complaint/create',
          arguments: ComplaintCreateScreenArgs(qrUrl: _callback));
      BlocProvider.of<HomeCubit>(context).onBottomNavigationBarTap(index: 0);
    };

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: primaryColor,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text('Scan vehicle QR Code to create new complaint',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal)),
          ),
          Expanded(
            child: QRCodeScannerWidget(
              callback: _callback,
            ),
          )
        ],
      ),
    );
  }
}
