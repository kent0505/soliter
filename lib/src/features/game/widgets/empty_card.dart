import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/svg_widget.dart';
import 'card_shape.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({
    super.key,
    this.title = '',
    this.asset = '',
    this.onPressed,
  });

  final String title;
  final String asset;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CardShape(
      child: Center(
        child: title.isNotEmpty
            ? Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.w700,
                ),
              )
            : SvgWidget(
                asset,
                color: Colors.black,
              ),
      ),
    );
  }
}
