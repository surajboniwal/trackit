import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trackit/features/wallets/data/repositories/wallet_repository.dart';

import '../../data/models/wallet.dart';

class WalletInfoProvider extends StateNotifier<Wallet> {
  WalletInfoProvider(super.state);

  static final provider = StateNotifierProvider.family<WalletInfoProvider, Wallet, int>(
    (ref, id) {
      final _wallet = ref.read(WalletRepository.provider).get(id);

      return WalletInfoProvider(_wallet!);
    },
  );
}
