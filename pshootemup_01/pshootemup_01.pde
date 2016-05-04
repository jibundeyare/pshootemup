int iWidth = 1024;
int iHeight = 768;

SpaceShip ship;
int shipVelocity = 15;

Magazine magazine;
int missileVelocity = 20;

int missileHeight = 4;

void setup() {
  size(iWidth, iHeight, P3D);

  frameRate(60);

  smooth(2);

  ship = new SpaceShip();
  ship.position.x = 0;
  ship.position.y = round(height / 2.0);

  magazine = new Magazine();
}

void draw() {
  background(0);

  ship.draw();

  magazine.tick();
  magazine.clean();
  magazine.draw();
}

void init() {
  // must be first
  super.init();
}

void stop() {
  // must be last
  super.stop();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ship.position.y -= shipVelocity;
    } else if (keyCode == DOWN) {
      ship.position.y += shipVelocity;
    } else if (keyCode == LEFT) {
      ship.position.x -= shipVelocity;
    } else if (keyCode == RIGHT) {
      ship.position.x += shipVelocity;
    }
  } else {
    if (keyCode == ' ') {
      PVector firePosition = new PVector(ship.position.x + ship.width, ship.position.y + (ship.height / 2 - missileHeight / 2));
      magazine.fire(firePosition);
      println("magazine.size: " + magazine.size);
    }
  }

  if (ship.position.x < 0) {
    ship.position.x = 0;
  } else if (ship.position.x > width - ship.width) {
    ship.position.x = width - ship.width;
  } else if (ship.position.y < 0) {
    ship.position.y = 0;
  } else if (ship.position.y > height - ship.height) {
    ship.position.y = height - ship.height;
  }
}

