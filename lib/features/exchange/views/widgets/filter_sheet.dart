import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gweiland_app/features/exchange/bloc/exchange_bloc.dart';
import 'package:gweiland_app/utils/application/core/enums.dart';
import 'package:gweiland_app/utils/buttons/primary_icon_button.dart';
import 'package:gweiland_app/utils/presentation/sheets/sheets.dart';
import 'package:gweiland_app/utils/presentation/widgets/primary_chip.dart';
import 'package:gweiland_app/utils/ui_constants.dart';
import 'package:gweiland_app/utils/ui_helpers.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showFilterSheet<T extends Object?>(
  BuildContext context, {
  required ExchangeBloc bloc,
}) async {
  return showSheet<void>(
    context,
    child: BlocProvider.value(
      value: bloc,
      child: _FilterSheet(),
    ),
  );
}

class _FilterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.baseMargin * 3,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Filter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          verticalSpaceMedium,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: UIConstants.baseMargin,
                  ),
                  child: Text('Sort Type: '),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                flex: 3,
                child: BlocBuilder<ExchangeBloc, ExchangeState>(
                  builder: (context, state) {
                    return Wrap(
                      spacing: UIConstants.baseMargin,
                      runSpacing: UIConstants.baseMargin,
                      children: SortType.values.map((e) {
                        return PrimaryChip(
                          label: getSortTypeString(e),
                          inSheet: true,
                          labelPadding: const EdgeInsets.symmetric(
                            vertical: UIConstants.baseMargin * 1.3,
                            horizontal: UIConstants.baseMargin * 3,
                          ),
                          focused: state.sortType == e,
                          onTap: () => onFilterSelect(
                            context,
                            sortType: e,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
          verticalSpaceRegular,
          Divider(
            color: Colors.black.withOpacity(0.4),
          ),
          verticalSpaceRegular,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: UIConstants.baseMargin,
                  ),
                  child: Text('Sort By: '),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                flex: 3,
                child: BlocBuilder<ExchangeBloc, ExchangeState>(
                  builder: (context, state) {
                    return Wrap(
                      spacing: UIConstants.baseMargin,
                      runSpacing: UIConstants.baseMargin,
                      children: SortBy.values.map((e) {
                        return PrimaryChip(
                          label: getSortByString(e),
                          inSheet: true,
                          focused: state.sortBy == e,
                          labelPadding: const EdgeInsets.symmetric(
                            vertical: UIConstants.baseMargin,
                            horizontal: UIConstants.baseMargin * 3,
                          ),
                          onTap: () => onFilterSelect(
                            context,
                            sortBy: e,
                          ),
                          leadingIconButton: PrimaryIconButton(
                            icon: getSortByIcon(e),
                            iconSize: UIConstants.baseIconSize * 0.8,
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
          verticalSpaceRegular,
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }

  String getSortTypeString(SortType val) {
    switch (val) {
      case SortType.price:
        return 'Price';
      case SortType.market_cap:
        return 'Market Cap';
      case SortType.percent_change_24h:
        return '% Change in 24 hrs';
    }
  }

  String getSortByString(SortBy val) {
    switch (val) {
      case SortBy.asc:
        return 'Low to High';
      case SortBy.desc:
        return 'High to Low';
    }
  }

  IconData getSortByIcon(SortBy val) {
    switch (val) {
      case SortBy.asc:
        return PhosphorIcons.sortAscending();
      case SortBy.desc:
        return PhosphorIcons.sortDescending();
    }
  }

  void onFilterSelect(
    BuildContext context, {
    SortType? sortType,
    SortBy? sortBy,
  }) {
    Navigator.pop(context);
    context.read<ExchangeBloc>().add(
          SetFilters(
            sortType: sortType,
            sortby: sortBy,
          ),
        );
  }
}
