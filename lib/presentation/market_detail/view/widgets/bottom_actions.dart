import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/widgets/app_button.dart';
import '../utils/market_detail_helpers.dart';

class BottomActionsWidget extends StatelessWidget {
  final TickerModel tickerModel;

  const BottomActionsWidget({super.key, required this.tickerModel});

  @override
  Widget build(BuildContext context) {
    final baseCoin = MarketDetailHelpers.getBaseCoin(tickerModel.displaySymbol);

    return Row(
      children: [
        Expanded(
          child: AppButton(text: '${AppStrings.buy} $baseCoin', onPressed: () {}, variant: ButtonVariant.primary),
        ),
        const Gap(12),
        Expanded(
          child: AppButton(text: '${AppStrings.sell} $baseCoin', onPressed: () {}, variant: ButtonVariant.secondary),
        ),
      ],
    );
  }
}
