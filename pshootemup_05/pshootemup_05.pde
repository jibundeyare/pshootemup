int iWidth = 1280;
int iHeight = 600;

SpaceShip ship;
int shipVelocity = 20;

Magazine magazine;
int missileVelocity = 25;

int enemyMissileVelocity = 10;
int enemyVelocity = 5;
Fleet1 fleet1;

int missileHeight = 9;

int previousMillis = 0;

boolean pause = false;

void setup() {
  size(iWidth, iHeight, P3D);

  frameRate(60);

  smooth(2);

  ship = new SpaceShip();
  ship.position.x = 40;
  ship.position.y = round(height / 2.0);

  magazine = new Magazine();

  fleet1 = new Fleet1();
}

void draw() {
  background(0);

  if (!pause) {
    timer();

    magazine.tick();
    fleet1.tick();
  }

  detectCollision();

  magazine.clean();
  fleet1.clean();

  if (!ship.dead) {
    ship.draw();
  }

  magazine.draw();
  fleet1.draw();
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
      PVector firePosition = new PVector(ship.position.x + ship.width, ship.position.y + ship.height / 2.0 - missileHeight / 2.0);
      magazine.fire(firePosition);
      println("magazine.size: " + magazine.size);
    } else if (key == 'a') {
      fleet1.init();
      println("enemy init");
    } else if (key == 'z') {
      fleet1.fire();
      println("enemy fire");
    } else if (key == 'p') {
      pause = !pause;
      println("pause");
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

void timer() {
  int now = millis();

  if (now - previousMillis >= 5000) {
    fleet1.init();
    fleet1.fire();
    previousMillis = now;
  }
}

void detectCollision() {
  // detect collision between missiles and enemies
  fleet1.detectCollisionWithMissile(magazine);

  // detect collision between enemy missiles and spaceship
  fleet1.detectCollisionWithEnemyMissiles(ship);

  // detect collision betwwen spaceship and enemies
  fleet1.detectCollisionWithSpaceShip(ship);
}

