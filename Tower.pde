class Tower {
  private PVector position;
  private int t;
  
  Tower (PVector c) {
    position = c;
  }
  
  void render() {
   fill(200,0,0);
   ellipse(position.x, position.y, 10,10);
  }
  void shootArrow() {
    for (float a = 0; a < 2*PI; a= a +(PI/3)) {
     arrow.add(new Arrow (position.copy(), a, 2));  
    }
  }
  void releaseArrows() {
    render();
    if (t%40 == 0) {
      shootArrow();
    }
    t = t+1;
  }
}