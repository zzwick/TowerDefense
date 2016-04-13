class Walls {
  // vertical walls.
  // This array is true for a given square if there is a wall to the right of that square
  private boolean[][] vertical;
  // horizontal - true if there is a wall below that square.
  private boolean[][] horizontal;
  private boolean hit = false;

  // A new set of walls, for testing purposes
  // eventually, we'll want some particular levels
  Walls() {
    this.vertical = new boolean[boardHeight][boardWidth];
    this.horizontal = new boolean[boardHeight][boardWidth];
    for (int i=0; i<boardHeight; i++) {
      for (int j=0; j<boardWidth; j++) {
        if (j == 70 || j == 90) {
          vertical[i][j] = true;
        } 
      }
    }
  }


  // Make a new Walls object from two arrays:
  // Horizontal & Vertical walls.
  // WISH check that dimensions are correct.
  Walls(boolean[][] h, boolean[][] v) {
    this.horizontal = h;
    this.vertical = v;
  }

  // If there is a wall between the two given positions, return the point of collision.
  // Otherwise, return some value that can never be a collision.
  // Input & Output are in pixel coordinates

  void collisionB(PVector fromPosition, Bloons b, Dir travelD/*,PVector toPosition*/) {
    rightB = false;
    leftB = false;
    aboveB = false;
    belowB = false;
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (vertical [i] [j]) {
          if (((arrayToPoint (i)) - fromPosition.x) < ((bloonRadius/2)+(wallHor/2))) {
            if (((arrayToPoint (i)) - fromPosition.x) > (-((bloonRadius/2)+(wallHor/2))))
              if (((arrayToPoint (j)+wallHor/2) - fromPosition.y) < ((bloonRadius/2)+(wallVert/2))) {
                if (((arrayToPoint (j)+wallHor/2) - fromPosition.y) > (-((bloonRadius/2)+(wallVert/2)))) {
                  if (((arrayToPoint (i)) - fromPosition.x) >= 0) {
                    hit = true;
                    rightB = true;
                    //move a direction
                  } 
                  if (((arrayToPoint (i)) - fromPosition.x) < 0) {
                    leftB = true;
                    //move a direction
                    hit = true;
                    if (((arrayToPoint (i)) - fromPosition.x) == 0) {
                      if (travelD == Dir.NORTH) {
                        aboveB = true;
                        hit = true;
                        //move a direction
                      } else if (travelD == Dir.SOUTH) {
                        belowB = true;
                        hit = true;
                        //move a direction
                      }
                    }
                  }
                }
              }
          }
        }
        if (horizontal [i] [j]) {
          if (((arrayToPoint (i)+wallHor/2) - fromPosition.x) < ((bloonRadius/2)+(wallVert/2))) {
            if (((arrayToPoint (i)+wallHor/2) - fromPosition.x) > (-((bloonRadius/2)+(wallVert/2))))
              if (((arrayToPoint (j)) - fromPosition.y) < ((bloonRadius/2)+(wallHor/2))) {
                if (((arrayToPoint (j)) - fromPosition.y) > (-((bloonRadius/2)+(wallHor/2)))) {
                  if (((arrayToPoint (j)) - fromPosition.y) > 0) {
                    belowB = true;
                        //move a direction
                    hit = true;
                  } 
                  if (((arrayToPoint (j)) - fromPosition.y) == 0) {
                    if (travelD == Dir.WEST) {
                      leftB = true;
                      hit = true;
                        //move a direction
                    } else if (travelD == Dir.EAST) {
                      rightB = true;
                      hit = true;
                        //move a direction
                    }
                  } 
                  if (((arrayToPoint (j)) - fromPosition.y) < 0) {
                    aboveB = true;
                        //move a direction
                    hit = true;
                  }
                }
              }
          }
        }
      }
    }
  }

  //makes a wall for vertical oriented with vertically and shifter up dotsbloonsing/2
  //makes a wall for horizontal oriented horizontally it shifts it + dotsbloonsing/2
  void render() {
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (vertical [i] [j]) {
          fill(110, 232, 255);
          rect(arrayToPoint(i), arrayToPoint(j)+wallHor/2, wallHor, wallVert);
        }
        if (horizontal [i] [j]) {
          rectMode(CENTER);
          fill(110, 232, 255);
          rect(arrayToPoint(i)+wallHor/2, arrayToPoint(j), wallVert, wallHor);
        }
      }
    }
  }
}