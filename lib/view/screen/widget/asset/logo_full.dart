import 'package:flutter/material.dart';

class LogoFull extends StatelessWidget {
  const LogoFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Image.asset(
              'assets/images/utem_logo.png',
              height: 50,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'VMS UTeM',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  child: Text('Vehicle Management System',
                      style: Theme.of(context).textTheme.subtitle1),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
