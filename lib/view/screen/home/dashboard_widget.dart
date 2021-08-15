import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/authentication/bloc/authentication_bloc.dart';
import 'package:vms/view/screen/complaint/list/bloc/list_bloc.dart';
import 'package:vms/view/screen/complaint/list/list_screen.dart';
import 'package:vms/view/screen/home/sumarry_stats_widget.dart';
import 'package:vms/view/screen/scan_qr/qr_detected_display.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromARGB(255, 12, 25, 70);

    return BlocBuilder<ListBloc, ListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return LoadingScreen(
            description: 'Loading Data...',
          );
        }

        return Column(
          children: [
            Container(
              color: primaryColor,
              // height: (screenSize.height / 3),
              padding: EdgeInsets.fromLTRB(10, 20, 10, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SafeArea(
                    child: Stack(
                      children: [
                        BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          builder: (context, state) => Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Hi, ${state.user?.name ?? 'User'}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 24,
                          color: Colors.white,
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: Icon(
                            Icons.menu,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SummaryStatsWidget(
                            title: 'Pending Complaints',
                            value: '${state.complaintStats.pending}'),
                        SummaryStatsWidget(
                            title: 'Processed Complaints',
                            value: '${state.complaintStats.processed}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ListScreenUI(),
            )
          ],
        );
      },
    );
  }
}
