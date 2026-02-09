import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_string.dart';
import 'package:cryptoapp/app/widgets/empty_state.dart';
import 'package:cryptoapp/app/widgets/error_state.dart';
import 'package:cryptoapp/app/widgets/loading_state.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ticker_list_tile.dart';

class MarketListContent extends StatelessWidget {
  const MarketListContent({super.key});

  static const double _horizontalPadding = 24.0;
  static const double _bottomPadding = 48.0;
  static const double _dividerHeight = 1.0;
  static const double _dividerThickness = 1.0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketListViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const LoadingState(message: AppStrings.loadingMarketData);
        }

        if (viewModel.hasError) {
          return ErrorState(onRetry: viewModel.loadTickers);
        }

        if (viewModel.isEmpty) {
          return const EmptyState();
        }

        return _buildTickerList(viewModel);
      },
    );
  }

  Widget _buildTickerList(MarketListViewModel viewModel) {
    return RefreshIndicator(
      onRefresh: viewModel.refresh,
      color: AppColors.primary,
      backgroundColor: AppColors.foreground,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(_horizontalPadding, 0, _horizontalPadding, _bottomPadding),
        itemCount: viewModel.tickers.length,
        separatorBuilder: (_, __) =>
            Divider(height: _dividerHeight, thickness: _dividerThickness, color: AppColors.divider),
        itemBuilder: (context, index) {
          final ticker = viewModel.tickers[index];
          return TickerListTile(tickerModel: ticker);
        },
      ),
    );
  }
}
