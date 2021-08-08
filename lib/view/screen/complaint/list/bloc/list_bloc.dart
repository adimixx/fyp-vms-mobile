import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vms/logic/complaint/repository/complaint_repository.dart';
import 'package:vms/models/complaint.dart';
import 'package:vms/models/complaint_stats.dart';
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
    try {
      final ComplaintStats _complaintStats =
          await complaintRepository.getComplaintStats();

      final List<Complaint> _complaintList =
          await complaintRepository.getComplaintList();

      return ListState.listLoaded(_complaintList, _complaintStats);
    } catch (e) {
      print(e.toString());
      return ListState.exception(message: e.toString());
    }
  }
}
