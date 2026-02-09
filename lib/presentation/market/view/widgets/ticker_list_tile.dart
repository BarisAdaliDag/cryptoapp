import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:cryptoapp/app/extension/padding_extension.dart';
import 'package:cryptoapp/app/get_it/get_it.dart';
import 'package:cryptoapp/app/util/format_string_helper/format_stritng_helper.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/presentation/market_detail/view/market_detail_screen.dart';
import 'package:cryptoapp/presentation/market_detail/viewmodel/market_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TickerListTile extends StatelessWidget {
  final TickerModel tickerModel;

  const TickerListTile({super.key, required this.tickerModel});

  static const double _verticalPadding = 20.0;
  static const double _symbolSpacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return tickerModel.lastPriceAsDouble == 0
        ? const SizedBox.shrink()
        : InkWell(
            onTap: () => _navigateToDetail(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildSymbolInfo()),
                _buildPriceInfo(),
              ],
            ).symmetricPadding(vertical: _verticalPadding),
          );
  }

  Widget _buildSymbolInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tickerModel.displaySymbol, style: AppTypography.title.copyWith(color: AppColors.primaryText, height: 1)),
        const Gap(_symbolSpacing),
        Text(
          FormatStringHelper.getCoinDisplayName(tickerModel.symbol ?? ''),
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.secondaryText,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceInfo() {
    final isPriceUp = tickerModel.isPriceUp;
    final changeColor = isPriceUp ? AppColors.bull : AppColors.bear;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$${FormatStringHelper.formatPrice(tickerModel.lastPriceAsDouble)}',
          style: AppTypography.title.copyWith(color: AppColors.primaryText, height: 1),
        ),
        const Gap(_symbolSpacing),
        Text(
          FormatStringHelper.formatPercent(tickerModel.priceChangePercentAsDouble),
          style: AppTypography.bodyMedium.copyWith(color: changeColor, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  void _navigateToDetail(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.pushNamed(
      'market_detail',
      pathParameters: {'symbol': tickerModel.symbol ?? ''},
      extra: tickerModel, // TickerModel'i extra olarak gönder
    );
  }
}
