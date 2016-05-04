class Fleet1 {
  int size;
  ArrayList ennemies;
  EnemyMagazine enemyMagazine;

  Fleet1() {
    size = 0;
    ennemies = new ArrayList();
    enemyMagazine = new EnemyMagazine();
  }

  void init(int size) {
    this.size = size;
    Enemy enemy;

    for (int i = 0; i < size; i++) {
      enemy = new Enemy();
      enemy.position.x = width + i * random(0, 100);
      enemy.position.y = i * 150 + random(0, 400);
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
}

