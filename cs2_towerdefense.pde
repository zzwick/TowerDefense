int wallVert = 3;
int wallHor = 10;
final int boardWidth = 900/wallHor; // number of dots across
final int boardHeight = 900/wallVert; // number of dots down
final int bloonRadius = 20;
int score = 0;
int gold = 100;
int lives = 3;
boolean aboveB = false;
boolean belowB = false;
boolean rightB = false;
boolean leftB = false;

float bloonSpeed = 2;

Walls walls;
ArrayList <Bloons> bloons;
ArrayList<Arrow> arrow = new ArrayList();
ArrayList<Tower> tower = new ArrayList();

void setup() {
  size(900, 900);
  walls = new Walls();
  bloons = new ArrayList ();
  bloons.add (new Bloons());
}

void draw() {
  clear();
  walls.render();
  //printScore();
  for (int i = 0; i < bloons.size(); i++) {
    if (bloons.get(i).bKill) {
      bloons.remove(i);
    } else {
      bloons.get(i).updatePositionB (bloons.get(i));
      bloons.get(i).render();
      new Bloons();
      lose();
    }
  }
  removeIfColliding();
}

float arrayToPoint(int x) {
  return (0.5 + x) * wallHor;
}

void lose () {
  if (lives == 0) {
    setup();
  }
}

void removeIfColliding () {
  for (int i = 0; i < bloons.size(); i++) {
    for (int j = 0; j < arrow.size(); j++) {
      Bloons bloon = bloons.get(i);
      Arrow arro = arrow.get(j);
      if (colliding (arro, bloon)) {
        bloons.remove(i);
        arrow.remove(j);
      }
    }
  }
}

boolean colliding (Arrow arrow, Bloons bloons) {
  float r1 = arrow.radius;
  float r2 = bloonRadius;
  PVector v1 = new PVector(arrow.center.x, arrow.center.y);
  PVector v2 = new PVector(bloons.position.x, bloons.position.y);
  float d = v1.dist(v2);
  if (d <= r1+r2) {
    return true;
  } else {
    return false;
  }
}