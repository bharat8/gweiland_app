part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.tab = AppTabs.exchange,
  });

  final AppTabs tab;

  HomeState copyWith({
    AppTabs? tab,
  }) {
    return HomeState(
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object> get props => [tab];

  @override
  String toString() => 'HomeState(tab: $tab)';
}
