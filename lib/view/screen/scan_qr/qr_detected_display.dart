import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vms/view/screen/widget/asset/logo_full.dart';

class QRDetectedDisplay extends StatelessWidget {
  const QRDetectedDisplay({Key? key}) : super(key: key);

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
                    'QR Code has been detected. Please wait...',
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
          )),
    );
  }
}
