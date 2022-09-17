import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/navigation_provider.dart';
import '../../../wallets/presentation/screens/wallets_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final index = ref.watch(navigationProvider);
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (index) {
              ref.read(navigationProvider.notifier).state = index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.clear_all_rounded),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet_rounded),
                label: 'Wallets',
              ),
            ],
          );
        },
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final index = ref.watch(navigationProvider);

          return IndexedStack(
            index: index,
            children: [
              Container(color: Colors.deepOrangeAccent),
              const WalletsScreen(),
            ],
          );
        },
      ),
    );
  }
}
