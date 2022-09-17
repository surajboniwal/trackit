import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trackit/features/wallets/data/repositories/wallet_repository.dart';

import '../../data/models/wallet.dart';

class WalletsProvider extends StateNotifier<List<Wallet>> {
  WalletsProvider(super.state, {required this.walletRepository});

  final WalletRepository walletRepository;

  static final provider = StateNotifierProvider<WalletsProvider, List<Wallet>>(
    (ref) {
      final walletRepository = ref.watch(WalletRepository.provider);
      return WalletsProvider(
        walletRepository.getAll(),
        walletRepository: walletRepository,
      );
    },
  );

  Future<void> addWallet(Wallet wallet) async {
    await walletRepository.create(wallet);
    state = [...state, wallet];
  }

  Future<void> deleteWallet(int id) async {
    final result = await walletRepository.delete(id);

    if (!result) return;

    state = [...state.where((element) => element.id != id)];
  }
}
