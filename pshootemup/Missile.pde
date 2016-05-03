class Missile {
  int width;
  int height;
  PVector position;
  PGraphics pg;
  boolean finished;

  Missile() {
    width = 40;
    height = 4;
    position = new PVector();
    pg = createGraphics(width, height, P2D);
    finished = false;

    pg.beginDraw();
      pg.fill(255);
      pg.noStroke();
      pg.rect(0, 0, pg.width, pg.height);
    pg.endDraw();
  }

  void draw() {
    pushMatrix();
    // @info 50 = ship.width
    // @info 13 = ship.height / 2 - height / 2
    translate(position.x + 50, position.y + 13);
    image(pg, 0, 0);
    popMatrix();
  }
}

