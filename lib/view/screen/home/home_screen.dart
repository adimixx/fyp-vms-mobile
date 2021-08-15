import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/complaint/repository/complaint_repository.dart';
import 'package:vms/view/screen/complaint/list/bloc/list_bloc.dart';
import 'package:vms/view/screen/home/cubit/home_cubit.dart';
import 'package:vms/view/screen/home/home_screen_display.dart';
import 'package:vms/view/screen/widget/asset/drawer_default.dart';

class _HomeScreenUI extends StatefulWidget {
  const _HomeScreenUI({Key? key}) : super(key: key);

  @override
  __HomeScreenUIState createState() => __HomeScreenUIState();
}

class __HomeScreenUIState extends State<_HomeScreenUI> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        body: PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: HomeScreenDisplay(),
        ),
        drawer: Drawer(
          child: DrawerDefault(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ComplaintRepository _complaintRepository = ComplaintRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ListBloc>(
          create: (_) => ListBloc(complaintRepository: _complaintRepository)
            ..add(GetListEvent()),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(),
        )
      ],
      child: _HomeScreenUI(),
    );
  }
}
