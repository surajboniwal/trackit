import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';

class TrackIt extends ConsumerWidget {
  const TrackIt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(AppRouter.provider);
    final appTheme = ref.watch(AppTheme.provider);

    return MaterialApp.router(
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
      routeInformationProvider: appRouter.router.routeInformationProvider,
      title: 'TrackIt',
      theme: appTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
