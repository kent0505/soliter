import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/svg_widget.dart';
import 'card_shape.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({
    super.key,
    this.title = '',
    this.asset = '',
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return CardShape(
      child: Center(
        child: title.isNotEmpty
            ? Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: AppFonts.w700,
                ),
              )
            : asset.isEmpty
                ? const SizedBox()
                : SvgWidget(
                    asset,
                    color: Colors.black,
                  ),
      ),
    );
  }
}
