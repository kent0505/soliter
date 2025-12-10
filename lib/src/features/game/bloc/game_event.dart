part of 'game_bloc.dart';

@immutable
sealed class GameEvent {}

final class StartGame extends GameEvent {}

final class OpenStock extends GameEvent {}

final class MoveCards extends GameEvent {
  MoveCards({this.cards = const []});

  final List<PlayingCard> cards;
}

final class AcceptMoveCards extends GameEvent {
  AcceptMoveCards({
    required this.cards,
    this.foundation1 = false,
    this.foundation2 = false,
    this.foundation3 = false,
    this.foundation4 = false,
    this.tableau1 = false,
    this.tableau2 = false,
    this.tableau3 = false,
    this.tableau4 = false,
    this.tableau5 = false,
    this.tableau6 = false,
    this.tableau7 = false,
  });

  final List<PlayingCard> cards;
  final bool foundation1;
  final bool foundation2;
  final bool foundation3;
  final bool foundation4;
  final bool tableau1;
  final bool tableau2;
  final bool tableau3;
  final bool tableau4;
  final bool tableau5;
  final bool tableau6;
  final bool tableau7;
}
