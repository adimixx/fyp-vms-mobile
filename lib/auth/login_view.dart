import 'package:flutter/material.dart';
import 'package:testflut/bootstrap/form/password_field.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white24),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/utem_logo.png',
                    height: 100,
                  ),
                  Text(
                    'VMS UTeM',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Email'),
              ),
              margin: EdgeInsets.only(bottom: 20),
            ),
            Container(
                child: PasswordField(
              labelText: 'Password',
            )),
            Container(
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
