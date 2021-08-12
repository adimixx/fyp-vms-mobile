import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/authentication/bloc/authentication_bloc.dart';

class DrawerDefault extends StatelessWidget {
  const DrawerDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final header = (name, email) => UserAccountsDrawerHeader(
          accountName: Text(
            '$name',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
          accountEmail: Text('$email',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white70)),
        );

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return ListView(
          children: [
            header(state.user?.name ?? null, state.user?.email ?? null),
            ListTile(
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              leading: Icon(Icons.logout),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLogoutRequested());
              },
            )
          ],
        );
      },
    );
  }
}
