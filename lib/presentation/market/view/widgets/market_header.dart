import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'market_search_bar.dart';

class MarketHeader extends StatelessWidget {
  const MarketHeader({super.key});

  static const double _horizontalPadding = 24.0;
  static const double _topPadding = 40.0;
  static const double _bottomPadding = 24.0;
  static const double _titleSpacing = 24.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(_horizontalPadding, _topPadding, _horizontalPadding, _bottomPadding),
      color: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildTitle(), const Gap(_titleSpacing), const MarketSearchBar()],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      AppStrings.marketOverview,
      style: AppTypography.headlineMedium.copyWith(color: AppColors.primaryText, letterSpacing: -0.5),
    );
  }
}
