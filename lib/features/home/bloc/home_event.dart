part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class SelectTab extends HomeEvent {
  const SelectTab({required this.tab});

  final AppTabs tab;

  @override
  List<Object?> get props => [tab];
}
