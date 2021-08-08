import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vms/logic/complaint/repository/complaint_repository.dart';
import 'package:vms/models/complaint.dart';
part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc({required this.complaintRepository}) : super(ListState.empty());

  final ComplaintRepository complaintRepository;

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    if (event is GetListEvent) {
      yield ListState.listLoading();
      yield await _mapGetListEventToState();
    } else if (event is GetSearchListEvent) {
      yield ListState.listLoading();
      yield await _mapGetListEventToState();
    }
  }

  Future<ListState> _mapGetListEventToState() async {
    // try {
    final List<Complaint> _complaintList =
        await complaintRepository.getComplaintList();

    final List<Widget> _complaintListTile = _complaintList
        .map(
          (e) => ListTile(
            title: Text(
              '${e.name}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${e.vehicleInventory?.regWithName}'),
          ),
        )
        .toList();

    return ListState.listLoaded(_complaintList, _complaintListTile);
    // } catch (e) {
    //   return ListState.exception(message: e.toString());
    // }
  }
}
