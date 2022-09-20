/// external package
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// core package
import 'package:flutter/material.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());

  static BottomNavigationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  /// User

  int currentIndexUser = 0;
  void changeIndexUser(int index) {
    currentIndexUser = index;
    emit(ChangeItemBottomNavigationUser(index));
  }

  /// Worker

  int currentIndexWorker = 0;
  void changeIndexWorker(int index) {
    currentIndexWorker = index;
    emit(ChangeItemBottomNavigationWorker(index));
  }
}
