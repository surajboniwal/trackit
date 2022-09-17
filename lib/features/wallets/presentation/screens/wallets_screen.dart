import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trackit/features/wallets/presentation/mixins/bottomsheet_mixin.dart';
import 'package:trackit/features/wallets/presentation/providers/wallet_total_provider.dart';
import 'package:trackit/features/wallets/presentation/providers/wallets_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/single_wallet_provider.dart';

import '../widgets/add_wallet_button.dart';
import '../widgets/wallet_tile.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 24.0),
            TotalBalanceSection(),
            SizedBox(height: 24.0),
            WalletsListSection(),
            SizedBox(height: 24.0),
            AddWalletSection(),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}

class TotalBalanceSection extends StatelessWidget {
  const TotalBalanceSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            final total = ref.watch(WalletTotalProvider.provider);
            return Text(
              "₹$total",
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        const Text(
          "Total balance",
          style: TextStyle(
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class WalletsListSection extends StatelessWidget {
  const WalletsListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final wallets = ref.watch(WalletsProvider.provider);
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: wallets.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) => ProviderScope(
            overrides: [
              singleWalletProvider.overrideWithValue(wallets[index]),
            ],
            child: const WalletTile(),
          ),
        );
      },
    );
  }
}

class AddWalletSection extends ConsumerWidget with WalletBottomsheets {
  const AddWalletSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletNotifier = ref.read(WalletsProvider.provider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AddWalletButton(
          label: "New wallet",
          icon: Icons.add_rounded,
          onTap: () async {
            final wallet = await addWalletBottomsheet(context);

            if (wallet == null) return;

            walletNotifier.addWallet(wallet);
          },
        ),
      ],
    );
  }
}
