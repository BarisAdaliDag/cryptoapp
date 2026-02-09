import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:cryptoapp/app/extension/padding_extension.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MarketErrorState extends StatelessWidget {
  final MarketListViewModel viewModel;

  const MarketErrorState({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: AppColors.secondaryText),
          const Gap(16),
          Text(
            AppStrings.failedToLoadData,
            style: AppTypography.headlineSmall.copyWith(color: AppColors.primaryText),
            textAlign: TextAlign.center,
          ),
          const Gap(24),
          ElevatedButton.icon(
            onPressed: viewModel.loadTickers,
            icon: const Icon(Icons.refresh),
            label: const Text(AppStrings.retry),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ).allPadding(24),
    );
  }
}
