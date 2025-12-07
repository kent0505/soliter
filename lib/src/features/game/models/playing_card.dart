final class PlayingCard {
  PlayingCard({
    required this.title,
    required this.level,
    required this.suit,
  });

  final String title;
  final int level;
  final Suit suit;
}

enum Suit {
  heart, // ♥
  diamonds, // ♦
  clubs, // ♣
  spades, // ♠
}

List<PlayingCard> cards = [
  // 2
  PlayingCard(title: '2', level: 2, suit: Suit.heart),
  PlayingCard(title: '2', level: 2, suit: Suit.diamonds),
  PlayingCard(title: '2', level: 2, suit: Suit.clubs),
  PlayingCard(title: '2', level: 2, suit: Suit.spades),

  // 3
  PlayingCard(title: '3', level: 3, suit: Suit.heart),
  PlayingCard(title: '3', level: 3, suit: Suit.diamonds),
  PlayingCard(title: '3', level: 3, suit: Suit.clubs),
  PlayingCard(title: '3', level: 3, suit: Suit.spades),

  // 4
  PlayingCard(title: '4', level: 4, suit: Suit.heart),
  PlayingCard(title: '4', level: 4, suit: Suit.diamonds),
  PlayingCard(title: '4', level: 4, suit: Suit.clubs),
  PlayingCard(title: '4', level: 4, suit: Suit.spades),

  // 5
  PlayingCard(title: '5', level: 5, suit: Suit.heart),
  PlayingCard(title: '5', level: 5, suit: Suit.diamonds),
  PlayingCard(title: '5', level: 5, suit: Suit.clubs),
  PlayingCard(title: '5', level: 5, suit: Suit.spades),

  // 6
  PlayingCard(title: '6', level: 6, suit: Suit.heart),
  PlayingCard(title: '6', level: 6, suit: Suit.diamonds),
  PlayingCard(title: '6', level: 6, suit: Suit.clubs),
  PlayingCard(title: '6', level: 6, suit: Suit.spades),

  // 7
  PlayingCard(title: '7', level: 7, suit: Suit.heart),
  PlayingCard(title: '7', level: 7, suit: Suit.diamonds),
  PlayingCard(title: '7', level: 7, suit: Suit.clubs),
  PlayingCard(title: '7', level: 7, suit: Suit.spades),

  // 8
  PlayingCard(title: '8', level: 8, suit: Suit.heart),
  PlayingCard(title: '8', level: 8, suit: Suit.diamonds),
  PlayingCard(title: '8', level: 8, suit: Suit.clubs),
  PlayingCard(title: '8', level: 8, suit: Suit.spades),

  // 9
  PlayingCard(title: '9', level: 9, suit: Suit.heart),
  PlayingCard(title: '9', level: 9, suit: Suit.diamonds),
  PlayingCard(title: '9', level: 9, suit: Suit.clubs),
  PlayingCard(title: '9', level: 9, suit: Suit.spades),

  // 10
  PlayingCard(title: '10', level: 10, suit: Suit.heart),
  PlayingCard(title: '10', level: 10, suit: Suit.diamonds),
  PlayingCard(title: '10', level: 10, suit: Suit.clubs),
  PlayingCard(title: '10', level: 10, suit: Suit.spades),

  // J
  PlayingCard(title: 'J', level: 11, suit: Suit.heart),
  PlayingCard(title: 'J', level: 11, suit: Suit.diamonds),
  PlayingCard(title: 'J', level: 11, suit: Suit.clubs),
  PlayingCard(title: 'J', level: 11, suit: Suit.spades),

  // Q
  PlayingCard(title: 'Q', level: 12, suit: Suit.heart),
  PlayingCard(title: 'Q', level: 12, suit: Suit.diamonds),
  PlayingCard(title: 'Q', level: 12, suit: Suit.clubs),
  PlayingCard(title: 'Q', level: 12, suit: Suit.spades),

  // K
  PlayingCard(title: 'K', level: 13, suit: Suit.heart),
  PlayingCard(title: 'K', level: 13, suit: Suit.diamonds),
  PlayingCard(title: 'K', level: 13, suit: Suit.clubs),
  PlayingCard(title: 'K', level: 13, suit: Suit.spades),

  // A
  PlayingCard(title: 'A', level: 14, suit: Suit.heart),
  PlayingCard(title: 'A', level: 14, suit: Suit.diamonds),
  PlayingCard(title: 'A', level: 14, suit: Suit.clubs),
  PlayingCard(title: 'A', level: 14, suit: Suit.spades),
];
