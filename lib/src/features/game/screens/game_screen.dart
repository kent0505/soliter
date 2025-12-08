import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../bloc/game_bloc.dart';
import '../models/playing_card.dart';
import '../widgets/card_widget.dart';
import '../widgets/cards_stack.dart';
import '../widgets/empty_card.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  static const routePath = '/GameScreen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  void onStock() {
    context.read<GameBloc>().add(OpenStock());
  }

  void onCard(PlayingCard card) {
    context.read<GameBloc>().add(MoveCard(card: card));
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).viewPadding.top + 16;

    return Scaffold(
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          logger(state.stockCards.length);

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ).copyWith(top: top),
            child: FittedBox(
              child: Column(
                children: [
                  Row(
                    spacing: 4,
                    children: [
                      _Fountdation(
                        cards: state.foundation1,
                        onPressed: onCard,
                      ),
                      _Fountdation(
                        cards: state.foundation2,
                        onPressed: onCard,
                      ),
                      _Fountdation(
                        cards: state.foundation3,
                        onPressed: onCard,
                      ),
                      _Fountdation(
                        cards: state.foundation4,
                        onPressed: onCard,
                      ),
                      const SizedBox(width: 60),
                      SizedBox(
                        width: 60,
                        child: state.wasteCards.isNotEmpty
                            ? CardWidget(
                                card: state.wasteCards.first,
                                onPressed: onCard,
                              )
                            : const SizedBox(),
                      ),
                      state.stockCards.isEmpty
                          ? EmptyCard(
                              asset: Assets.close,
                              onPressed: onStock,
                            )
                          : CardWidget(
                              card: state.stockCards.last,
                              opened: false,
                              amount: state.stockCards.length,
                              onPressed: (_) {
                                onStock();
                              },
                            ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      CardsStack(cards: state.tableau1),
                      CardsStack(cards: state.tableau2),
                      CardsStack(cards: state.tableau3),
                      CardsStack(cards: state.tableau4),
                      CardsStack(cards: state.tableau5),
                      CardsStack(cards: state.tableau6),
                      CardsStack(cards: state.tableau7),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Fountdation extends StatelessWidget {
  const _Fountdation({
    required this.cards,
    required this.onPressed,
  });

  final List<PlayingCard> cards;
  final void Function(PlayingCard card) onPressed;

  @override
  Widget build(BuildContext context) {
    return cards.isEmpty
        ? const EmptyCard(title: 'A')
        : CardWidget(
            card: cards.last,
            opened: false,
            amount: cards.length,
            onPressed: onPressed,
          );
  }
}
