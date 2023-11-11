import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_app/features/exchange/bloc/exchange_bloc.dart';
import 'package:gweiland_app/features/exchange/views/widgets/filter_sheet.dart';
import 'package:gweiland_app/utils/app_colors.dart';
import 'package:gweiland_app/utils/application/core/enums.dart';
import 'package:gweiland_app/utils/buttons/buttons.dart';
import 'package:gweiland_app/utils/domain/core/endpoints.dart';
import 'package:gweiland_app/utils/domain/models/coin/coin.dart';
import 'package:gweiland_app/utils/injector/injector.dart';
import 'package:gweiland_app/utils/presentation/shapes/bearish_curve.dart';
import 'package:gweiland_app/utils/presentation/shapes/bullish_curve.dart';
import 'package:gweiland_app/utils/presentation/shimmers/skeleton.dart';
import 'package:gweiland_app/utils/presentation/widgets/failure_widget.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:gweiland_app/utils/ui_helpers.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

part 'widgets/search_and_filter.dart';
part 'widgets/coins_list_view.dart';
part 'widgets/coin_item.dart';
part 'widgets/top_coin_item.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ExchangeBloc>(),
      child: _ExchangeView(),
    );
  }
}

class _ExchangeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.baseMargin * 3,
      ),
      child: Column(
        children: const [
          SearchAndFilter(),
          verticalSpaceRegular,
          Expanded(child: CoinsListView()),
        ],
      ),
    );
  }
}
