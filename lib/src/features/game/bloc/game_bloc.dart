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
        MoveCards() => _moveCards(event, emit),
        AcceptMoveCards() => _acceptMoveCards(event, emit),
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
      tableau1: cards.sublist(0, 1)..last.opened = true,
      tableau2: cards.sublist(1, 3)..last.opened = true,
      tableau3: cards.sublist(3, 6)..last.opened = true,
      tableau4: cards.sublist(6, 10)..last.opened = true,
      tableau5: cards.sublist(10, 15)..last.opened = true,
      tableau6: cards.sublist(15, 21)..last.opened = true,
      tableau7: cards.sublist(21, 28)..last.opened = true,
    ));
  }

  void _openStock(
    OpenStock event,
    Emitter<GameState> emit,
  ) {
    final stock = state.stockCards;
    final waste = state.wasteCards;

    if (stock.isEmpty && waste.isEmpty) return;

    if (stock.isEmpty) {
      for (final card in waste) {
        card.opened = false;
      }
      emit(state.copyWith(
        stockCards: List<PlayingCard>.from(waste.reversed),
        wasteCards: [],
      ));
    } else {
      final newStock = List<PlayingCard>.from(stock);
      final newWaste = List<PlayingCard>.from(waste);
      final card = newStock.removeAt(0)..opened = true;
      newWaste.insert(0, card);

      emit(state.copyWith(
        stockCards: newStock,
        wasteCards: newWaste,
      ));
    }
  }

  void _moveCards(
    MoveCards event,
    Emitter<GameState> emit,
  ) async {
    for (final card in event.cards) {
      logger(card.rank);
    }
    emit(state.copyWith(movingCards: event.cards));
  }

  void _acceptMoveCards(
    AcceptMoveCards event,
    Emitter<GameState> emit,
  ) {
    logger('ACCEPT MOVE CARDS');
  }
}
