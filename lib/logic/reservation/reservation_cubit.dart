import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  static ReservationCubit get(BuildContext context) => BlocProvider.of(context);

  /// User
  int currentIndexUser = 0;

  void chagenIndexUser(int index) {
    currentIndexUser = index;
    emit(ChangePageUser(index));
  }

  /// Worker

  int currentIndexRequestWorker = 0;

  void chagenIndexRequestWorker(int index) {
    currentIndexRequestWorker = index;
    emit(ChangePageRequestWorker(index));
  }

  int currentIndexEXOrdersWorker = 0;

  void chagenIndexExOrdersWorker(int index) {
    currentIndexEXOrdersWorker = index;
    emit(ChangePageExOrderWorker(index));
  }
}
