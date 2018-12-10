class Particle {
  float x; 
  float y;
  float z = 0; // 0 as mouse position has only x and y
  float velX = random(10); // velocity in x direction, random 0-10
  float velY = random(10,30); // velocity in y direction, random 0-10
  float velZ = random(5,10); // velocity in z direction, random 5-10
  float gravity = 0.99; 
  int w = 20; // width of particle
  PShape ball;
  
  // constructor for particle 
  //@param mouseX, mouseY and texture
  Particle(float mX, float mY,  PImage temp) {
    this.x = mX;
    this.y = mY;
    // make the ball and apply texture
    this.ball = createShape(SPHERE, w);
    this.ball.setTexture(temp);
    this.ball.setStroke(false);
    
  }
  
  //display the ball at x,y,z
  void display() { 
    pushMatrix();
    translate(x, y, z);
    shape(this.ball);
    popMatrix();
  }

  void bounce() {  
    
    // keep track of previous x and z position 
    // to find if the ball has stop
    float preX = x; 
    float preZ = z;
    
    // calculations for gravity affecting x, y and z
    velX *= gravity; 
    x += velX ; 
    
    velY += gravity; // make sure it loses potential energy
    velY *= gravity;
    y += velY;
    
    velZ *= gravity;
    z += velZ;
    
    // check if the particle hits the wall
    // as our box is 150 x 150 and particle is size 20
    // 130 is when it will hit and bounce back
    if (x > 130|| x < -130) {
      x -= velX;
      velX *= -1;
    }

    if (y > 130|| y < -130) {
      y -= velY;
      velY *= -1;
      // check if ball is stationary, then make it stop
      if (preX == x && preZ == z){
        velY = 0;
      }
    }

    if (z > 130 || z < -130) {
      z -= velZ;
      velZ *= -1;
    }
  }
}
