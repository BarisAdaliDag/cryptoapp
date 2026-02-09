import 'package:cryptoapp/app/util/format_string_helper/format_stritng_helper.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:go_router/go_router.dart';

class MarketDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TickerModel tickerModel;

  const MarketDetailAppBar({super.key, required this.tickerModel});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => context.pop()),
      title: Column(
        children: [
          Text(tickerModel.displaySymbol, style: Theme.of(context).appBarTheme.titleTextStyle),
          Text(
            FormatStringHelper.getCoinDisplayName(tickerModel.symbol ?? ''),
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.secondaryText,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
      actions: [IconButton(icon: const Icon(Icons.star_border, size: 24), onPressed: () {})],
    );
  }
}
