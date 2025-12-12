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
    required this.movingCards,
    this.targetCard,
  });

  final List<PlayingCard> movingCards;
  final PlayingCard? targetCard;
}
