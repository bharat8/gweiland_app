// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:gweiland_app/features/exchange/bloc/exchange_bloc.dart' as _i5;
import 'package:gweiland_app/features/exchange/repository/exchange_repository.dart'
    as _i4;
import 'package:gweiland_app/features/home/bloc/home_bloc.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HomeBloc>(() => _i3.HomeBloc());
    gh.lazySingleton<_i4.IExchangeRepository>(() => _i4.ExchangeRepository());
    gh.factory<_i5.ExchangeBloc>(
        () => _i5.ExchangeBloc(gh<_i4.IExchangeRepository>()));
    return this;
  }
}
