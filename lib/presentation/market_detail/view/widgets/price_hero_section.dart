import 'package:cryptoapp/app/util/format_string_helper/format_stritng_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_typo.dart';

class PriceHeroSection extends StatelessWidget {
  final TickerModel ticker;

  const PriceHeroSection({super.key, required this.ticker});

  @override
  Widget build(BuildContext context) {
    final isPriceUp = ticker.isPriceUp;
    final changeColor = isPriceUp ? AppColors.bull : AppColors.bear;

    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${FormatStringHelper.formatPrice(ticker.lastPriceAsDouble)}',
                style: AppTypography.headlineLarge.copyWith(
                  color: AppColors.primaryText,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
              const Gap(8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: changeColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    Icon(isPriceUp ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: changeColor, size: 20),
                    Text(
                      FormatStringHelper.formatPercent(ticker.priceChangePercentAsDouble).replaceAll('+', ''),
                      style: AppTypography.bodyMedium.copyWith(color: changeColor, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(8),
          Text(
            '≈ ${FormatStringHelper.formatPrice(ticker.lastPriceAsDouble)} USDT',
            style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
