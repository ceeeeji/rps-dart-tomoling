import 'dart:io';

/// This gets the player's name.
String getplayername(String player, String othername) {
  stdout.write("Enter $player name: ");
  String? input = stdin.readLineSync();

  String name = input?.trim() ?? "";

  if (name.isEmpty) {
    name = player;
  }

  if (name.toLowerCase() == othername.toLowerCase()) {
    print("That name is already taken.");
    return getplayername(player, othername);
  }

  return name;
}

/// This part checks if the player's move is valid or not.
String? validatemove(String input, List<String> moves) {
  String move = input.trim().toLowerCase();

  if (move.isEmpty) {
    return null;
  }

  if (moves.contains(move)) {
    return move;
  }

  return null;
}

/// Gets the valid move from the player, if it is invalid it will go back.
String getmove(String playername, List<String> moves) {
  while (true) {
    stdout.write("$playername, enter your move (rock/paper/scissors): ");

    String? input = stdin.readLineSync();

    String? move = validatemove(input ?? "", moves);

    if (move != null) {
      return move;
    }

    print("Invalid move. Please type rock, paper, or scissors.");
  }
}

/// This hides player 1 moves to avoid cheating.
void hidemove() {
  for (int i = 0; i < 30; i++) {
    print("");
  }
}

/// This is repsonsible for running the game.
void main() {
  final List<String> moves = ["", "rock", "paper", "scissors"];

  print("===== ROCK, PAPER, SCISSORS =====");

  String player1 = getplayername("Player 1", "");

  String player2 = getplayername("Player 2", player1);

  int score1 = 0;
  int score2 = 0;
  int round = 1;

  String move1 = getmove(player1, moves);

  hidemove();

  String move2 = getmove(player2, moves);

  print("$player1 chose $move1.");
  print("$player2 chose $move2.");

  print("The winner will be implemented in the next version.");
}
