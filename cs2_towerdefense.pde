int wallVert = 5;
int wallHor = 5;
final int boardWidth = 900/wallHor; // number of dots across
final int boardHeight = 900/wallVert; // number of dots down
final int bloonRadius = 20;
int score = 0;
int gold = 100;
int lives = 10;
boolean aboveB = false;
boolean belowB = false;
boolean rightB = false;
boolean leftB = false;
int timeToNext = 100;
int tStart = 0;
boolean removedStep = false;

float bloonSpeed = 1.75;

Walls walls;
ArrayList <Bloons> bloons;
ArrayList<Arrow> arrow = new ArrayList();
ArrayList<Tower> tower = new ArrayList();

void setup() {
  size(900, 900);
  walls = new Walls();
  bloons = new ArrayList ();
  tower = new ArrayList ();
  lives = 10;
}

void draw() {
  clear();
  walls.render();
  buyTower();
  textSize(20);
  text(gold, 10, 30);
  fill(100, 0, 0);
  text(lives, 10, 50);
  int time = (millis());
  if (bloons.size() >0) {
    for (int i = 0; i < bloons.size(); i++) {
      if (bloons.get(i).bKill) {
        bloons.remove(i);
      } else {
        if (bloons.get(i).lostLife) {
          bloons.remove(i);
        } else {
          bloons.get(i).updatePositionB (bloons.get(i));
          bloons.get(i).render();
          lose();
        }
      }
      println(millis()-time);
    }
  }
  makeBloons(15, 100);
  if (tower.size() >0) {
    for (int i = 0; i < tower.size(); i++) {
      tower.get(i).releaseArrows();
    }
    for (int i = 0; i < arrow.size(); i++) {
      if (arrow.get(i).tooFar()) {
        arrow.remove(i);
      }
    }
    for (int i = 0; i < arrow.size(); i++) {
      arrow.get(i).render();
    }
  }
  removeFix();
}

float arrayToPoint(int x) {
  return (0.5 + x) * wallHor;
}

void lose () {
  if (lives == 0) {
    setup();
  }
}

void removeFix () {
  if (removedStep) {
    removedStep = false;
    removeIfColliding();
  }
  else {
    removeIfColliding();
  }
}

void removeIfColliding () {
  if (bloons.size() > 0) {
    for (int i = 0; i < bloons.size(); i++) {
      Bloons bloon = bloons.get(i);
      for (int j = 0; j < arrow.size(); j++) {
        Arrow arro = arrow.get(j);
        if (colliding (arro, bloon)) {
          if (removedStep == false) {
            //problem when multiple arrows hit the bloons
            bloons.remove(i);
            removedStep = true;
            score = score + 10;
            gold = gold + 10;
            arrow.remove(j);
          }
        }
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

void buyTower () {
  if (mousePressed) {
    if (tStart == 0) {
      tStart = 20;
      if (gold >= 50) {
        tower.add(new Tower(new PVector(mouseX, mouseY)));
        gold = gold - 50;
      }
    } else {
      tStart = tStart -1;
    }
  }
}
void makeBloons (int lower, int upper) {
  if (timeToNext == 0) {
    bloons.add(new Bloons());
    timeToNext = floor(random(lower, upper));
  } else {
    timeToNext = timeToNext -1;
  }
}