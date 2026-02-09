import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:cryptoapp/presentation/market/view/widgets/market_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MarketHeader extends StatelessWidget {
  const MarketHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.marketOverview,
            style: AppTypography.headlineMedium.copyWith(color: AppColors.primaryText, letterSpacing: -0.5),
          ),
          const Gap(24),
          const MarketSearchBar(),
        ],
      ),
    );
  }
}
