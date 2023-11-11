import 'package:equatable/equatable.dart';
import 'package:gweiland_app/utils/domain/core/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_quote.g.dart';

class CoinQuoteFields {
  const CoinQuoteFields._();

  static const usd = 'USD';
  static const percentChange24h = 'percent_change_24h';
}

@JsonSerializable()
class CoinQuote extends Equatable {
  const CoinQuote({
    this.usd = CoinQuoteUsd.empty,
  });

  factory CoinQuote.fromJson(JsonMap json) => _$CoinQuoteFromJson(json);
  JsonMap toJson() => _$CoinQuoteToJson(this);

  @JsonKey(name: CoinQuoteFields.usd)
  final CoinQuoteUsd usd;

  static const empty = CoinQuote();

  CoinQuote copyWith({
    CoinQuoteUsd? usd,
  }) {
    return CoinQuote(
      usd: usd ?? this.usd,
    );
  }

  @override
  List<Object> get props => [usd];
}

@JsonSerializable()
class CoinQuoteUsd extends Equatable {
  const CoinQuoteUsd({
    this.price = 0,
    this.percentChange24h = 0,
  });

  factory CoinQuoteUsd.fromJson(JsonMap json) => _$CoinQuoteUsdFromJson(json);
  JsonMap toJson() => _$CoinQuoteUsdToJson(this);

  final double price;

  @JsonKey(name: CoinQuoteFields.percentChange24h)
  final double percentChange24h;

  static const empty = CoinQuoteUsd();

  CoinQuoteUsd copyWith({
    double? price,
    double? percentChange24h,
  }) {
    return CoinQuoteUsd(
      price: price ?? this.price,
      percentChange24h: percentChange24h ?? this.percentChange24h,
    );
  }

  @override
  List<Object> get props => [price, percentChange24h];
}
