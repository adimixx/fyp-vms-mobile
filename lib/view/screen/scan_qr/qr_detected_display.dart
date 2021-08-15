import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vms/view/screen/complaint/create/complaint_create_screen.dart';
import 'package:vms/view/screen/scan_qr/bloc/qr_detected_bloc.dart';
import 'package:vms/view/screen/widget/asset/logo_full.dart';

class QRDetectedDisplay extends StatelessWidget {
  const QRDetectedDisplay({Key? key, required this.parameter})
      : super(key: key);

  final String parameter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrDetectedBloc>(
      create: (_) =>
          QrDetectedBloc(url: parameter)..add(QrDetectedInitialEvent()),
      child: _QRDetectedDisplayUI(),
    );
  }
}

class _QRDetectedDisplayUI extends StatelessWidget {
  const _QRDetectedDisplayUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrDetectedBloc, QrDetectedState>(
        builder: (context, state) {
      if (state is QrError) {
        return _QRErrorUI();
      }
      return LoadingScreen(
        description: 'QR Code has been detected. Please wait...',
      );
    }, listener: (context, state) {
      if (state is QrVehicleDetected) {
        Navigator.of(context).popAndPushNamed(
          '/complaint/create',
          arguments: ComplaintCreateScreenArgs(
              vehicleInventory: state.vehicleInventory),
        );
      }
    });
  }
}

class _QRErrorUI extends StatelessWidget {
  const _QRErrorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 60,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Invalid QR Code. Please try again',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.red),
                ),
              ),
              Container(
                child: TextButton(
                  child: Text(
                    'Retry',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () => Navigator.of(context).popAndPushNamed('/qr'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Transform.scale(
                scale: 0.7,
                child: Container(
                  child: LogoFull(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    this.description,
    Key? key,
  }) : super(key: key);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: SpinKitRing(
                  color: Theme.of(context).primaryColor,
                  size: 60.0,
                ),
              ),
              Container(
                child: Text(
                  '$description',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              Expanded(child: Container()),
              Transform.scale(
                scale: 0.7,
                child: Container(
                  child: LogoFull(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
