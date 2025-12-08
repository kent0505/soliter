part of 'game_bloc.dart';

final class GameState {
  GameState({
    this.cards = const [],
    this.column1 = const [],
    this.column2 = const [],
    this.column3 = const [],
    this.column4 = const [],
    this.column5 = const [],
    this.column6 = const [],
    this.column7 = const [],
    this.target1 = const [],
    this.target2 = const [],
    this.target3 = const [],
    this.target4 = const [],
  });

  final List<PlayingCard> cards;

  final List<PlayingCard> column1;
  final List<PlayingCard> column2;
  final List<PlayingCard> column3;
  final List<PlayingCard> column4;
  final List<PlayingCard> column5;
  final List<PlayingCard> column6;
  final List<PlayingCard> column7;

  final List<PlayingCard> target1;
  final List<PlayingCard> target2;
  final List<PlayingCard> target3;
  final List<PlayingCard> target4;

  GameState copyWith({
    List<PlayingCard>? cards,
    List<PlayingCard>? column1,
    List<PlayingCard>? column2,
    List<PlayingCard>? column3,
    List<PlayingCard>? column4,
    List<PlayingCard>? column5,
    List<PlayingCard>? column6,
    List<PlayingCard>? column7,
    List<PlayingCard>? target1,
    List<PlayingCard>? target2,
    List<PlayingCard>? target3,
    List<PlayingCard>? target4,
  }) {
    return GameState(
      cards: cards ?? this.cards,
      column1: column1 ?? this.column1,
      column2: column2 ?? this.column2,
      column3: column3 ?? this.column3,
      column4: column4 ?? this.column4,
      column5: column5 ?? this.column5,
      column6: column6 ?? this.column6,
      column7: column7 ?? this.column7,
      target1: target1 ?? this.target1,
      target2: target2 ?? this.target2,
      target3: target3 ?? this.target3,
      target4: target4 ?? this.target4,
    );
  }
}
