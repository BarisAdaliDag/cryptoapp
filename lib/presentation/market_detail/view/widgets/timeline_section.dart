import 'package:cryptoapp/app/util/format_string_helper/format_stritng_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';

import '../utils/market_detail_helpers.dart';

class TimelineSection extends StatelessWidget {
  final TickerModel ticker;

  const TimelineSection({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Icon(Icons.schedule, size: 18, color: AppColors.secondaryText),
                const Gap(8),
                Text(
                  AppStrings.timeline,
                  style: AppTypography.bodyLarge.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          TimelineItem(label: AppStrings.openTimeUtc, value: MarketDetailHelpers.formatTimestamp(ticker.openTime ?? 0)),
          TimelineItem(
            label: AppStrings.closeTimeUtc,
            value: MarketDetailHelpers.formatTimestamp(ticker.closeTime ?? 0),
          ),
          if (ticker.count != null)
            TimelineItem(label: AppStrings.totalTrades, value: FormatStringHelper.abbreviate(ticker.count!.toDouble())),
        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String label;
  final String value;

  const TimelineItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText)),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
