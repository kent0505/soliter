final class PlayingCard {
  PlayingCard({
    required this.rank,
    required this.suit,
    this.opened = false,
  });

  final int rank;
  final Suit suit;
  bool opened;
}

enum Suit {
  hearts, // ♥
  diamonds, // ♦
  clubs, // ♣
  spades, // ♠
}

List<PlayingCard> playingCards = [
  // 2
  PlayingCard(rank: 2, suit: Suit.hearts),
  PlayingCard(rank: 2, suit: Suit.diamonds),
  PlayingCard(rank: 2, suit: Suit.clubs),
  PlayingCard(rank: 2, suit: Suit.spades),

  // 3
  PlayingCard(rank: 3, suit: Suit.hearts),
  PlayingCard(rank: 3, suit: Suit.diamonds),
  PlayingCard(rank: 3, suit: Suit.clubs),
  PlayingCard(rank: 3, suit: Suit.spades),

  // 4
  PlayingCard(rank: 4, suit: Suit.hearts),
  PlayingCard(rank: 4, suit: Suit.diamonds),
  PlayingCard(rank: 4, suit: Suit.clubs),
  PlayingCard(rank: 4, suit: Suit.spades),

  // 5
  PlayingCard(rank: 5, suit: Suit.hearts),
  PlayingCard(rank: 5, suit: Suit.diamonds),
  PlayingCard(rank: 5, suit: Suit.clubs),
  PlayingCard(rank: 5, suit: Suit.spades),

  // 6
  PlayingCard(rank: 6, suit: Suit.hearts),
  PlayingCard(rank: 6, suit: Suit.diamonds),
  PlayingCard(rank: 6, suit: Suit.clubs),
  PlayingCard(rank: 6, suit: Suit.spades),

  // 7
  PlayingCard(rank: 7, suit: Suit.hearts),
  PlayingCard(rank: 7, suit: Suit.diamonds),
  PlayingCard(rank: 7, suit: Suit.clubs),
  PlayingCard(rank: 7, suit: Suit.spades),

  // 8
  PlayingCard(rank: 8, suit: Suit.hearts),
  PlayingCard(rank: 8, suit: Suit.diamonds),
  PlayingCard(rank: 8, suit: Suit.clubs),
  PlayingCard(rank: 8, suit: Suit.spades),

  // 9
  PlayingCard(rank: 9, suit: Suit.hearts),
  PlayingCard(rank: 9, suit: Suit.diamonds),
  PlayingCard(rank: 9, suit: Suit.clubs),
  PlayingCard(rank: 9, suit: Suit.spades),

  // 10
  PlayingCard(rank: 10, suit: Suit.hearts),
  PlayingCard(rank: 10, suit: Suit.diamonds),
  PlayingCard(rank: 10, suit: Suit.clubs),
  PlayingCard(rank: 10, suit: Suit.spades),

  // J
  PlayingCard(rank: 11, suit: Suit.hearts),
  PlayingCard(rank: 11, suit: Suit.diamonds),
  PlayingCard(rank: 11, suit: Suit.clubs),
  PlayingCard(rank: 11, suit: Suit.spades),

  // Q
  PlayingCard(rank: 12, suit: Suit.hearts),
  PlayingCard(rank: 12, suit: Suit.diamonds),
  PlayingCard(rank: 12, suit: Suit.clubs),
  PlayingCard(rank: 12, suit: Suit.spades),

  // K
  PlayingCard(rank: 13, suit: Suit.hearts),
  PlayingCard(rank: 13, suit: Suit.diamonds),
  PlayingCard(rank: 13, suit: Suit.clubs),
  PlayingCard(rank: 13, suit: Suit.spades),

  // A
  PlayingCard(rank: 14, suit: Suit.hearts),
  PlayingCard(rank: 14, suit: Suit.diamonds),
  PlayingCard(rank: 14, suit: Suit.clubs),
  PlayingCard(rank: 14, suit: Suit.spades),
];
