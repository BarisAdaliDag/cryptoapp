import 'package:cryptoapp/presentation/market_detail/viewmodel/market_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';

import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';

import '../../../app/widgets/loading_state.dart';
import '../../../app/widgets/error_state.dart';

import 'widgets/market_detail_app_bar.dart';
import 'widgets/price_hero_section.dart';
import 'widgets/market_stats_section.dart';
import 'widgets/order_book_section.dart';
import 'widgets/timeline_section.dart';
import 'widgets/bottom_actions.dart';

class MarketDetailScreen extends StatelessWidget {
  final TickerModel tickerModel;
  static const double horizontalPadding = 16.0;

  const MarketDetailScreen({super.key, required this.tickerModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MarketDetailAppBar(tickerModel: tickerModel),
      body: _buildContent(context),
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
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                PriceHeroSection(ticker: ticker),
                MarketStatsSection(ticker: ticker),
                OrderBookSection(ticker: ticker),
                TimelineSection(ticker: ticker),
                BottomActionsWidget(tickerModel: tickerModel),
                const Gap(100),
              ],
            ),
          ),
        );
      },
    );
  }
}
