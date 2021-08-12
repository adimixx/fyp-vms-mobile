import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/complaint/repository/complaint_repository.dart';
import 'package:vms/models/complaint.dart';
import 'package:vms/view/screen/complaint/list/bloc/list_bloc.dart';
import 'package:vms/view/screen/complaint/show/complaint_show_screen.dart';

class ListScreenUI extends StatefulWidget {
  const ListScreenUI({Key? key}) : super(key: key);

  @override
  _ListScreenUIState createState() => _ListScreenUIState();
}

class _ListScreenUIState extends State<ListScreenUI> {
  Widget complaintListView(
      {required BuildContext context, List<Complaint>? e}) {
    return Scrollbar(
      child: SizedBox(
        height: 450.0,
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            itemBuilder: (context, i) {
              var _complaint = e![i];
              return ListTile(
                title: Text(
                  '${_complaint.name}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${_complaint.vehicleInventory?.regWithName}'),
                      Badge(
                        shape: BadgeShape.square,
                        toAnimate: false,
                        badgeColor: _complaint.status!.bgColor,
                        badgeContent: Text(
                          '${_complaint.status!.name.toUpperCase()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed(
                  '/complaint/show',
                  arguments: ComplaintShowScreenArgs(complaint: _complaint),
                ),
              );
            },
            separatorBuilder: (_ctx, _i) => const Divider(
                  color: Colors.black,
                ),
            itemCount: e?.length ?? 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              'List of Complaints',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          BlocConsumer<ListBloc, ListState>(
            builder: (_ctx, state) =>
                complaintListView(context: context, e: state.complaintList),
            listener: (context, state) {
              switch (state.isLoading) {
                case true:
                  print('loading Data');
                  break;
                default:
                  print(
                      'Data loaded - total data: ${state.complaintList?.length ?? 0}');
              }
            },
          ),
        ],
      ),
    );
  }
}
