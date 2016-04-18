class Bloons {
  private PVector position;
  final float speed = bloonSpeed;
  private Dir travelDirection = Dir.EAST;
  private boolean bKill;
  private final float startHeight = wallHor*80;

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
      position = new PVector (position.x, position.y - speed);
    } else if (travelDirection == Dir.SOUTH) {
      position = new PVector (position.x, position.y + speed);
    } else if (travelDirection == Dir.EAST) {
      position = new PVector (position.x + speed, position.y);
    } else if (travelDirection == Dir.WEST) {
      position = new PVector (position.x - speed, position.y);
    }
      for (int i = 0; i < bloons.size(); i++) {
            walls.collisionB(position, b, b.travelDirection);
            moveIfCollideB();
    }
    makeBloons();
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
  
  void makeBloons () {
    float ranMake = random(0,1);
    if (ranMake < 0.01) {
      if (bloons.size() < 10) {
      bloons.add(new Bloons());
      }
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