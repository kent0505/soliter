import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../models/playing_card.dart';
import 'card_shape.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.card,
    this.opened = true,
    this.amount = 0,
    required this.onPressed,
  });

  final PlayingCard card;
  final bool opened;
  final int amount;
  final void Function(PlayingCard) onPressed;

  @override
  Widget build(BuildContext context) {
    final title = switch (card.rank) {
      11 => 'J',
      12 => 'Q',
      13 => 'K',
      14 => 'A',
      _ => card.rank.toString(),
    };

    final suit = switch (card.suit) {
      Suit.hearts => '♥',
      Suit.diamonds => '♦',
      Suit.clubs => '♣',
      Suit.spades => '♠',
    };

    final color = switch (card.suit) {
      Suit.hearts || Suit.diamonds => Colors.redAccent,
      Suit.clubs || Suit.spades => Colors.black,
    };

    return CardShape(
      onPressed: () {
        onPressed(card);
      },
      child: opened
          ? Stack(
              children: [
                Positioned(
                  top: 4,
                  left: 4,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: color,
                      fontFamily: AppFonts.w700,
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 4,
                  child: Text(
                    suit,
                    style: TextStyle(
                      fontSize: 16,
                      color: color,
                      fontFamily: AppFonts.w700,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 0,
                  right: 0,
                  child: Text(
                    suit,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: color,
                      fontFamily: AppFonts.w700,
                    ),
                  ),
                )
              ],
            )
          : Stack(
              children: [
                // bg
                Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                if (amount != 0)
                  Positioned(
                    bottom: 4,
                    left: 4,
                    child: Text(
                      amount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: AppFonts.w700,
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
