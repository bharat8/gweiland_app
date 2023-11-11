// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:gweiland_app/utils/domain/core/endpoints.dart';
import 'package:gweiland_app/utils/domain/models/coin/coin.dart';
import 'package:gweiland_app/utils/infrastructure/core/api_client.dart';
import 'package:gweiland_app/utils/infrastructure/core/failures/failures.dart';
import 'package:gweiland_app/utils/infrastructure/decoders/decoder.dart';
import 'package:injectable/injectable.dart';

abstract class IExchangeRepository {
  Future<Either<Failure, List<Coin>>> getLatestCoinsList({
    required String sortType,
    required String sortBy,
  });
}

@LazySingleton(as: IExchangeRepository)
class ExchangeRepository implements IExchangeRepository {
  @override
  Future<Either<Failure, List<Coin>>> getLatestCoinsList({
    required String sortType,
    required String sortBy,
  }) async {
    try {
      final response = await ApiClient.get(
        '${Endpoints.apiUrl}${Endpoints.latestListing}'
        '?start=1&limit=20&sort=$sortType&sort_dir=$sortBy',
      );

      final person = Decoders.decodeCoinsList(
        response.body,
      );

      return right(person);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
