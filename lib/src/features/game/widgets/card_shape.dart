import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class CardShape extends StatelessWidget {
  const CardShape({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.cardWidth,
      height: Constants.cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: Colors.green,
        ),
      ),
      child: child,
    );
  }
}
