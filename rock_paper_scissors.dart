import 'dart:io';

/// This gets the player's name.
String getngalan(String player, String isakangalan) {
  stdout.write("Enter $player name: ");
  String? input = stdin.readLineSync();

  String ngalan = input?.trim() ?? "";

  if (ngalan.isEmpty) {
    ngalan = player;
  }

  if (ngalan.toLowerCase() == isakangalan.toLowerCase()) {
    print("That name is already taken.");
    return getngalan(player, isakangalan);
  }

  return ngalan;
}

/// This part checks if the player's move is valid or not.
String? balidate(String input, List<String> moves) {
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
String kuhaagmove(String moduwa, List<String> moves) {
  while (true) {
    stdout.write("$moduwa, enter your move (rock/paper/scissors): ");

    String? input = stdin.readLineSync();

    String? move = balidate(input ?? "", moves);

    if (move != null) {
      return move;
    }

    print("Invalid move. Please type rock, paper, or scissors.");
  }
}

/// This hides player 1 moves to avoid cheating.
void tagoan() {
  for (int i = 0; i < 30; i++) {
    print("");
  }
}

/// This decides who will win the round.
String? kinsadaog(
  String player1,
  String player2,
  String move1,
  String move2,
  List<String> moves,
) {
  if (move1 == move2) {
    return null;
  } else if (move1 == moves[1] && move2 == moves[3]) {
    return player1;
  } else if (move1 == moves[2] && move2 == moves[1]) {
    return player1;
  } else if (move1 == moves[3] && move2 == moves[2]) {
    return player1;
  } else {
    return player2;
  }
}

/// This displays the final score and overall winner.
void paynalscore(String player1, String player2, int score1, int score2) {
  print("\n===== FINAL SCORE =====");
  print("$player1: $score1");
  print("$player2: $score2");

  if (score1 == score2) {
    print("Overall winner: It's a draw!");
  } else if (score1 > score2) {
    print("Overall winner: $player1");
  } else {
    print("Overall winner: $player2");
  }
}

/// This is responsible for running the game.
void main() {
  final List<String> moves = ["", "rock", "paper", "scissors"];

  print("===== ROCK, PAPER, SCISSORS =====");

  String player1 = getngalan("Player 1", "");

  String player2 = getngalan("Player 2", player1);

  int score1 = 0;
  int score2 = 0;
  int round = 1;

  String duwautro;

  do {
    print("\n--- Round $round ---");

    String move1 = kuhaagmove(player1, moves);

    tagoan();

    String move2 = kuhaagmove(player2, moves);

    print("$player1 chose $move1.");
    print("$player2 chose $move2.");

    String? winner = kinsadaog(player1, player2, move1, move2, moves);

    if (winner == null) {
      print("Result: ${winner ?? "It's a draw!"}");
    } else {
      print("Result: $winner wins the round!");

      if (winner == player1) {
        score1++;
      } else {
        score2++;
      }
    }

    print(
      "Score -> $player1: $score1 | "
      "$player2: $score2",
    );

    do {
      stdout.write("Play again? (y/n): ");
      String? answer = stdin.readLineSync();

      duwautro = (answer ?? "").trim().toLowerCase();

      if (duwautro != "y" && duwautro != "n") {
        print("Please enter y or n.");
      }
    } while (duwautro != "y" && duwautro != "n");

    round++;
  } while (duwautro == "y");
  paynalscore(player1, player2, score1, score2);
}
