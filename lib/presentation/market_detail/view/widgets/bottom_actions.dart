import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/widgets/app_button.dart';
import '../utils/market_detail_helpers.dart';

class BottomActionsWidget extends StatelessWidget {
  final TickerModel tickerModel;

  const BottomActionsWidget({super.key, required this.tickerModel});

  @override
  Widget build(BuildContext context) {
    final baseCoin = MarketDetailHelpers.getBaseCoin(tickerModel.displaySymbol);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.background.withOpacity(0), AppColors.background.withOpacity(0.95), AppColors.background],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: AppButton(text: '${AppStrings.buy} $baseCoin', onPressed: () {}, variant: ButtonVariant.primary),
            ),
            const Gap(12),
            Expanded(
              child: AppButton(
                text: '${AppStrings.sell} $baseCoin',
                onPressed: () {},
                variant: ButtonVariant.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
