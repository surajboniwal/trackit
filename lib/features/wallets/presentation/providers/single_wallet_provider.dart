import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/wallet.dart';

final singleWalletProvider = Provider.autoDispose<Wallet>((ref) => throw UnimplementedError());
