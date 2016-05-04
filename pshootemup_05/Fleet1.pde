class Fleet1 {
  int size;
  ArrayList ennemies;
  EnemyMagazine enemyMagazine;

  Fleet1() {
    size = 0;
    ennemies = new ArrayList();
    enemyMagazine = new EnemyMagazine();
  }

  void init() {
    size = (int) random(1, 4);
    Enemy enemy;

    for (int i = 0; i < size; i++) {
      enemy = new Enemy();
      enemy.position.x = width + i * random(0, 100);
      enemy.position.y = i * random(enemy.height, enemy.height * 3) + random(0, 400);
      ennemies.add(enemy);
    }
  }

  void draw() {
    Enemy enemy;

    enemyMagazine.tick();
    enemyMagazine.clean();
    enemyMagazine.draw();

    for (int i = 0; i < ennemies.size(); i++) {
      enemy = (Enemy) ennemies.get(i);

      if (!enemy.dead) {
        enemy.draw();
      }
    }
  }

  void fire() {
    Enemy enemy;

    for (int i = 0; i < ennemies.size(); i++) {
      enemy = (Enemy) ennemies.get(i);

      if (!enemy.dead) {
        PVector firePosition = new PVector(enemy.position.x - enemy.width / 2, enemy.position.y + enemy.height / 2 - missileHeight / 2);
        enemyMagazine.fire(firePosition);
      }
    }
  }

  void tick() {
    Enemy enemy;

    for (int i = 0; i < ennemies.size(); i++) {
      enemy = (Enemy) ennemies.get(i);
      enemy.position.x -= enemyVelocity;

      if (enemy.position.x + enemy.width < 0) {
        enemy.dead = true;
      }
    }
  }

  void clean() {
    Enemy enemy;

    for (int i = ennemies.size() - 1; i >= 0; i--) {
      enemy = (Enemy) ennemies.get(i);

      if (enemy.dead) {
        ennemies.remove(i);
      }
    }
  }

  void detectCollisionWithMissile(Magazine magazine) {
    Missile missile;
    Enemy enemy;

    for (int i = 0; i < magazine.missiles.size(); i++) {
      missile = (Missile) magazine.missiles.get(i);

      for (int j = 0; j < ennemies.size(); j++) {
        enemy = (Enemy) ennemies.get(j);

        if (missile.position.x >= enemy.position.x
          && missile.position.x + missile.width <= enemy.position.x + enemy.width
          && missile.position.y >= enemy.position.y
          && missile.position.y + missile.height <= enemy.position.y + enemy.height) {
          enemy.dead = true;
          missile.dead = true;
        }
      }
    }
  }

  void detectCollisionWithEnemyMissiles(SpaceShip ship) {
    EnemyMissile missile;

    if (!ship.dead) {
      for (int i = 0; i < enemyMagazine.missiles.size(); i++) {
        missile = (EnemyMissile) enemyMagazine.missiles.get(i);

        if (missile.position.x >= ship.position.x
          && missile.position.x + missile.width <= ship.position.x + ship.width
          && missile.position.y >= ship.position.y
          && missile.position.y + missile.height <= ship.position.y + ship.height) {
          ship.dead = true;
          missile.dead = true;
        }
      }
    }
  }

  void detectCollisionWithSpaceShip(SpaceShip ship) {
    Enemy enemy;

    if (!ship.dead) {
      for (int i = 0; i < ennemies.size(); i++) {
        enemy = (Enemy) ennemies.get(i);

        if (ship.position.x + ship.width >= enemy.position.x
          && ship.position.x + ship.width <= enemy.position.x + enemy.width
          && ship.position.y >= enemy.position.y
          && ship.position.y <= enemy.position.y + enemy.height) {
          enemy.dead = true;
          ship.dead = true;
        }
      }
    }
  }
}

