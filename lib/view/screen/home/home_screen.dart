import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/authentication/bloc/authentication_bloc.dart';
import 'package:vms/logic/complaint/repository/complaint_repository.dart';
import 'package:vms/view/screen/complaint/list/bloc/list_bloc.dart';
import 'package:vms/view/screen/complaint/list/list_screen.dart';
import 'package:vms/view/screen/home/cubit/home_cubit.dart';
import 'package:vms/view/screen/home/dashboard_widget.dart';
import 'package:vms/view/screen/home/scan_car_widget.dart';

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
    const bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: const Icon(Icons.list), label: 'List'),
      BottomNavigationBarItem(icon: const Icon(Icons.qr_code), label: 'Scan')
    ];

    var screenSize = MediaQuery.of(context).size;
    Color primaryColor = Color.fromARGB(255, 12, 25, 70);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light));

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavigationBarItems,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedItemColor: Colors.white,
          backgroundColor: primaryColor,
          currentIndex: state.currentScreenIndex,
          onTap: (_index) => BlocProvider.of<HomeCubit>(context)
              .onBottomNavigationBarTap(index: _index),
        ),
        body: SafeArea(
          child: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: (state.currentScreenIndex == 0)
                ? DashboardWidget()
                : ScanCarWidget(),
          ),
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
