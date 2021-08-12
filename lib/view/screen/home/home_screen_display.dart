import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/view/screen/home/cubit/home_cubit.dart';
import 'package:vms/view/screen/home/dashboard_widget.dart';

class HomeScreenDisplay extends StatelessWidget {
  const HomeScreenDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = BlocProvider.of<HomeCubit>(context).state.currentScreenIndex;

    if (index == 0) {
      return DashboardWidget();
    } else if (index == 1) {}

    return Container(
      child: null,
    );
  }
}
