import 'package:flutter/material.dart';
import 'package:vms/app.dart';

import 'logic/authentication/repository/authentication_repository.dart';
import 'logic/authentication/repository/user_repository.dart';

void main() {
  runApp(
    App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   final AppRouter _appRouter = AppRouter();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<UserCubit>(
//       create: (_) => UserCubit(),
//       child: MaterialApp(
//         onGenerateRoute: _appRouter.onGenerateRoute,
//       ),
//     );
//   }
// }
