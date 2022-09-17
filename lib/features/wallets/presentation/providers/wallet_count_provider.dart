import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trackit/features/wallets/presentation/providers/wallets_provider.dart';

final walletCount =
    Provider<int>((ref) => ref.watch(WalletsProvider.provider).length);
