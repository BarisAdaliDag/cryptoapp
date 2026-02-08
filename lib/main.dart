import 'package:cryptoapp/app/get_it/get_it.dart';
import 'package:cryptoapp/presentation/market/view/market_list_screen.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // DI setup
  serviceLocator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Market',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), useMaterial3: true),
      home: ChangeNotifierProvider(
        create: (_) => MarketListViewModel(serviceLocator.tickerRepository)..loadTickers(), // ✅ Otomatik yükleme
        child: const MarketListScreen(),
      ),
    );
  }
}
