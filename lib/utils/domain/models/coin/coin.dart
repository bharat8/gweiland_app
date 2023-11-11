import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:gweiland_app/utils/domain/core/helpers.dart';
import 'package:gweiland_app/utils/domain/models/coin_quote/coin_quote.dart';

part 'coin.g.dart';

@JsonSerializable()
class Coin extends Equatable {
  const Coin({
    this.id = -1,
    this.name = '',
    this.symbol = '',
    this.quote = CoinQuote.empty,
  });

  factory Coin.fromJson(JsonMap json) => _$CoinFromJson(json);
  JsonMap toJson() => _$CoinToJson(this);

  final int id;
  final String name;
  final String symbol;
  final CoinQuote quote;

  static const empty = Coin();

  Coin copyWith({
    int? id,
    String? name,
    String? symbol,
    CoinQuote? quote,
  }) {
    return Coin(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      quote: quote ?? this.quote,
    );
  }

  @override
  List<Object> get props => [id, name, symbol, quote];
}
