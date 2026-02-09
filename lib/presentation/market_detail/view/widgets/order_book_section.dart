import 'package:cryptoapp/app/util/format_string_helper/format_stritng_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';

import '../extensions/ticker_model_extension.dart';
import '../utils/market_detail_helpers.dart';

class OrderBookSection extends StatelessWidget {
  final TickerModel ticker;

  const OrderBookSection({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              AppStrings.depthBidAsk,
              style: AppTypography.title.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.input.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border.withOpacity(0.1)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _BidSection(ticker: ticker)),
                    Expanded(child: _AskSection(ticker: ticker)),
                  ],
                ),
                _SpreadSection(ticker: ticker),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BidSection extends StatelessWidget {
  final TickerModel ticker;

  const _BidSection({required this.ticker});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: AppColors.border.withOpacity(0.2)),
          bottom: BorderSide(color: AppColors.border.withOpacity(0.2)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_downward, size: 14, color: AppColors.bull),
              const Gap(4),
              Text(
                AppStrings.bestBid,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.bull,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const Gap(8),
          Text(
            '\$${FormatStringHelper.formatPrice(ticker.bidPriceAsDouble)}',
            style: AppTypography.title.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
          ),
          const Gap(4),
          Text(
            '${AppStrings.qty}: ${FormatStringHelper.formatPrice(ticker.bidQtyAsDouble)} ${MarketDetailHelpers.getBaseCoin(ticker.displaySymbol)}',
            style: AppTypography.bodySmall.copyWith(color: AppColors.secondaryText),
          ),
        ],
      ),
    );
  }
}

class _AskSection extends StatelessWidget {
  final TickerModel ticker;

  const _AskSection({required this.ticker});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border.withOpacity(0.2))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_upward, size: 14, color: AppColors.bear),
              const Gap(4),
              Text(
                AppStrings.bestAsk,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.bear,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const Gap(8),
          Text(
            '\$${FormatStringHelper.formatPrice(ticker.askPriceAsDouble)}',
            style: AppTypography.title.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
          ),
          const Gap(4),
          Text(
            '${AppStrings.qty}: ${FormatStringHelper.formatPrice(ticker.askQtyAsDouble)} ${MarketDetailHelpers.getBaseCoin(ticker.displaySymbol)}',
            style: AppTypography.bodySmall.copyWith(color: AppColors.secondaryText),
          ),
        ],
      ),
    );
  }
}

class _SpreadSection extends StatelessWidget {
  final TickerModel ticker;

  const _SpreadSection({required this.ticker});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.weightedAvgPrice,
                  style: AppTypography.bodySmall.copyWith(color: AppColors.secondaryText),
                ),
                const Gap(4),
                Text(
                  '\$${FormatStringHelper.formatPrice(ticker.weightedAvgPriceAsDouble)}',
                  style: AppTypography.bodyMedium.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(AppStrings.spread, style: AppTypography.bodySmall.copyWith(color: AppColors.secondaryText)),
                const Gap(4),
                Text(
                  MarketDetailHelpers.calculateSpread(ticker),
                  style: AppTypography.bodyMedium.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
