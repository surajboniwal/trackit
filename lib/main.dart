import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';
import 'core/database/database_provider.dart';
import 'features/wallets/data/models/wallet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
    schemas: [WalletSchema],
    directory: dir.path,
  );

  runApp(
    ProviderScope(
      overrides: [databaseProvider.overrideWithValue(isar)],
      child: const TrackIt(),
    ),
  );
}
