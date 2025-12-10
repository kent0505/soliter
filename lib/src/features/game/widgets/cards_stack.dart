import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../bloc/game_bloc.dart';
import '../models/playing_card.dart';
import 'card_drag_target.dart';
import 'card_widget.dart';
import 'empty_card.dart';

class CardsStack extends StatelessWidget {
  const CardsStack({
    super.key,
    required this.cards,
    this.foundation = false,
    this.waste = false,
  });

  final List<PlayingCard> cards;
  final bool foundation;
  final bool waste;

  @override
  Widget build(BuildContext context) {
    final padding = waste || foundation ? 0.0 : 24.0;

    final bloc = context.read<GameBloc>();

    return SizedBox(
      height: Constants.cardHeight + (cards.length) * padding,
      width: Constants.cardWidth,
      child: cards.isEmpty
          ? CardDragTarget(
              fountdation: foundation,
              child: EmptyCard(title: foundation ? 'A' : ''),
            )
          : Stack(
              children: List.generate(
                cards.length,
                (index) {
                  final card = cards[index];

                  final slice = cards.sublist(index);

                  return Positioned(
                    top: index * padding,
                    child: BlocBuilder<GameBloc, GameState>(
                      builder: (context, state) {
                        final moving = state.movingCards;

                        return moving.isNotEmpty && moving.contains(card)
                            ? const SizedBox()
                            : (card.opened
                                ? CardDragTarget(
                                    card: card,
                                    fountdation: foundation,
                                    child: Draggable<List<PlayingCard>>(
                                      data: slice,
                                      onDragStarted: () {
                                        bloc.add(MoveCards(cards: slice));
                                      },
                                      onDraggableCanceled: (velocity, offset) {
                                        bloc.add(MoveCards());
                                      },
                                      feedback: _Feedback(
                                        slice: slice,
                                        padding: padding,
                                      ),
                                      child: CardWidget(card: card),
                                    ),
                                  )
                                : CardWidget(card: card));
                      },
                    ),
                  );
                },
              )..insert(0, waste ? const SizedBox() : const EmptyCard()),
            ),
    );
  }
}

class _Feedback extends StatelessWidget {
  const _Feedback({
    required this.slice,
    required this.padding,
  });

  final List<PlayingCard> slice;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
      alignment: Alignment.topCenter,
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          height: Constants.cardHeight + (slice.length - 1) * padding,
          width: Constants.cardWidth,
          child: Stack(
            children: List.generate(
              slice.length,
              (index) => Positioned(
                top: index * padding,
                child: CardWidget(card: slice[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
