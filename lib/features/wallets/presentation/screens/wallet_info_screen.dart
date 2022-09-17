import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trackit/features/wallets/presentation/providers/selected_wallet_provider.dart';
import 'package:trackit/features/wallets/presentation/providers/wallet_info_provider.dart';

class WalletInfoScreen extends ConsumerWidget {
  const WalletInfoScreen({
    Key? key,
  }) : super(key: key);

  static const route = 'wallet_info_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(
      walletInfoProvider(
        ref.read(selectedWalletProvider),
      ),
    );

    return Scaffold(
      body: Center(
        child: Text(wallet.id.toString()),
      ),
    );
  }
}
