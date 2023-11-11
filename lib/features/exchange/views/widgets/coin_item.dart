part of '../exchange_screen.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({
    required this.coin,
    this.withGraph = true,
    super.key,
  });
  final Coin coin;
  final bool withGraph;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            UIConstants.baseIconSize * 1.6,
          ),
          child: PrimaryIconButton(
            image: '${Endpoints.coinIcon}/${coin.id}.png',
            networkIcon: true,
            size: const Size(
              UIConstants.baseIconSize * 1.6,
              UIConstants.baseIconSize * 1.6,
            ),
          ),
        ),
        horizontalSpaceRegular,
        Expanded(
          flex: withGraph ? 2 : 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      coin.symbol,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight:
                                withGraph ? FontWeight.w600 : FontWeight.w700,
                          ),
                    ),
                  ),
                  if (withGraph) ...[
                    horizontalSpaceSmall,
                    CustomPaint(
                      painter: coin.quote.usd.percentChange24h >= 0
                          ? BullishCurve()
                          : BearishCurve(),
                      size: const Size(70, 30),
                    )
                  ],
                ],
              ),
              verticalSpaceTiny,
              Text(
                coin.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        horizontalSpaceRegular,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$${coin.quote.usd.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: withGraph ? FontWeight.w600 : FontWeight.w700,
                    ),
                textAlign: TextAlign.end,
              ),
              verticalSpaceSmall,
              Text(
                '''${coin.quote.usd.percentChange24h.toString().startsWith('-') ? '' : '+'}'''
                '${coin.quote.usd.percentChange24h.toStringAsFixed(2)}%',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: coin.quote.usd.percentChange24h >= 0
                          ? AppColors.greenColor
                          : AppColors.redColor,
                      fontWeight: withGraph ? null : FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
