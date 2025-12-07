import 'package:go_router/go_router.dart';

import '../features/game/screens/game_screen.dart';
import '../features/splash/splash_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: GameScreen.routePath,
      builder: (context, state) => const GameScreen(),
    ),
    // GoRoute(
    //   path: HomeScreen.routePath,
    //   builder: (context, state) => const HomeScreen(),
    // ),

    // // vip
    // GoRoute(
    //   path: VipScreen.routePath,
    //   builder: (context, state) => const VipScreen(),
    // ),
  ],
);
