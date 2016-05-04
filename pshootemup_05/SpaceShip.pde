class SpaceShip {
  PImage img;
  int width;
  int height;
  PVector position;
  PGraphics pg;
  boolean dead;

  SpaceShip() {
    img = loadImage("playerShip1_blue.png");
    width = img.height;
    height = img.width;
    position = new PVector();
    pg = createGraphics(width, height, P2D);
    dead = false;

    pg.beginDraw();
      pg.translate(width, 0);
      pg.rotate(HALF_PI);
      pg.image(img, 0, 0);
    pg.endDraw();
  }

  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    image(pg, 0, 0);
    popMatrix();
  }
}

