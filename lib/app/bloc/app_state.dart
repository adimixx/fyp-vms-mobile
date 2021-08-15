part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState({this.randomNum});

  final int? randomNum;

  @override
  List<Object?> get props => [randomNum];
}

class AppInitial extends AppState {}

class AppDataChanged extends AppState {
  const AppDataChanged({required int randomNum, this.message})
      : super(randomNum: randomNum);

  final String? message;

  @override
  List<Object?> get props => [randomNum, message];
}
