import 'package:flutter/material.dart';

import '../../data/models/wallet.dart';
import '../widgets/add_wallet_form.dart';

mixin WalletBottomsheets {
  Future<Wallet?> addWalletBottomsheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (context) => const AddWalletForm(),
    );
  }
}
