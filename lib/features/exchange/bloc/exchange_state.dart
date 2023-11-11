// ignore_for_file: lines_longer_than_80_chars

part of 'exchange_bloc.dart';

class ExchangeState extends Equatable {
  const ExchangeState({
    this.type = CoinType.Cryptocurrency,
    this.latestCoins = const [],
    this.latestCoinsStatus = const Status.initial(),
    this.searchedText = '',
    this.searchedList = const [],
    this.sortType = SortType.market_cap,
    this.sortBy = SortBy.desc,
  });
  final CoinType type;

  final List<Coin> latestCoins;
  final Status latestCoinsStatus;

  final String searchedText;
  final List<Coin> searchedList;

  final SortType sortType;
  final SortBy sortBy;

  ExchangeState copyWith({
    CoinType? type,
    List<Coin>? latestCoins,
    Status? latestCoinsStatus,
    String? searchedText,
    List<Coin>? searchedList,
    SortType? sortType,
    SortBy? sortBy,
  }) {
    return ExchangeState(
      type: type ?? this.type,
      latestCoins: latestCoins ?? this.latestCoins,
      latestCoinsStatus: latestCoinsStatus ?? this.latestCoinsStatus,
      searchedText: searchedText ?? this.searchedText,
      searchedList: searchedList ?? this.searchedList,
      sortType: sortType ?? this.sortType,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  @override
  List<Object> get props {
    return [
      type,
      latestCoins,
      latestCoinsStatus,
      searchedText,
      searchedList,
      sortType,
      sortBy,
    ];
  }

  @override
  String toString() {
    return 'ExchangeState(type: $type, latestCoins: $latestCoins, latestCoinsStatus: $latestCoinsStatus, searchedText: $searchedText, searchedList: $searchedList, sortType: $sortType, sortBy: $sortBy)';
  }
}
