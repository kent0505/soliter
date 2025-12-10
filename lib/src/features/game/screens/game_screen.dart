import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../bloc/game_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).viewPadding.top + 16;

    return Scaffold(
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
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
                      CardsStack(
                        cards: state.foundation1,
                        foundation: true,
                      ),
                      CardsStack(
                        cards: state.foundation2,
                        foundation: true,
                      ),
                      CardsStack(
                        cards: state.foundation3,
                        foundation: true,
                      ),
                      CardsStack(
                        cards: state.foundation4,
                        foundation: true,
                      ),
                      const SizedBox(width: 60),
                      SizedBox(
                        width: 60,
                        child: state.wasteCards.isNotEmpty
                            ? CardsStack(
                                cards: state.wasteCards.reversed.toList(),
                                waste: true,
                              )
                            : const SizedBox(),
                      ),
                      state.stockCards.isEmpty
                          ? GestureDetector(
                              onTap: onStock,
                              child: const EmptyCard(asset: Assets.close),
                            )
                          : GestureDetector(
                              onTap: onStock,
                              child: CardWidget(
                                card: state.stockCards.last,
                                amount: state.stockCards.length,
                              ),
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
