part of 'game_bloc.dart';

@immutable
sealed class GameEvent {}

final class StartGame extends GameEvent {}

final class OpenStock extends GameEvent {}

final class MoveCards extends GameEvent {
  MoveCards({required this.cards});

  final List<PlayingCard> cards;
}
