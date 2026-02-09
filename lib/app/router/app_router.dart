import 'package:cryptoapp/app/get_it/get_it.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/presentation/market/view/market_list_screen.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:cryptoapp/presentation/market_detail/view/market_detail_screen.dart';
import 'package:cryptoapp/presentation/market_detail/viewmodel/market_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // ===================== MARKET LIST =====================
      GoRoute(
        path: '/',
        name: 'market_list',
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => MarketListViewModel(getIt())..loadTickers(),
            child: const MarketListScreen(),
          );
        },
      ),

      // ===================== MARKET DETAIL =====================
      GoRoute(
        path: '/market/:symbol',
        name: 'market_detail',
        builder: (context, state) {
          // Path parameter'dan symbol al
          final symbol = state.pathParameters['symbol']!;

          // Extra data (TickerModel) al
          final ticker = state.extra as TickerModel?;

          return ChangeNotifierProvider(
            create: (_) => MarketDetailViewModel(getIt(), symbol)..loadTickerDetail(),
            child: MarketDetailScreen(tickerModel: ticker ?? TickerModel.empty()),
          );
        },
      ),
    ],

    // ===================== ERROR HANDLING =====================
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Page not found: ${state.matchedLocation}'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () => context.go('/'), child: const Text('Go Home')),
            ],
          ),
        ),
      );
    },
  );

  // Helper: Empty ticker (detail ekranı için fallback)
}
