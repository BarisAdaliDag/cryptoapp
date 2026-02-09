import 'package:flutter/material.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/app/const/app_color.dart';
import 'package:cryptoapp/app/const/app_typo.dart';
import 'package:cryptoapp/app/util/format_string_helper';

class MarketDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TickerModel tickerModel;

  const MarketDetailAppBar({super.key, required this.tickerModel});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => Navigator.pop(context)),
      title: Column(
        children: [
          Text(tickerModel.displaySymbol, style: Theme.of(context).appBarTheme.titleTextStyle),
          Text(
            FormatStringHelper.getCoinDisplayName(tickerModel.symbol ?? ''),
            style: AppTypography.caption.copyWith(
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
