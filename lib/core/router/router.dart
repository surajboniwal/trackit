import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/wallets/presentation/providers/selected_wallet_provider.dart';
import '../../features/wallets/presentation/screens/wallet_info_screen.dart';
import '../../features/navigation/presentation/screens/navigation_screen.dart';

class AppRouter {
  static final provider = Provider<AppRouter>((ref) => AppRouter());

  final router = GoRouter(
    routes: [
      GoRoute(
        path: NavigationScreen.route,
        builder: (_, __) => const NavigationScreen(),
        routes: [
          GoRoute(
            path: WalletInfoScreen.route,
            name: WalletInfoScreen.route,
            builder: (context, state) {
              final _extra = state.extra as Map<Object?, Object?>;

              final _id = _extra['walletId'] as int;

              return ProviderScope(
                overrides: [
                  selectedWalletProvider.overrideWithValue(_id),
                ],
                child: const WalletInfoScreen(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
