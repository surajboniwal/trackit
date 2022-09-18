import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/wallet_repository.dart';

import '../../data/models/wallet.dart';

final walletInfoProvider = Provider.family.autoDispose<Wallet, int>(
  (ref, id) => ref.read(WalletRepository.provider).get(id)!,
);
