import 'package:cryptoapp/app/get_it/get_it.dart';
import 'package:cryptoapp/app/router/app_router.dart';
import 'package:cryptoapp/app/theme/app_theme.dart';
import 'package:cryptoapp/presentation/market/viewmodel/market_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => getIt<MarketListViewModel>()..loadTickers())],
      child: MaterialApp.router(
        title: 'CryptX',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
