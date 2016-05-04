class EnemyMagazine {
  ArrayList missiles;

  EnemyMagazine() {
    missiles = new ArrayList();
  }

  void draw() {
    EnemyMissile missile;

    for (int i = 0; i < missiles.size(); i++) {
      missile = (EnemyMissile) missiles.get(i);

      if (!missile.dead) {
        missile.draw();
      }
    }
  }

  void fire(PVector position) {
    EnemyMissile missile;

    missile = new EnemyMissile();
    missile.position.x = position.x;
    missile.position.y = position.y;
    missiles.add(missile);
  }

  void tick() {
    EnemyMissile missile;

    for (int i = 0; i < missiles.size(); i++) {
      missile = (EnemyMissile) missiles.get(i);
      missile.position.x -= enemyMissileVelocity;

      if (missile.position.x < 0) {
        missile.dead = true;
      }
    }
  }

  void clean() {
    EnemyMissile missile;

    for (int i = missiles.size() - 1; i >= 0; i--) {
      missile = (EnemyMissile) missiles.get(i);

      if (missile.dead) {
        missiles.remove(i);
      }
    }
  }
}

