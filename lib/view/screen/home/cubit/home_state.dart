part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState({this.currentScreenIndex = 0});

  final int currentScreenIndex;

  @override
  List<Object> get props => [currentScreenIndex];
}

class HomeInitial extends HomeState {
  const HomeInitial({int currentScreenIndex = 0})
      : super(currentScreenIndex: currentScreenIndex);
}

class HomeScreenIndexChanged extends HomeState {
  const HomeScreenIndexChanged({required int currentScreenIndex})
      : super(currentScreenIndex: currentScreenIndex);
}
