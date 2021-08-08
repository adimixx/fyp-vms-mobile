import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  final Color _primaryColor = const Color.fromARGB(255, 12, 25, 70);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: _primaryColor,
        body: Container(
          alignment: Alignment(0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                child: Image.asset(
                  'assets/images/utem_logo.png',
                  height: 100,
                ),
              ),
              Text(
                'VMS UTeM',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
