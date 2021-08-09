import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_code_scanner_state.dart';

class QrCodeScannerCubit extends Cubit<QrCodeScannerState> {
  QrCodeScannerCubit({required this.resultCallback})
      : super(QrCodeScannerState());

  final Function(String) resultCallback;

  void init(QRViewController qrViewController) {
    emit(QrCodeScannerState.init(qrViewController: qrViewController));

    qrViewController.scannedDataStream.listen(
      (event) {
        qrViewController.dispose();
        emit(
          QrCodeScannerState.recognized(
              qrViewController: qrViewController, result: event),
        );
        resultCallback(state.result!.code);

        print('Result Code :  ${this.state.result?.code ?? null}');
        print('Result format :  ${this.state.result?.format ?? null}');
      },
    );
  }
}
