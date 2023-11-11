part of '../exchange_screen.dart';

class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({super.key});

  @override
  State<SearchAndFilter> createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: StatefulBuilder(
                  builder: (context, changeState) {
                    return TextFormField(
                      controller: _controller,
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
                        suffixIcon: _controller.text.isNotEmpty
                            ? PrimaryIconButton(
                                onTap: () {
                                  onSearch(context, '');

                                  _controller.clear();

                                  changeState(() {});
                                },
                                icon: PhosphorIcons.x(),
                                iconColor: Colors.black,
                                iconSize: UIConstants.baseIconSize * 0.8,
                              )
                            : const SizedBox.shrink(),
                      ),
                      onChanged: (val) {
                        onSearch(context, val);

                        changeState(() {});
                      },
                    );
                  },
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

  void onSearch(BuildContext context, String val) {
    context.read<ExchangeBloc>().add(
          LocalSearchCoin(val: val),
        );
  }

  void onFilterTap(BuildContext context) {
    showFilterSheet(
      context,
      bloc: context.read<ExchangeBloc>(),
    );
  }
}
