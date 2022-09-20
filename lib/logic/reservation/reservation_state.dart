part of 'reservation_cubit.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

/// User

class ChangePageUser extends ReservationState {
  final int index;

  const ChangePageUser(this.index);

  @override
  List<Object> get props => [index];
}

/// Wroker

class ChangePageRequestWorker extends ReservationState {
  final int index;

  const ChangePageRequestWorker(this.index);

  @override
  List<Object> get props => [index];
}

class ChangePageExOrderWorker extends ReservationState {
  final int index;

  const ChangePageExOrderWorker(this.index);

  @override
  List<Object> get props => [index];
}
