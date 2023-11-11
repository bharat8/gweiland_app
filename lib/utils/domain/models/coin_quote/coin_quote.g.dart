// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinQuote _$CoinQuoteFromJson(Map<String, dynamic> json) => CoinQuote(
      usd: json['USD'] == null
          ? CoinQuoteUsd.empty
          : CoinQuoteUsd.fromJson(json['USD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinQuoteToJson(CoinQuote instance) => <String, dynamic>{
      'USD': instance.usd,
    };

CoinQuoteUsd _$CoinQuoteUsdFromJson(Map<String, dynamic> json) => CoinQuoteUsd(
      price: (json['price'] as num?)?.toDouble() ?? 0,
      percentChange24h: (json['percent_change_24h'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$CoinQuoteUsdToJson(CoinQuoteUsd instance) =>
    <String, dynamic>{
      'price': instance.price,
      'percent_change_24h': instance.percentChange24h,
    };
