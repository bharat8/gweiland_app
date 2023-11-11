part of 'exchange_bloc.dart';

class ExchangeEvent extends Equatable {
  const ExchangeEvent();

  @override
  List<Object?> get props => [];
}

class SelectCoinType extends ExchangeEvent {
  const SelectCoinType({required this.type});

  final CoinType type;

  @override
  List<Object?> get props => [type];
}

class FetchLatestCoins extends ExchangeEvent {}

class SetFilters extends ExchangeEvent {
  const SetFilters({
    this.sortType,
    this.sortby,
  });

  final SortType? sortType;
  final SortBy? sortby;

  @override
  List<Object?> get props => [sortType];
}
