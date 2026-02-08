import 'package:cryptoapp/data/models/ticker_model.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketListScreen extends StatelessWidget {
  const MarketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Market'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(padding: const EdgeInsets.all(8.0), child: _SearchBar()),
        ),
      ),
      body: Consumer<MarketListViewModel>(
        builder: (context, viewModel, child) {
          // Loading
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (viewModel.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.error ?? 'Hata'),
                  ElevatedButton(onPressed: viewModel.loadTickers, child: const Text('Tekrar Dene')),
                ],
              ),
            );
          }

          // Empty
          if (viewModel.isEmpty) {
            return const Center(child: Text('Veri bulunamadı'));
          }

          // List
          return RefreshIndicator(
            onRefresh: viewModel.refresh,
            child: ListView.builder(
              itemCount: viewModel.tickers.length,
              itemBuilder: (context, index) {
                final ticker = viewModel.tickers[index];
                return _TickerListTile(ticker: ticker);
              },
            ),
          );
        },
      ),
    );
  }
}

// ===================== SEARCH BAR =====================
class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MarketListViewModel>();

    return TextField(
      decoration: InputDecoration(
        hintText: 'Ara (BTC, ETH...)',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      onChanged: viewModel.searchTickers,
    );
  }
}

// ===================== LIST ITEM =====================
class _TickerListTile extends StatelessWidget {
  final TickerModel ticker;

  const _TickerListTile({required this.ticker});

  @override
  Widget build(BuildContext context) {
    final isPriceUp = ticker.isPriceUp;
    final color = isPriceUp ? Colors.green : Colors.red;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Text(
          ticker.symbol?.substring(0, 1) ?? '?',
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(ticker.displaySymbol, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('\$${ticker.lastPriceAsDouble.toStringAsFixed(2)}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${isPriceUp ? '+' : ''}${ticker.priceChangePercentAsDouble.toStringAsFixed(2)}%',
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          Text(isPriceUp ? '▲' : '▼', style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
