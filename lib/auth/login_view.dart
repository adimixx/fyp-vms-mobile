import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/bootstrap/form/password_field.dart';
import 'package:vms/cubit/user_cubit.dart';

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
                controller:
                    BlocProvider.of<UserCubit>(context).state.emailController,
                decoration: InputDecoration(
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Email'),
              ),
              margin: EdgeInsets.only(bottom: 20),
            ),
            Container(
                child: PasswordField(
              controller:
                  BlocProvider.of<UserCubit>(context).state.passwordController,
              labelText: 'Password',
            )),
            BlocListener<UserCubit, UserState>(
              listener: (context, state) {
                print(state.email);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Email : ${state.email} , Password: ${state.password}'),
                    duration: Duration(seconds: 10)));
              },
              child: Container(
                child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    BlocProvider.of<UserCubit>(context).onLoginClicked();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
