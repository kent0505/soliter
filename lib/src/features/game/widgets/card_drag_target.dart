import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../bloc/game_bloc.dart';
import '../models/playing_card.dart';

class CardDragTarget extends StatelessWidget {
  const CardDragTarget({
    super.key,
    this.card,
    required this.target,
    required this.child,
  });

  final PlayingCard? card;
  final Target target;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final foundation = target == Target.f1 ||
        target == Target.f2 ||
        target == Target.f3 ||
        target == Target.f4;

    return DragTarget<List<PlayingCard>>(
      onWillAcceptWithDetails: (details) {
        final dragged = details.data.first;

        if (card == null &&
            (foundation
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
            (foundation
                ? dragged.suit == card!.suit // даем доступ одинаковым мастям
                : draggedIsRed != targetIsRed // цвет мастей должны отличаться
            );
      },
      onAcceptWithDetails: (details) {
        logger('ACCEPT');

        context.read<GameBloc>().add(
              AcceptMoveCards(
                movingCards: details.data,
                targetCard: card,
              ),
            );
      },
      builder: (context, candidateData, rejectedData) {
        return child;
      },
    );
  }
}
