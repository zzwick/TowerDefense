class Bloons {
  private PVector position;
  final float speed = bloonSpeed;
  private Dir travelDirection = Dir.EAST;
  private boolean bKill;
  private final float startHeight = wallHor*80;
  private boolean lostLife = false;

  Bloons() {
    position = new PVector(0, startHeight);
  }

  PVector getPosition() {
    return position.copy();
  }
  void render() {
    ellipseMode(CENTER);
    fill(0, 0, 200);
    ellipse(position.x, position.y, bloonRadius, bloonRadius);
  }
  void updatePositionB(Bloons b) {   
    if (travelDirection == Dir.NORTH) {
      position.set(position.x, position.y - speed);
    } else if (travelDirection == Dir.SOUTH) {
      position.set(position.x, position.y + speed);
    } else if (travelDirection == Dir.EAST) {
      position.set(position.x + speed, position.y);
    } else if (travelDirection == Dir.WEST) {
      position.set(position.x - speed, position.y);
    }
      for (int i = 0; i < bloons.size(); i++) {
            walls.collisionB(position, b, b.travelDirection);
            moveIfCollideB();
    }
    if (b.position.x > 900) {
      b.lostLife = true;
      lives = lives-1;
    }
      
  }
  void moveIfCollideB () {
    if (rightB) {
      //    position = (position.x - wallHor, position.y);
      position.x = position.x - wallHor;
    } else if (leftB) {
      //    position = (position.x + wallHor, position.y);
      position.x = position.x + wallHor;
    }
    if (aboveB) {
      //    position = (position.x , position.y + wallHor);
      position.y = position.y + wallHor;
    } else if (belowB) {
      //    position = (position.x , position.y - wallHor);
      position.y = position.y - wallHor;
    }
  }
  
/*    void kill (PVector fromPosition, PVector toPosition) {
    if (abs(fromPosition.x - toPosition.x) < (bloonRadius+ arrow.radius)) {
      if (abs(fromPosition.y - toPosition.y) < (bloonRadius+ arrow.radius)) {
        if (power.killer == false) {
        killed =  true;
        bKill = false;
        }
        else {
          bKill = true;
          bloonsRemoved = bloonsRemoved + 1;
        }
      }
    }
  }
  */
}