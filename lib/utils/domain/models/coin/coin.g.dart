// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      quote: json['quote'] == null
          ? CoinQuote.empty
          : CoinQuote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'quote': instance.quote,
    };
