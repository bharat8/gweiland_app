part of '../exchange_screen.dart';

class CoinsListView extends StatefulWidget {
  const CoinsListView({super.key});

  @override
  State<CoinsListView> createState() => _CoinsListViewState();
}

class _CoinsListViewState extends State<CoinsListView> {
  @override
  void initState() {
    fetchCoins();
    super.initState();
  }

  void fetchCoins() {
    context.read<ExchangeBloc>().add(FetchLatestCoins());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExchangeBloc, ExchangeState>(
      builder: (context, state) {
        return state.latestCoinsStatus.maybeWhen(
          orElse: SizedBox.shrink,
          failure: (f) => failureHandler(f, fetchCoins),
          loading: _Loader.new,
          success: () => _Success(state: state),
        );
      },
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Skeleton(
            height: 20.h,
          ),
          verticalSpaceLarge,
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const Skeleton(
                height: 70,
                margin: EdgeInsets.only(
                  bottom: UIConstants.baseMargin * 3,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _Success extends StatelessWidget {
  const _Success({required this.state});
  final ExchangeState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.latestCoins.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              TopCoinItem(
                coin: state.latestCoins[index],
              ),
              verticalSpaceRegular,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Top Cryptocurrencies',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    'View All',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              verticalSpaceRegular,
            ],
          );
        }

        return Padding(
          padding: const EdgeInsets.only(
            bottom: UIConstants.baseMargin * 3,
          ),
          child: CoinItem(
            coin: state.latestCoins[index],
          ),
        );
      },
    );
  }
}
