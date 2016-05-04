class Missile {
  int width;
  int height;
  PVector position;
  PGraphics pg;
  boolean dead;

  Missile() {
    width = 40;
    height = 4;
    position = new PVector();
    pg = createGraphics(width, height, P2D);
    dead = false;

    pg.beginDraw();
      pg.fill(255);
      pg.noStroke();
      pg.rect(0, 0, pg.width, pg.height);
    pg.endDraw();
  }

  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    image(pg, 0, 0);
    popMatrix();
  }
}

