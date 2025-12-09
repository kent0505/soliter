import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../bloc/game_bloc.dart';
import '../models/playing_card.dart';
import 'card_widget.dart';
import 'empty_card.dart';

class CardsStack extends StatelessWidget {
  const CardsStack({super.key, required this.cards});

  final List<PlayingCard> cards;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GameBloc>();

    return cards.isEmpty
        ? const EmptyCard()
        : BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              final movingCards = state.movingCards;

              final childCards = cards.where((card) {
                return !movingCards.contains(card);
              }).toList();

              return Draggable<List<PlayingCard>>(
                feedback: Builder(
                  builder: (context) {
                    if (movingCards.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    final startIndex = cards.indexOf(movingCards.first);
                    final fullHeight =
                        Constants.cardHeight + (cards.length - 1) * 24;

                    return Material(
                      type: MaterialType.transparency,
                      child: SizedBox(
                        height: fullHeight,
                        width: Constants.cardWidth,
                        child: Stack(
                          children: List.generate(
                            movingCards.length,
                            (index) {
                              return Positioned(
                                top: (startIndex + index) * 24,
                                child: CardWidget(card: movingCards[index]),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
                childWhenDragging: SizedBox(
                  height: Constants.cardHeight + (childCards.length - 1) * 24,
                  width: Constants.cardWidth,
                  child: Stack(
                    children: List.generate(
                      childCards.length,
                      (index) {
                        return Positioned(
                          top: index * 24,
                          child: CardWidget(card: childCards[index]),
                        );
                      },
                    ),
                  ),
                ),
                child: SizedBox(
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
                              bloc.add(MoveCards(cards: cards.sublist(index)));
                            },
                            child: Listener(
                              onPointerDown: (event) {
                                bloc.add(
                                    MoveCards(cards: cards.sublist(index)));
                              },
                              child: CardWidget(
                                card: cards[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
  }
}
