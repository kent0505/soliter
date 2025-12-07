import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/loading_widget.dart';
import '../game/screens/game_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void replace() {
    // if (context.read<OnboardRepository>().isOnboard()) {
    //   // context.replace(OnboardScreen.routePath);
    //   context.replace(HomeScreen.routePath);
    // } else {
    // }
    context.replace(GameScreen.routePath);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          replace();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(),
    );
  }
}
