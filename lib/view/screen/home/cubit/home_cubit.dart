import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void onChangeHomeSceenPage({required int index}) {
    emit(HomeScreenIndexChanged(currentScreenIndex: index));
  }

  void onDataChange({String? message}) {
    emit(HomeScreenDataChanged(message: message));
  }
}
