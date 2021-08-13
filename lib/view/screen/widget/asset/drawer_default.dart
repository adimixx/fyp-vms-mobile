import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/authentication/bloc/authentication_bloc.dart';
import 'package:vms/view/screen/home/cubit/home_cubit.dart';
import 'package:vms/view/screen/widget/asset/logo_full.dart';

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

    final pageItem = (
            {required String label, required Icon icon, Function()? onTap}) =>
        ListTile(
            title: Text(
              '$label',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            leading: icon,
            onTap: () {
              Navigator.pop(context);
              onTap!();
            });

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Column(
          children: [
            header(state.user?.name ?? null, state.user?.email ?? null),
            Expanded(
              child: ListView(
                children: [
                  pageItem(
                    label: 'Complaint List',
                    icon: Icon(Icons.list),
                    onTap: () => BlocProvider.of<HomeCubit>(context)
                        .onChangeHomeSceenPage(index: 0),
                  ),
                  pageItem(
                    label: 'Scan',
                    icon: Icon(Icons.qr_code),
                    onTap: () => Navigator.of(context).pushNamed('/qr'),
                  ),
                  pageItem(
                    label: 'Logout',
                    icon: Icon(Icons.logout),
                    onTap: () =>
                        BlocProvider.of<AuthenticationBloc>(context).add(
                      AuthenticationLogoutRequested(),
                    ),
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 0.7,
              child: Container(
                child: LogoFull(),
              ),
            ),
          ],
        );
      },
    );
  }
}
