part of '../exchange_screen.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextFormField(
                  scrollPadding: EdgeInsets.zero,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Search Cryptocurrency',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    filled: true,
                    fillColor: const Color(0xff0b0b0b).withOpacity(0.05),
                    prefixIcon: PrimaryIconButton(
                      icon: PhosphorIcons.magnifyingGlass(),
                      iconColor: Colors.black,
                      iconSize: UIConstants.baseIconSize * 0.8,
                    ),
                    contentPadding: EdgeInsets.zero,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: UIConstants.largeBorderRadius,
                    ),
                  ),
                  onChanged: (val) {},
                ),
              ),
              horizontalSpaceRegular,
              GestureDetector(
                onTap: () => onFilterTap(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: UIConstants.baseMargin,
                    horizontal: UIConstants.baseMargin * 1.5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: UIConstants.largeBorderRadius,
                    border: Border.all(
                      color: const Color(0xff0b0b0b).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      PrimaryIconButton(
                        icon: PhosphorIcons.funnelSimple(),
                        iconSize: UIConstants.baseIconSize * 0.8,
                        iconColor: const Color(0xff0b0b0b).withOpacity(0.6),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        'Filter',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        BlocBuilder<ExchangeBloc, ExchangeState>(
          builder: (context, state) {
            return Row(
              children: CoinType.values.map((type) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: UIConstants.baseMargin,
                  ),
                  child: GestureDetector(
                    onTap: () => context.read<ExchangeBloc>().add(
                          SelectCoinType(type: type),
                        ),
                    child: Text(
                      type.name,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: type == state.type
                                    ? null
                                    : const Color.fromRGBO(11, 11, 11, 0.3),
                              ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        )
      ],
    );
  }

  void onFilterTap(BuildContext context) {
    showFilterSheet(
      context,
      bloc: context.read<ExchangeBloc>(),
    );
  }
}
