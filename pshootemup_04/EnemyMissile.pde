class EnemyMissile {
  PImage img;
  int width;
  int height;
  PVector position;
  PGraphics pg;
  boolean finished;

  EnemyMissile() {
    img = loadImage("laserRed01.png");
    width = img.height;
    height = img.width;
    position = new PVector();
    pg = createGraphics(width, height, P2D);
    finished = false;

    pg.beginDraw();
      pg.translate(0, height);
      pg.rotate(-HALF_PI);
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

