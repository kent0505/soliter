import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class CardShape extends StatelessWidget {
  const CardShape({
    super.key,
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}
