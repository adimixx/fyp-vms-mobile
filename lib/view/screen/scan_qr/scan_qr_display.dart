import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/view/screen/scan_qr/qr_detected_display.dart';
import 'package:vms/view/screen/widget/qr_code_scanner/qr_code_scanner_widget.dart';

class ScanQRDisplay extends StatelessWidget {
  ScanQRDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromARGB(255, 12, 25, 70);

    Function(String) _callback = (String _callback) {
      Navigator.of(context)
          .popAndPushNamed('/qr/detected', arguments: _callback);
      // Navigator.of(context).pushNamed('/complaint/create',
      //     arguments: ComplaintCreateScreenArgs(qrUrl: _callback));
      // BlocProvider.of<HomeCubit>(context).onChangeHomeSceenPage(index: 0);
    };

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColorDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Scan QR Code',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30),
              child: Text('Scan VMS UTeM QR Code for further actions',
                  style: Theme.of(context).textTheme.subtitle2),
            ),
            Expanded(
              child: QRCodeScannerWidget(
                callback: _callback,
              ),
            )
          ],
        ),
      ),
    );
  }
}
