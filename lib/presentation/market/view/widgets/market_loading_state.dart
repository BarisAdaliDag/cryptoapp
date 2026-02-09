import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MarketLoadingState extends StatelessWidget {
  const MarketLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: AppColors.primary),
          const Gap(16),
          Text(AppStrings.loadingMarketData, style: AppTypography.bodyMedium.copyWith(color: AppColors.secondaryText)),
        ],
      ),
    );
  }
}
