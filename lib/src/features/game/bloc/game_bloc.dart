import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/playing_card.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState()) {
    on<GameEvent>(
      (event, emit) => switch (event) {
        StartGame() => _startGame(event, emit),
      },
    );
  }

  void _startGame(
    StartGame event,
    Emitter<GameState> emit,
  ) async {}
}
