part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends ListEvent {}

class GetSearchListEvent extends ListEvent {
  final String query;

  const GetSearchListEvent({required this.query});
}
