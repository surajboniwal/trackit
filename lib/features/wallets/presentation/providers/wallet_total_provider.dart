import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trackit/features/wallets/presentation/providers/wallets_provider.dart';

import '../../data/models/wallet.dart';

class WalletTotalProvider extends StateNotifier<int> {
  final Ref ref;

  WalletTotalProvider(super.state, this.ref) {
    ref.listen<List<Wallet>>(WalletsProvider.provider, (previous, next) {
      state = next.fold<int>(0, (sum, item) => sum + item.balance);
    });
  }

  static final provider = StateNotifierProvider<WalletTotalProvider, int>(
    (ref) {
      final _total =
          ref.read(WalletsProvider.provider).fold<int>(0, (sum, item) => sum + item.balance);
      return WalletTotalProvider(_total, ref);
    },
  );
}
