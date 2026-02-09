import 'package:cryptoapp/presentation/market_detail/viewmodel/market_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';

import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import '../../../app/widgets/loading_state.dart';
import '../../../app/widgets/error_state.dart';
import '../../../app/widgets/app_button.dart';
import '../../../app/util/format_string_helper';
import '../widgets/price_hero_section.dart';
import '../widgets/market_stats_section.dart';
import '../widgets/order_book_section.dart';
import '../widgets/timeline_section.dart';

class MarketDetailScreen extends StatelessWidget {
  final TickerModel tickerModel;
  static const double _horizontalPadding = 16.0;

  const MarketDetailScreen({super.key, required this.tickerModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context),
      body: Stack(children: [_buildContent(context), _buildBottomActions(context)]),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => Navigator.pop(context)),
      title: Column(
        children: [
          Text(tickerModel.displaySymbol, style: Theme.of(context).appBarTheme.titleTextStyle),
          Text(
            FormatStringHelper.getCoinDisplayName(tickerModel.symbol ?? ''),
            style: AppTypography.caption.copyWith(color: AppColors.secondaryText, fontWeight: FontWeight.w500, letterSpacing: 1.5),
          ),
        ],
      ),
      actions: [IconButton(icon: const Icon(Icons.star_border, size: 24), onPressed: () {})],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Consumer<MarketDetailViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading && !viewModel.hasData) {
          return const LoadingState(message: AppStrings.loadingMarketData);
        }

        if (viewModel.hasError && !viewModel.hasData) {
          return ErrorState(title: AppStrings.failedToLoadData, onRetry: viewModel.loadTickerDetail);
        }

        final ticker = viewModel.ticker ?? tickerModel;

        return RefreshIndicator(
          onRefresh: viewModel.refresh,
          color: AppColors.primary,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
            child: Column(
              children: [
                PriceHeroSection(ticker: ticker),
                MarketStatsSection(ticker: ticker),
                OrderBookSection(ticker: ticker),
                TimelineSection(ticker: ticker),
                const Gap(120),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    final baseCoin = tickerModel.displaySymbol.split('/').first;

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
            Expanded(child: AppButton(text: '${AppStrings.buy} $baseCoin', onPressed: () {}, variant: ButtonVariant.primary)),
            const Gap(12),
            Expanded(child: AppButton(text: '${AppStrings.sell} $baseCoin', onPressed: () {}, variant: ButtonVariant.secondary)),
          ],
        ),
      ),
    );
  }
}
