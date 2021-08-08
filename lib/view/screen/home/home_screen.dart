import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/authentication/bloc/authentication_bloc.dart';
import 'package:vms/view/screen/complaint/list/list_screen.dart';
import 'package:vms/view/screen/complaint/list_pending/list_pending_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget sumarryStats({required String title, required String value}) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              '$title',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            child: Text(
              '$value',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    Color primaryColor = Color.fromARGB(255, 12, 25, 70);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light));

    const bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: const Icon(Icons.list), label: 'List'),
      BottomNavigationBarItem(icon: const Icon(Icons.qr_code), label: 'Scan')
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        backgroundColor: primaryColor,
        currentIndex: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              // height: (screenSize.height / 3),
              padding: EdgeInsets.fromLTRB(10, 20, 10, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Hi, ${BlocProvider.of<AuthenticationBloc>(context).state.user?.name ?? 'User'}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        sumarryStats(title: 'Pending Complaints', value: '10'),
                        sumarryStats(
                            title: 'Processed Complaints', value: '20'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ListScreen(),
            )
          ],
        ),
      ),
    );
  }
}
