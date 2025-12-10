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
    required this.target,
  });

  final List<PlayingCard> cards;
  final int target;
}
