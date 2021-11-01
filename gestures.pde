void leapOnSwipeGesture(SwipeGesture g, int state) {
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector positionStart    = g.getStartPosition();
  PVector direction        = g.getDirection();
  float   speed            = g.getSpeed();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  switch(state) {
  case 1: // Start

    break;
  case 2: // Update


    break;
  case 3: // Stop
  
    //println(direction);
    println("SwipeGesture: " + id);
    break;
  }
  
  direction.div(1000);
  //println(direction);
  
  ball.applyForce(direction);
  // println(direction);
}
