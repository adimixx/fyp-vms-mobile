import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/authentication/bloc/authentication_bloc.dart';
import 'package:vms/logic/authentication/repository/authentication_repository.dart';
import 'package:vms/view/screen/authentication/login/cubit/login_screen_cubit.dart';
import 'package:vms/view/screen/widget/form/password_field.dart';

class LoginScreenUI extends StatelessWidget {
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
                controller: BlocProvider.of<LoginScreenCubit>(context)
                    .state
                    .emailController,
                decoration: InputDecoration(
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Email'),
              ),
              margin: EdgeInsets.only(bottom: 20),
            ),
            Container(
                child: PasswordField(
              controller: BlocProvider.of<LoginScreenCubit>(context)
                  .state
                  .passwordController,
              labelText: 'Password',
            )),
            MultiBlocListener(
              listeners: [
                BlocListener<LoginScreenCubit, LoginScreenState>(
                    listener: (context, state) {}),
                BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                  if (state.authenticationStatus ==
                      AuthenticationStatus.authenticated) {
                    print('User Authenticated!');
                  }
                }),
              ],
              child: Container(
                child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    BlocProvider.of<LoginScreenCubit>(context).onLogin();
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

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginScreenCubit>(
      create: (context) => LoginScreenCubit(
          authenticationRepository: BlocProvider.of<AuthenticationBloc>(context)
              .authenticationRepository),
      child: LoginScreenUI(),
    );
  }
}
