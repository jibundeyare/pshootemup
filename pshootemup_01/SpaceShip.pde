class SpaceShip {
  int width;
  int height;
  PVector position;
  PGraphics pg;

  SpaceShip() {
    width = 50;
    height = 30;
    position = new PVector();
    pg = createGraphics(width, height, P2D);

    pg.beginDraw();
      fill(255);
      stroke(255);
      pg.triangle(0, 0, width, round(height / 2.0), 0, height);
    pg.endDraw();
  }

  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    image(pg, 0, 0);
    popMatrix();
  }
}

