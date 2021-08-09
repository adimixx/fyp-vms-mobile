import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_code_scanner_state.dart';

class QrCodeScannerCubit extends Cubit<QrCodeScannerState> {
  QrCodeScannerCubit() : super(QrCodeScannerState());

  void init(QRViewController qrViewController) {
    emit(QrCodeScannerState.init(qrViewController: qrViewController));

    qrViewController.scannedDataStream.listen(
      (event) {
        emit(
          QrCodeScannerState.recognized(
              qrViewController: qrViewController, result: event),
        );

        print('Result Code :  ${this.state.result?.code ?? null}');
        print('Result format :  ${this.state.result?.format ?? null}');
      },
    );
  }
}
