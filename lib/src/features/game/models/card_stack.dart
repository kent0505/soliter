import 'playing_card.dart';

class CardStack {
  List<PlayingCard> cards;

  CardStack(this.cards);

  // The user dragged card at index i → return all cards under it
  List<PlayingCard> getDraggedCards(int index) {
    return cards.sublist(index);
  }
}
