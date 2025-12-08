import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../models/playing_card.dart';
import 'card_widget.dart';

class CardsStack extends StatelessWidget {
  const CardsStack({super.key, required this.cards});

  final List<PlayingCard> cards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.cardHeight + (cards.length - 1) * 20,
      width: Constants.cardWidth,
      child: Stack(
        children: List.generate(
          cards.length,
          (index) {
            return Positioned(
              top: index * 20,
              child: CardWidget(
                card: cards[index],
                opened: index == cards.length - 1,
                amount: 0,
                onPressed: (card) {},
              ),
            );
          },
        ),
      ),
    );
  }
}
