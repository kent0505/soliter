import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../models/playing_card.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.card,
    this.opened = false,
    this.amount = 0,
    required this.onPressed,
  });

  final PlayingCard card;
  final bool opened;
  final int amount;
  final void Function(PlayingCard) onPressed;

  @override
  Widget build(BuildContext context) {
    final color = switch (card.suit) {
      Suit.hearts || Suit.diamonds => Colors.redAccent,
      Suit.clubs || Suit.spades => Colors.black,
    };

    return Button(
      onPressed: () {
        onPressed(card);
      },
      child: Container(
        width: 50,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.greenAccent,
          ),
        ),
        child: opened
            ? Stack(
                children: [
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Text(
                      card.title,
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
                      switch (card.suit) {
                        Suit.hearts => '♥',
                        Suit.diamonds => '♦',
                        Suit.clubs => '♣',
                        Suit.spades => '♠',
                      },
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
                      switch (card.suit) {
                        Suit.hearts => '♥',
                        Suit.diamonds => '♦',
                        Suit.clubs => '♣',
                        Suit.spades => '♠',
                      },
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
                  Container(color: Colors.greenAccent),
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
      ),
    );
  }
}
