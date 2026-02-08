import 'package:cryptoapp/presentation/market_detail/viewmodel/market_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptoapp/data/models/ticker_model.dart';

class MarketDetailScreen extends StatelessWidget {
  final TickerModel initialTicker;

  const MarketDetailScreen({super.key, required this.initialTicker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(initialTicker.displaySymbol),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<MarketDetailViewModel>().refresh();
            },
          ),
        ],
      ),
      body: Consumer<MarketDetailViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading && !viewModel.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.hasError && !viewModel.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.error ?? 'Hata'),
                  ElevatedButton(onPressed: viewModel.loadTickerDetail, child: const Text('Tekrar Dene')),
                ],
              ),
            );
          }

          final ticker = viewModel.ticker ?? initialTicker;
          return RefreshIndicator(
            onRefresh: viewModel.refresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _PriceCard(ticker: ticker),
                  const SizedBox(height: 16),
                  _StatsGrid(ticker: ticker),
                  const SizedBox(height: 16),
                  _OrderBookCard(ticker: ticker),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ===================== PRICE CARD =====================
class _PriceCard extends StatelessWidget {
  final TickerModel ticker;

  const _PriceCard({required this.ticker});

  @override
  Widget build(BuildContext context) {
    final isPriceUp = ticker.isPriceUp;
    final color = isPriceUp ? Colors.green : Colors.red;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(ticker.displaySymbol, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text(
              '\$${ticker.lastPriceAsDouble.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isPriceUp ? Icons.arrow_upward : Icons.arrow_downward, color: color),
                Text(
                  '${isPriceUp ? '+' : ''}${ticker.priceChangePercentAsDouble.toStringAsFixed(2)}%',
                  style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ===================== STATS GRID =====================
class _StatsGrid extends StatelessWidget {
  final TickerModel ticker;

  const _StatsGrid({required this.ticker});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _StatItem(
          label: '24h Yüksek',
          value: '\$${double.tryParse(ticker.highPrice ?? '0')?.toStringAsFixed(2) ?? '0'}',
        ),
        _StatItem(label: '24h Düşük', value: '\$${double.tryParse(ticker.lowPrice ?? '0')?.toStringAsFixed(2) ?? '0'}'),
        _StatItem(label: '24h Hacim', value: double.tryParse(ticker.volume ?? '0')?.toStringAsFixed(0) ?? '0'),
        _StatItem(
          label: '24h Değişim',
          value: '\$${double.tryParse(ticker.priceChange ?? '0')?.toStringAsFixed(2) ?? '0'}',
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// ===================== ORDER BOOK CARD (BID/ASK) =====================
class _OrderBookCard extends StatelessWidget {
  final TickerModel ticker;

  const _OrderBookCard({required this.ticker});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emir Defteri', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _OrderItem(
                    label: 'Alış Fiyatı',
                    price: ticker.bidPrice ?? '0',
                    quantity: ticker.bidQty ?? '0',
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _OrderItem(
                    label: 'Satış Fiyatı',
                    price: ticker.askPrice ?? '0',
                    quantity: ticker.askQty ?? '0',
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  final String label;
  final String price;
  final String quantity;
  final Color color;

  const _OrderItem({required this.label, required this.price, required this.quantity, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
        const SizedBox(height: 8),
        Text(
          '\$${double.tryParse(price)?.toStringAsFixed(2) ?? '0'}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          'Miktar: ${double.tryParse(quantity)?.toStringAsFixed(4) ?? '0'}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
