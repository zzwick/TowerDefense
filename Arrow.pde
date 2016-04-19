class Arrow {
  final PVector center;
  float angle;  //added float angle to the breakers so they go from the direction of the spaceship
  float speed;
  float radius = 5;
  final PVector origCent;

  Arrow(PVector c, float a, float s) {
    center = c;
    origCent = c.copy();
    angle = a;  //breaker now takes float angle
    speed = s;
  }


  //make the breaker at it's center, where it should be
  //update the breaker's position to be where it would be with velocity of it continued at the correct angle
  void render() {
    fill(100, 100, 255);
    stroke(0);
    PVector c = center;
    ellipse(c.x, c.y, 5, 5);
    c.x = c.x + cos(angle)*(height/160);
    c.y = c.y + sin(angle)*(height/160);      
  }
  Boolean tooFar () {
    PVector c = center;
    PVector og = origCent;
    if (dist(c.x,c.y,og.x,og.y) > 200) {
      return true;
    }
    else {
      return false;
    }
  }
}