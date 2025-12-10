import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../models/playing_card.dart';

class CardDragTarget extends StatelessWidget {
  const CardDragTarget({
    super.key,
    this.card,
    this.fountdation = false,
    required this.child,
  });

  final PlayingCard? card;
  final bool fountdation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DragTarget<List<PlayingCard>>(
      onWillAcceptWithDetails: (details) {
        final dragged = details.data.first;

        if (card == null &&
            (fountdation
                ? dragged.rank == 14 // туз можно вставить в пустой foundation
                : dragged.rank == 13 // король можно вставить в пустой tableau
            )) {
          return true;
        }

        if (card == null) return false;

        final draggedIsRed =
            dragged.suit == Suit.hearts || dragged.suit == Suit.diamonds;

        final targetIsRed =
            card!.suit == Suit.hearts || card!.suit == Suit.diamonds;

        return card!.rank - dragged.rank == 1 // масти должны идти по убыванию
            &&
            (fountdation
                ? dragged.suit == card!.suit // даем доступ одинаковым мастям
                : draggedIsRed != targetIsRed // цвет мастей должны отличаться
            );
      },
      onAcceptWithDetails: (details) {
        logger('ACCEPT');
        // for (final card in details.data) {
        //   logger(card.rank);
        // }
        // // handle drop: add event to bloc with dragged slice & target card
        // bloc.add(AcceptMoveCards(
        //   cards: details.data,
        //   target: 1,
        //   // target: card,
        // ));
      },
      builder: (context, candidateData, rejectedData) {
        return child;
      },
    );
  }
}
