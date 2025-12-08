part of 'game_bloc.dart';

final class GameState {
  GameState({
    this.stockCards = const [],
    this.wasteCards = const [],
    this.tableau1 = const [],
    this.tableau2 = const [],
    this.tableau3 = const [],
    this.tableau4 = const [],
    this.tableau5 = const [],
    this.tableau6 = const [],
    this.tableau7 = const [],
    this.foundation1 = const [],
    this.foundation2 = const [],
    this.foundation3 = const [],
    this.foundation4 = const [],
  });

  final List<PlayingCard> stockCards;
  final List<PlayingCard> wasteCards;
  final List<PlayingCard> tableau1;
  final List<PlayingCard> tableau2;
  final List<PlayingCard> tableau3;
  final List<PlayingCard> tableau4;
  final List<PlayingCard> tableau5;
  final List<PlayingCard> tableau6;
  final List<PlayingCard> tableau7;
  final List<PlayingCard> foundation1;
  final List<PlayingCard> foundation2;
  final List<PlayingCard> foundation3;
  final List<PlayingCard> foundation4;

  GameState copyWith({
    List<PlayingCard>? stockCards,
    List<PlayingCard>? wasteCards,
    List<PlayingCard>? tableau1,
    List<PlayingCard>? tableau2,
    List<PlayingCard>? tableau3,
    List<PlayingCard>? tableau4,
    List<PlayingCard>? tableau5,
    List<PlayingCard>? tableau6,
    List<PlayingCard>? tableau7,
    List<PlayingCard>? foundation1,
    List<PlayingCard>? foundation2,
    List<PlayingCard>? foundation3,
    List<PlayingCard>? foundation4,
  }) {
    return GameState(
      stockCards: stockCards ?? this.stockCards,
      wasteCards: wasteCards ?? this.wasteCards,
      tableau1: tableau1 ?? this.tableau1,
      tableau2: tableau2 ?? this.tableau2,
      tableau3: tableau3 ?? this.tableau3,
      tableau4: tableau4 ?? this.tableau4,
      tableau5: tableau5 ?? this.tableau5,
      tableau6: tableau6 ?? this.tableau6,
      tableau7: tableau7 ?? this.tableau7,
      foundation1: foundation1 ?? this.foundation1,
      foundation2: foundation2 ?? this.foundation2,
      foundation3: foundation3 ?? this.foundation3,
      foundation4: foundation4 ?? this.foundation4,
    );
  }
}
