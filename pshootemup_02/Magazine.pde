class Magazine {
  int size;
  ArrayList missiles;

  Magazine() {
    size = 200;
    missiles = new ArrayList();
  }

  void draw() {
    Missile missile;

    for (int i = 0; i < missiles.size(); i++) {
      missile = (Missile) missiles.get(i);

      if (!missile.dead) {
        missile.draw();
      }
    }
  }

  void fire(PVector position) {
    Missile missile;

    if (size > 0) {
      missile = new Missile();
      missile.position.x = position.x;
      missile.position.y = position.y;
      missiles.add(missile);
      size--;
    }
  }

  void tick() {
    Missile missile;

    for (int i = 0; i < missiles.size(); i++) {
      missile = (Missile) missiles.get(i);
      missile.position.x += missileVelocity;

      if (missile.position.x > width) {
        missile.dead = true;
      }
    }
  }

  void clean() {
    Missile missile;

    for (int i = missiles.size() - 1; i >= 0; i--) {
      missile = (Missile) missiles.get(i);

      if (missile.dead) {
        missiles.remove(i);
      }
    }
  }
}

