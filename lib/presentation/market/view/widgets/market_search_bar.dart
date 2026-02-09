import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketSearchBar extends StatelessWidget {
  const MarketSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MarketListViewModel>();

    return Container(
      decoration: BoxDecoration(color: AppColors.input, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        style: AppTypography.bodyLarge.copyWith(color: AppColors.primaryText),
        decoration: InputDecoration(
          hintText: AppStrings.searchAssets,
          hintStyle: AppTypography.bodyLarge.copyWith(color: AppColors.secondaryText),
          prefixIcon: Icon(Icons.search, color: AppColors.secondaryText, size: 24),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border.withOpacity(0.5), width: 1),
          ),
        ),
        onChanged: viewModel.searchTickers,
      ),
    );
  }
}
