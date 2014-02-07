import "dart:math";

void main() {
  print("Hello, World!");
  montyHallListCalc();
}

void montyHallListCalc() {
  List<int> montyHall = [1,2,3];
  
  const int TRIALS = 1000000;
  
  int correct = 0;
  
  Random rand = new Random();
  
  for (int i= 0; i < TRIALS; i++) {
    montyHall.shuffle();
    
    int randDoor = montyHall[0];
    int guess = montyHall[(rand.nextInt(3))];
    int eliminated;
    
    bool guessCorrect = guess == randDoor;
    
    if (guessCorrect) {
//    Eliminating a door that is not the guess when the guess and the random door are the same (correct guess)
      if (guess == 1) {
        eliminated = 2;
      }
      else if (guess == 2) {
        eliminated = 3;
      }
      else if (guess == 3) {
        eliminated = 1;
      }
//    Changing the guess from the correct door to a door that hasn't been eliminated
      if (eliminated == montyHall[1]) {
          guess == montyHall[2];
      }
      else if (eliminated == montyHall[2]) {
        guess == montyHall[1];
      }
    }
    
//  If the guess is wrong, another wrong door will be eliminated, so they will switch to the correct door
    if (!guessCorrect) {
      correct++;
    }
  }
  print("The percentage of correct guesses was ${(correct / TRIALS) * 100}%");
}
