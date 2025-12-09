import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../bloc/game_bloc.dart';
import '../models/playing_card.dart';
import 'card_widget.dart';

class CardsStack extends StatelessWidget {
  const CardsStack({super.key, required this.cards});

  final List<PlayingCard> cards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.cardHeight + (cards.length - 1) * 24,
      width: Constants.cardWidth,
      child: Stack(
        children: List.generate(
          cards.length,
          (index) {
            return Positioned(
              top: index * 24,
              child: GestureDetector(
                onPanStart: (details) {
                  context
                      .read<GameBloc>()
                      .add(MoveCards(cards: cards.sublist(index)));
                },
                child: CardWidget(card: cards[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
