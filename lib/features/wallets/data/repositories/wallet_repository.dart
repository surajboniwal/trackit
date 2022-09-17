import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../../../core/database/database_provider.dart';
import '../models/wallet.dart';

class WalletRepository {
  final Isar isar;

  WalletRepository({required this.isar});

  static final provider = Provider<WalletRepository>(
    (ref) => WalletRepository(
      isar: ref.watch(databaseProvider),
    ),
  );

  Wallet? get(int id) {
    return isar.wallets.getSync(id);
  }

  Future<void> create(Wallet wallet) async {
    await isar.writeTxn((isar) async {
      await isar.wallets.put(wallet);
    });
  }

  List<Wallet> getAll() {
    return isar.wallets.where().findAllSync();
  }

  Future<bool> delete(int id) async {
    return await isar.writeTxn((isar) async {
      return await isar.wallets.delete(id);
    });
  }
}
