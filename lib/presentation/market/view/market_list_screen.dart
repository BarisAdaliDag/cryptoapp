import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_constants.dart';
import 'package:cryptoapp/app/extension/padding_extension.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:cryptoapp/presentation/market/view/widgets/market_header.dart';
import 'package:cryptoapp/presentation/market/view/widgets/market_loading_state.dart';
import 'package:cryptoapp/presentation/market/view/widgets/market_error_state.dart';
import 'package:cryptoapp/presentation/market/view/widgets/market_empty_state.dart';
import 'package:cryptoapp/presentation/market/view/widgets/ticker_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketListScreen extends StatelessWidget {
  const MarketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const MarketHeader(),
            Expanded(child: _buildMarketList()),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketList() {
    return Consumer<MarketListViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const MarketLoadingState();
        }

        if (viewModel.hasError) {
          return MarketErrorState(viewModel: viewModel);
        }

        if (viewModel.isEmpty) {
          return const MarketEmptyState();
        }

        return RefreshIndicator(
          onRefresh: viewModel.refresh,
          color: AppColors.primary,
          backgroundColor: AppColors.foreground,
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(AppConstants.kPaddingHorizontal, 0, AppConstants.kPaddingHorizontal, 48),
            itemCount: viewModel.tickers.length,
            separatorBuilder: (_, __) => Divider(height: 1, thickness: 1, color: AppColors.divider),
            itemBuilder: (context, index) {
              final ticker = viewModel.tickers[index];
              return TickerListTile(ticker: ticker);
            },
          ),
        );
      },
    );
  }
}
