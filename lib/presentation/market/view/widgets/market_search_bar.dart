import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketSearchBar extends StatelessWidget {
  const MarketSearchBar({super.key});

  static const double _borderRadius = 12.0;
  static const double _iconSize = 24.0;
  static const double _borderWidth = 1.0;
  static const double _horizontalPadding = 16.0;
  static const double _verticalPadding = 14.0;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MarketListViewModel>();

    return Container(
      decoration: BoxDecoration(color: AppColors.input, borderRadius: BorderRadius.circular(_borderRadius)),
      child: TextField(
        style: AppTypography.bodyLarge.copyWith(color: AppColors.primaryText),
        decoration: _buildInputDecoration(),
        onChanged: viewModel.searchTickers,
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: AppStrings.searchAssets,
      hintStyle: AppTypography.bodyLarge.copyWith(color: AppColors.secondaryText),
      prefixIcon: Icon(Icons.search, color: AppColors.secondaryText, size: _iconSize),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: _horizontalPadding, vertical: _verticalPadding),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide(color: AppColors.border.withOpacity(0.5), width: _borderWidth),
      ),
    );
  }
}
