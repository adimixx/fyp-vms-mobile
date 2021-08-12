import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/authentication/bloc/authentication_bloc.dart';
import 'package:vms/logic/authentication/repository/authentication_repository.dart';
import 'package:vms/view/screen/authentication/login/cubit/login_screen_cubit.dart';
import 'package:vms/view/screen/widget/asset/logo_full.dart';
import 'package:vms/view/screen/widget/form/bs_text_field.dart';
import 'package:vms/view/screen/widget/form/password_field.dart';

class LoginScreenUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).primaryColorDark,
                Theme.of(context).primaryColorLight,
              ]),
        ),
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0, top: 20.0),
                        child: LogoFull(),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                        child: BlocConsumer<LoginScreenCubit, LoginScreenState>(
                          listener: (context, state) {},
                          builder: (context, state) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: BsTextField(
                                  borderRadius: 10,
                                  controller: state.emailController,
                                  labelText: "Email Address",
                                ),
                                margin: EdgeInsets.only(bottom: 20),
                              ),
                              Container(
                                child: BsTextField(
                                  borderRadius: 10,
                                  controller: state.passwordController,
                                  labelText: "Password",
                                  hasTextObscure: true,
                                ),
                                margin: EdgeInsets.only(bottom: 20),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                  child: Text('Login'),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context).primaryColor),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(vertical: 14),
                                    ),
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<LoginScreenCubit>(context)
                                        .onLogin();
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  thickness: 0.7,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Register New Account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
