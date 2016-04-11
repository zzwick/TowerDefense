class Tower {
  private PVector position;
  
  Tower (PVector c) {
    position = c;
  }
  
  void render() {
   fill(200,0,0);
   ellipse(position.x, position.y, 10,10);
  }
  void sendArrows() {
    for (int a = 0; a < 360; a=a+60) {
     arrow.add(new Arrow (position, a, 4));  
    }
  }
}