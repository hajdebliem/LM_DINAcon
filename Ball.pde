class MyBall {

  // variables ____________________________________________________

  PVector pos;
  PVector rot = new PVector(0, 0, 0);
  PVector vel = new PVector(0, 0, 0);
  PVector acc = new PVector(0, 0, 0);
  PImage logo;
  PShape kugel;

  // constructor __________________________________________________

  MyBall(PVector tpos) {
    pos = tpos;
    logo = loadImage("textlogo.jpg");
    noStroke();
    kugel = createShape(SPHERE, 30);
  }

  // methods  ____________________________________________________

  void friction() {
    PVector friction = ball.rot.copy();
    friction.mult(-1);
    //friction.normalize();
    friction.mult(0.01);
    ball.applyForce(friction);
  }

  void applyForce(PVector force) {
    PVector f = force;
    vel.add(f);
  }
  
  void display() {
    //directionalLight(240, 20, 200, -1, 0, -1);
    //ambientLight(240, 20, 200);
    lights();
    translate(pos.x, pos.y, map(pos.z, 10, 80, 0, -300));
    shape(kugel);
  }

  void update(PVector tpos) {
    pos = tpos;
  }
  
  void textur() {
    kugel.setTexture(logo);
  }
  
  void bewegung() {
    rot.add(vel);
    vel.set(0, 0, 0);
    kugel.rotateY(rot.x);
    kugel.rotateX(rot.y);
    kugel.rotateZ(rot.z);
  }

  void reset() {
    //println(rot);
    rot.set(0.0, 0.0, 0.0);
   // println(rot);
  }
  
}
