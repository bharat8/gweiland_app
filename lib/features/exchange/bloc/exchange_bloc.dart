import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gweiland_app/features/exchange/repository/exchange_repository.dart';
import 'package:gweiland_app/utils/application/core/enums.dart';
import 'package:gweiland_app/utils/application/core/event_transformers/debounce_restartable.dart';
import 'package:gweiland_app/utils/application/core/event_transformers/throttle_droppable.dart';
import 'package:gweiland_app/utils/application/core/status/status.dart';
import 'package:gweiland_app/utils/domain/models/coin/coin.dart';
import 'package:injectable/injectable.dart';

part 'exchange_event.dart';
part 'exchange_state.dart';

@injectable
class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc(this._repository) : super(const ExchangeState()) {
    on<SelectCoinType>(_onSelectCoinType);
    on<FetchLatestCoins>(
      _onFetchLatestCoins,
      transformer: throttleDroppable(),
    );
    on<SetFilters>(_onSetFilters);
    on<LocalSearchCoin>(
      _onLocalSearchCoin,
      transformer: debounceRestartable(),
    );
  }

  final IExchangeRepository _repository;

  void _onSelectCoinType(
    SelectCoinType event,
    Emitter<ExchangeState> emit,
  ) {
    emit(state.copyWith(type: event.type));
  }

  Future<void> _onFetchLatestCoins(
    FetchLatestCoins event,
    Emitter<ExchangeState> emit,
  ) async {
    emit(
      state.copyWith(
        latestCoinsStatus: const Status.loading(),
      ),
    );

    final failureOrCoinsList = await _repository.getLatestCoinsList(
      sortType: state.sortType.name,
      sortBy: state.sortBy.name,
    );

    emit(
      failureOrCoinsList.fold(
        (f) => state.copyWith(
          latestCoinsStatus: Status.failure(f),
        ),
        (latestCoins) => state.copyWith(
          latestCoinsStatus: const Status.success(),
          latestCoins: latestCoins,
        ),
      ),
    );
  }

  void _onSetFilters(
    SetFilters event,
    Emitter<ExchangeState> emit,
  ) {
    emit(
      state.copyWith(
        sortType: event.sortType,
        sortBy: event.sortby,
      ),
    );

    add(FetchLatestCoins());
  }

  void _onLocalSearchCoin(
    LocalSearchCoin event,
    Emitter<ExchangeState> emit,
  ) {
    emit(
      state.copyWith(
        searchedText: event.val,
        searchedList: event.val.isNotEmpty
            ? List.of(state.latestCoins)
                .where(
                  (e) =>
                      e.name.toLowerCase().contains(event.val.toLowerCase()) ||
                      e.symbol.toLowerCase().contains(event.val.toLowerCase()),
                )
                .toList()
            : [],
      ),
    );
  }
}
