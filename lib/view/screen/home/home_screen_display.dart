import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/app/bloc/app_bloc.dart';
import 'package:vms/view/screen/complaint/list/bloc/list_bloc.dart';
import 'package:vms/view/screen/home/cubit/home_cubit.dart';
import 'package:vms/view/screen/home/dashboard_widget.dart';

class HomeScreenDisplay extends StatelessWidget {
  const HomeScreenDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = BlocProvider.of<HomeCubit>(context).state.currentScreenIndex;

    if (index == 0) {
      return BlocConsumer<AppBloc, AppState>(
        builder: (context, state) => DashboardWidget(),
        listener: (context, state) {
          if (state is AppDataChanged && state.message != null) {
            BlocProvider.of<ListBloc>(context)..add(GetListEvent());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.message}'),
              ),
            );
          }
        },
      );
    } else if (index == 1) {}

    return Container(
      child: null,
    );
  }
}
