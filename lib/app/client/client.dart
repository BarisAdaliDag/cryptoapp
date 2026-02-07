import 'package:cryptoapp/app/client/network/builder/network_manager.dart';

class BinanceNetworkClient {
  static NetworkManager client() {
    return NetworkManager(
      authToken: null,
      isLog: true,
      isReleaseURL: true,
      releaseBaseURL: "https://api.binance.com",
      testBaseURL: "https://api.binance.com",
    );
  }
}
// ...Others Api