import 'package:flutter/material.dart';
import 'move.dart';

String showResult(int playerNumber) {
  if (playerNumber == 0)
    return 'Tie';
  else if (playerNumber == 1)
    return 'You won!';
  else
    return 'You lost!';
}

bool isEndState(List<String> s) {
  var temp = findResult(s);
  if (temp == -1) return false;
  return true;
}

int findResult(List<String> statesT) {
  // Check rows
  for (int i = 0; i < 9; i += 3) {
    if (statesT[i] == statesT[i + 1] &&
        statesT[i + 1] == statesT[i + 2] &&
        statesT[i] != "empty") {
      if (statesT[i] == "circle") {
        return 1;
      } else if (statesT[i] == "cross") {
        return 2;
      }
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (statesT[i] == statesT[i + 3] &&
        statesT[i + 3] == statesT[i + 6] &&
        statesT[i] != "empty") {
      if (statesT[i] == "circle") {
        return 1;
      } else if (statesT[i] == "cross") {
        return 2;
      }
    }
  }

  // Check primary diagonal
  if (statesT[0] == statesT[4] &&
      statesT[4] == statesT[8] &&
      statesT[0] != "empty") {
    if (statesT[0] == "circle") {
      return 1;
    } else if (statesT[0] == "cross") {
      return 2;
    }
  }

  // Check secondary diagonal
  else if (statesT[2] == statesT[4] &&
      statesT[4] == statesT[6] &&
      statesT[2] != "empty") {
    if (statesT[2] == "circle") {
      return 1;
    } else if (statesT[2] == "cross") {
      return 2;
    }
  }

  // Check for empty spaces, if found -> game not over
  for (int i = 0; i < 9; i++) {
    if (statesT[i] == "empty") return -1;
  }

  // If no empty spaces and no winner then game is tied
  return 0;
}

int getScore(List<String> s, int depth) {
  int res = findResult(s);
  if (res == 1)
    return 10 + depth;
  else if (res == 2) return depth - 10;
  return 0;
}

Move minimiser(List<String> s, int depth) {
  if (isEndState(s)) {
    return Move(score: getScore(s, depth), index: -1);
  }

  Move min = new Move(score: 1000, index: -1);

  for (int i = 0; i < 9; i++) {
    if (s[i] == "empty") {
      s[i] = "cross";

      Move curr = maximiser(s, depth + 1);
      if (curr.score < min.score) {
        min.score = curr.score;
        min.index = i;
      }
      s[i] = "empty";
    }
  }
  return min;
}

Move maximiser(List<String> s, int depth) {
  if (isEndState(s)) {
    return Move(score: getScore(s, depth), index: -1);
  }

  Move max = new Move(score: -1000, index: -1);

  for (int i = 0; i < 9; i++) {
    if (s[i] == "empty") {
      s[i] = "circle";

      Move curr = minimiser(s, depth + 1);
      if (curr.score > max.score) {
        max.score = curr.score;
        max.index = i;
      }
      s[i] = "empty";
    }
  }
  return max;
}
