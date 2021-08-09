part of 'qr_code_scanner_cubit.dart';

class QrCodeScannerState extends Equatable {
  const QrCodeScannerState._({this.qrViewController, this.result});

  final QRViewController? qrViewController;
  final Barcode? result;

  const QrCodeScannerState() : this._();

  const QrCodeScannerState.init({required QRViewController qrViewController})
      : this._(qrViewController: qrViewController);
  const QrCodeScannerState.recognized(
      {required QRViewController qrViewController, required Barcode result})
      : this._(qrViewController: qrViewController, result: result);

  @override
  List<Object?> get props => [qrViewController, result];
}
