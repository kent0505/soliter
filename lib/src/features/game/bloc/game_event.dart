part of 'game_bloc.dart';

@immutable
sealed class GameEvent {}

final class StartGame extends GameEvent {}

final class OpenStock extends GameEvent {}

final class MoveCard extends GameEvent {
  MoveCard({required this.card});

  final PlayingCard card;
}
