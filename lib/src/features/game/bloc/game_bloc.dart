import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../models/playing_card.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState()) {
    on<GameEvent>(
      (event, emit) => switch (event) {
        StartGame() => _startGame(event, emit),
        OpenStock() => _openStock(event, emit),
        MoveCard() => _moveCard(event, emit),
      },
    );
  }

  void _startGame(
    StartGame event,
    Emitter<GameState> emit,
  ) async {
    final cards = List<PlayingCard>.from(playingCards)..shuffle();

    emit(state.copyWith(
      stockCards: cards.sublist(28),
      tableau1: cards.sublist(0, 1),
      tableau2: cards.sublist(1, 3),
      tableau3: cards.sublist(3, 6),
      tableau4: cards.sublist(6, 10),
      tableau5: cards.sublist(10, 15),
      tableau6: cards.sublist(15, 21),
      tableau7: cards.sublist(21, 28),
    ));
  }

  void _openStock(
    OpenStock event,
    Emitter<GameState> emit,
  ) {
    if (state.stockCards.isEmpty && state.wasteCards.isEmpty) return;

    if (state.stockCards.isEmpty) {
      emit(state.copyWith(
        stockCards: List<PlayingCard>.from(state.wasteCards.reversed),
        wasteCards: [],
      ));
    } else {
      final newStock = List<PlayingCard>.from(state.stockCards);
      final newWaste = List<PlayingCard>.from(state.wasteCards);
      final card = newStock.removeAt(0);
      newWaste.insert(0, card);

      emit(state.copyWith(
        stockCards: newStock,
        wasteCards: newWaste,
      ));
    }
  }

  void _moveCard(
    MoveCard event,
    Emitter<GameState> emit,
  ) async {
    logger('move card: ${event.card.rank} ${event.card.suit.name}');
  }
}
