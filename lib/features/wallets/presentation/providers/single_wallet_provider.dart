import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trackit/features/wallets/data/models/wallet.dart';

final singleWalletProvider =
    Provider.autoDispose<Wallet>((ref) => throw UnimplementedError());
