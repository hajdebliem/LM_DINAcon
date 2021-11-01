import de.voidplus.leapmotion.*;
LeapMotion leap;

import codeanticode.syphon.*;
SyphonServer server;

MyBall ball;

boolean back = false;

void setup() {
  //fullScreen(P3D);
  size(1200 , 600, P3D);
  //pixelDensity(2);
  leap = new LeapMotion(this).allowGestures("swipe");
  PVector start = new PVector(width/2, height/2, 0);
  ball = new MyBall(start);
  server = new SyphonServer(this, "Ball");
  background(0);
}

void draw() {
  if(back){
   background(0); 
  }
 
  for (Hand hand : leap.getHands ()) {
    //PVector indexTip = hand.getIndexFinger().getRawPositionOfJointTip();
    boolean handIsRight        = hand.isRight();
    boolean handIsLeft        = hand.isLeft();
    float   handPinch          = hand.getPinchStrength();
    float   handGrab           = hand.getGrabStrength();
    PVector handPosition       = hand.getPosition();
    PVector spherePosition     = hand.getSpherePosition();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();

    if (handIsRight) {
      if (handGrab > 0.95) {
        //ball.update(handPosition);
        ball.update(spherePosition);
      }
    }
    //pos = indexTip;
    //hand.draw();
  }
  
  ball.textur();
  ball.display();
  ball.bewegung();
  ball.friction();
  server.sendScreen();
}


void keyPressed() {

  if (key == 'r') {
    ball.reset();
    
  }
  if (key == 'b') {
     if(back){
       back = false;
     } else {
       back = true;
     }
  }
  
}
