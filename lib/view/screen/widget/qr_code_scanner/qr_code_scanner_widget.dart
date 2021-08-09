import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vms/view/screen/widget/qr_code_scanner/cubit/qr_code_scanner_cubit.dart';

class QRCodeScannerWidget extends StatelessWidget {
  const QRCodeScannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrCodeScannerCubit>(
      create: (_) => QrCodeScannerCubit(),
      child: _QRCodeScannerWidgetUI(),
    );
  }
}

class _QRCodeScannerWidgetUI extends StatelessWidget {
  _QRCodeScannerWidgetUI({Key? key}) : super(key: key);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrCodeScannerCubit, QrCodeScannerState>(
        builder: (context, state) => Scaffold(
              body: Container(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated:
                      BlocProvider.of<QrCodeScannerCubit>(context).init,
                ),
              ),
            ),
        listener: (context, state) {});
  }
}
