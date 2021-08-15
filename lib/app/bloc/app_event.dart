part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppComplaintPost extends AppEvent {
  const AppComplaintPost({required this.message}) : super();

  final String message;

  @override
  List<Object> get props => [message];
}
