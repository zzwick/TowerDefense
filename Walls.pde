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
        if (j == 20 && i < 170) {
          horizontal[i][j] = true;
        }
        if (j == 25 && i <165) {
          horizontal[i][j] = true;
        }
        if (i == 165 && j < 45 && j>=25) {
          vertical[i][j] = true;
        }
        if (i == 170 && j < 50 && j>=20) {
          vertical[i][j] = true;
        }
        if (j == 45 && i <= 165 && i > 20) {
          horizontal[i][j] = true;
        }
        if (j == 50 && i <= 170 && i> 25) {
          horizontal[i][j] = true;
        }
        if (i == 20 && j >=45 && j<70) {
          vertical[i][j] = true;
        }
        if (i == 25 && j >=50 && j< 65) {
          vertical[i][j] = true;
        }
        if (j == 65 && i >= 25 && i < 170) {
          horizontal[i][j] = true;
        }
        if (j == 70 && i < 165 && i>= 20) {
          horizontal[i][j] = true;
        }
        if (i == 170 && j >=65 && j<110) {
          vertical[i][j] = true;
        }
        if (i == 165 && j >=70 && j< 105) {
          vertical[i][j] = true;
        }
        if (j == 110 && i <= 170 && i > 65) {
          horizontal[i][j] = true;
        }
        if (j == 105 && i <= 165 && i> 60) {
          horizontal[i][j] = true;
        }
        if (i == 65 && j >=110 && j<135) {
          vertical[i][j] = true;
        }
        if (i == 60 && j >=105 && j< 140) {
          vertical[i][j] = true;
        }
        //
        if (j == 135 && i >= 65) {
          horizontal[i][j] = true;
        }
        if (j == 140 && i >= 60) {
          horizontal[i][j] = true;
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

  void collisionB(PVector fromPosition, Bloons b/*,PVector toPosition*/) {
    b.rightB = false;
    b.leftB = false;
    b.aboveB = false;
    b.belowB = false;
    //vertical and horizontal walls are flipped
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (vertical [i] [j]) {
          if (((arrayToPoint (i)) - fromPosition.x) < ((bloonRadius/2)+(wallHor/2))) {
            if (((arrayToPoint (i)) - fromPosition.x) > (-((bloonRadius/2)+(wallHor/2)))) {
              if (((arrayToPoint (j)+wallHor/2) - fromPosition.y) < ((bloonRadius/2)+(wallVert/2))) {
                if (((arrayToPoint (j)+wallHor/2) - fromPosition.y) > (-((bloonRadius/2)+(wallVert/2)))) {
                  if (((arrayToPoint (i)) - fromPosition.x) >= 0) {
                    hit = true;
                    b.rightB = true;
                    b.travelDirection = Dir.SOUTH;
                    //move a direction
                  } 
                  if (((arrayToPoint (i)) - fromPosition.x) < 0) {
                    b.leftB = true;
                    //move a direction
                    b.travelDirection = Dir.SOUTH;
                    hit = true;
                  }
                  if (((arrayToPoint (i)) - fromPosition.x) == 0) {
                    if (b.travelDirection == Dir.NORTH) {
                      b.aboveB = true;
                      hit = true;
                      //move a direction
                    } else if (b.travelDirection == Dir.SOUTH) {
                      b.belowB = true;
                      hit = true;
                      //move a direction
                      //temporary fix, if on left side move right, if on right side more left
                      if (b.position.x >= 450) {
                        b.travelDirection = Dir.WEST;
                      } else {
                        b.travelDirection = Dir.EAST;
                      }
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
                  if (((arrayToPoint (j)) - fromPosition.y) == 0) {
                    if (b.travelDirection == Dir.WEST) {
                      b.leftB = true;
                      hit = true;
                      //move a direction
                      b.travelDirection = Dir.SOUTH;
                    } else if (b.travelDirection == Dir.EAST) {
                      b.rightB = true;
                      hit = true;
                      //move a direction
                      b.travelDirection = Dir.SOUTH;
                    }
                  }
                  if (((arrayToPoint (j)) - fromPosition.y) > 0) {
                    b.belowB = true;
                    //move a direction
                    hit = true;
                    if (b.leftB == true) {
                      b.travelDirection = Dir.EAST;
                    } else if (b.rightB == true) {
                      b.travelDirection = Dir.WEST;
                    } else if (b.position.x >= 450) {
                      b.travelDirection = Dir.WEST;
                    } else {
                      b.travelDirection = Dir.EAST;
                    }
                  }
                  if (((arrayToPoint (j)) - fromPosition.y) < 0) {
                    b.aboveB = true;
                    //move a direction
                    hit = true;
                  }
                }
              }
          }
        }
      }
    }
    if (b.belowB) { 
      println("below");
    }
    if (b.rightB) {
      println("right");
    }
    if (b.leftB) {
      println("left");
    }
    if (b.aboveB) {
      println("above");
    }
  }

  //makes a wall for vertical oriented with vertically and shifter up dotsbloonsing/2
  //makes a wall for horizontal oriented horizontally it shifts it + dotsbloonsing/2
  void render() {
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (vertical [i] [j]) {
          fill(110, 232, 255);
          rect(arrayToPoint(i), arrayToPoint(j), wallHor, wallVert);
        }
        if (horizontal [i] [j]) {
          rectMode(CENTER);
          fill(110, 232, 255);
          rect(arrayToPoint(i), arrayToPoint(j), wallVert, wallHor);
        }
      }
    }
  }
}