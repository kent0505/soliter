import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../bloc/game_bloc.dart';
import '../models/playing_card.dart';
import 'card_widget.dart';
import 'empty_card.dart';

class CardsStack extends StatelessWidget {
  const CardsStack({
    super.key,
    required this.cards,
    this.waste = false,
  });

  final List<PlayingCard> cards;
  final bool waste;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GameBloc>();

    final padding = waste ? 0.0 : 24.0;

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

                    return Transform.scale(
                      scale: 0.9,
                      alignment: Alignment.topCenter,
                      child: Material(
                        type: MaterialType.transparency,
                        child: SizedBox(
                          height: Constants.cardHeight +
                              (cards.length - 1) * padding,
                          width: Constants.cardWidth,
                          child: Stack(
                            children: List.generate(
                              movingCards.length,
                              (index) {
                                return Positioned(
                                  top: (startIndex + index) * padding,
                                  child: CardWidget(card: movingCards[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                childWhenDragging: SizedBox(
                  height: Constants.cardHeight + (childCards.length) * padding,
                  width: Constants.cardWidth,
                  child: Stack(
                    children: List.generate(
                      childCards.length,
                      (index) {
                        return Positioned(
                          top: index * padding,
                          child: CardWidget(card: childCards[index]),
                        );
                      },
                    ),
                  ),
                ),
                child: SizedBox(
                  height: Constants.cardHeight + (cards.length) * padding,
                  width: Constants.cardWidth,
                  child: Stack(
                    children: List.generate(
                      cards.length,
                      (index) {
                        return Positioned(
                          top: index * padding,
                          child: GestureDetector(
                            onPanStart: (details) {
                              if (!cards[index].opened) return;
                              bloc.add(MoveCards(cards: cards.sublist(index)));
                            },
                            child: Listener(
                              onPointerDown: (event) {
                                if (!cards[index].opened) return;
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
