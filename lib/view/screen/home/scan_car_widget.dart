import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vms/view/screen/widget/qr_code_scanner/qr_code_scanner_widget.dart';

class ScanCarWidget extends StatelessWidget {
  const ScanCarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: QRCodeScannerWidget(),
    );
  }
}
