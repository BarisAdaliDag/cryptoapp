import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:cryptoapp/app/extension/padding_extension.dart';
import 'package:cryptoapp/app/get_it/get_it.dart';
import 'package:cryptoapp/app/util/format_string_helper';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/presentation/market_detail/view/market_detail_screen.dart';
import 'package:cryptoapp/presentation/market_detail/viewmodel/market_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class TickerListTile extends StatelessWidget {
  final TickerModel ticker;

  const TickerListTile({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    final isPriceUp = ticker.isPriceUp;
    final changeColor = isPriceUp ? AppColors.bull : AppColors.bear;

    return InkWell(
      onTap: () => _navigateToDetail(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticker.displaySymbol,
                  style: AppTypography.title.copyWith(color: AppColors.primaryText, height: 1),
                ),
                const Gap(4),
                Text(
                  FormatStringHelper.getCoinDisplayName(ticker.symbol ?? ''),
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.secondaryText,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${FormatStringHelper.formatPrice(ticker.lastPriceAsDouble)}',
                style: AppTypography.title.copyWith(color: AppColors.primaryText, height: 1),
              ),
              const Gap(4),
              Text(
                FormatStringHelper.formatPercent(ticker.priceChangePercentAsDouble),
                style: AppTypography.bodyMedium.copyWith(color: changeColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ).symmetricPadding(vertical: 20),
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => MarketDetailViewModel(getIt(), ticker.symbol ?? '')..loadTickerDetail(),
          child: MarketDetailScreen(initialTicker: ticker),
        ),
      ),
    );
  }
}
