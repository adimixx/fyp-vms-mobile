import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/complaint/repository/complaint_repository.dart';
import 'package:vms/models/complaint.dart';
import 'package:vms/view/screen/complaint/list/bloc/list_bloc.dart';

class ListScreenUI extends StatefulWidget {
  const ListScreenUI({Key? key}) : super(key: key);

  @override
  _ListScreenUIState createState() => _ListScreenUIState();
}

class _ListScreenUIState extends State<ListScreenUI> {
  Widget complaintListView({List<Complaint>? e}) {
    return Scrollbar(
      child: SizedBox(
        height: 450.0,
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            itemBuilder: (context, i) => ListTile(
                  title: Text(
                    '${e?[i].name}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${e?[i].vehicleInventory?.regWithName}'),
                ),
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
            builder: (context, state) =>
                complaintListView(e: state.complaintList),
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

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);

  ComplaintRepository _complaintRepository = ComplaintRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListBloc>(
      create: (_) => ListBloc(complaintRepository: _complaintRepository)
        ..add(GetListEvent()),
      child: ListScreenUI(),
    );
  }
}
