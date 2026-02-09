import 'package:cryptoapp/app/util/format_string_helper/format_stritng_helper.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:cryptoapp/app/widgets/stat_card.dart';

import '../extensions/ticker_model_extension.dart';
import '../utils/market_detail_helpers.dart';

class MarketStatsSection extends StatelessWidget {
  final TickerModel ticker;

  const MarketStatsSection({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.marketStatistics,
                  style: AppTypography.title.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
                ),
                Text(
                  AppStrings.range24h,
                  style: AppTypography.bodySmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 2.2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              StatCard(
                label: AppStrings.high24h,
                value: '\$${FormatStringHelper.formatPrice(ticker.highPriceAsDouble)}',
              ),
              StatCard(label: AppStrings.low24h, value: '\$${FormatStringHelper.formatPrice(ticker.lowPriceAsDouble)}'),
              StatCard(
                label: '${AppStrings.volume24h} (${MarketDetailHelpers.getBaseCoin(ticker.displaySymbol)})',
                value: FormatStringHelper.abbreviate(ticker.volumeAsDouble),
              ),
              StatCard(
                label: '${AppStrings.volume24h} (USDT)',
                value: FormatStringHelper.abbreviate(ticker.quoteVolumeAsDouble),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
