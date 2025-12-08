part of 'game_bloc.dart';

@immutable
sealed class GameEvent {}

final class StartGame extends GameEvent {}
