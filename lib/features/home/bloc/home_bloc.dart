import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gweiland_app/utils/application/core/enums.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<SelectTab>(_onSelectTab);
  }

  void _onSelectTab(
    SelectTab event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(tab: event.tab));
  }
}
