part of 'bottom_navigation_cubit.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BottomNavigationInitial extends BottomNavigationState {}

/// User

class ChangeItemBottomNavigationUser extends BottomNavigationState {
  final int index;

  ChangeItemBottomNavigationUser(this.index);

  @override
  List<Object?> get props => [index];
}

/// Worker

class ChangeItemBottomNavigationWorker extends BottomNavigationState {
  final int index;

  ChangeItemBottomNavigationWorker(this.index);

  @override
  List<Object?> get props => [index];
}
