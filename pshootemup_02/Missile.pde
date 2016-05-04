class Missile {
  PImage img;
  int width;
  int height;
  PVector position;
  PGraphics pg;
  boolean finished;

  Missile() {
    img = loadImage("laserBlue01.png");
    width = img.height;
    height = img.width;
    position = new PVector();
    pg = createGraphics(width, height, P2D);
    finished = false;

    pg.beginDraw();
      pg.translate(width, 0);
      pg.rotate(HALF_PI);
      pg.image(img, 0, 0);
    pg.endDraw();
  }

  void draw() {
    pushMatrix();
    // @info 75 = ship.width and 99 = ship.height
    translate(position.x + 75, position.y + (99 / 2.0 - height / 2.0));
    image(pg, 0, 0);
    popMatrix();
  }
}

