part of '../exchange_screen.dart';

class TopCoinItem extends StatelessWidget {
  const TopCoinItem({required this.coin, super.key});
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: UIConstants.largeBorderRadius,
        color: coin.quote.usd.percentChange24h >= 0
            ? AppColors.greenColor.withOpacity(0.1)
            : AppColors.redColor.withOpacity(0.1),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  UIConstants.largeRadius,
                ),
                bottomRight: Radius.circular(
                  UIConstants.largeRadius,
                ),
              ),
              child: ColoredBox(
                color: coin.quote.usd.percentChange24h >= 0
                    ? const Color(0xff00CE08).withOpacity(0.6)
                    : const Color(0xffFF3D00).withOpacity(0.6),
                child: SizedBox.fromSize(
                  size: const Size.fromHeight(20),
                ),
              ),
            ),
          ),
          Positioned(
            left: -10,
            right: -10,
            bottom: 20,
            child: CustomPaint(
              painter: coin.quote.usd.percentChange24h >= 0
                  ? BullishCurve(strokeWidth: 3, closed: true)
                  : BearishCurve(strokeWidth: 3, closed: true),
              size: const Size.fromHeight(60),
            ),
          ),
          Positioned(
            left: UIConstants.baseMargin * 3,
            right: UIConstants.baseMargin * 3,
            top: UIConstants.baseMargin * 3,
            child: CoinItem(
              coin: coin,
              withGraph: false,
            ),
          ),
        ],
      ),
    );
  }
}
