import 'package:cryptoapp/app/const/app_color.dart';
import 'package:flutter/material.dart';
import 'widgets/market_header.dart';
import 'widgets/market_list_content.dart';

class MarketListScreen extends StatelessWidget {
  const MarketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            MarketHeader(),
            Expanded(child: MarketListContent()),
          ],
        ),
      ),
    );
  }
}
