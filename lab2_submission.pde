ArrayList<Particle> particles; // ArrayList to stores all particles 
PImage texture0, texture1,texture2,texture3,texture4; // all textures
PImage[] textures; // array of textures
int number_of_textures = 5; 
void setup (){
   size(500,400,P3D);
   smooth();
   noStroke();
   particles = new ArrayList<Particle>();
   
   // initialise the array of textures and load images
   textures = new PImage[number_of_textures];
   textures[0] = loadImage("earth.jpg");
   textures[1] = loadImage("moon.jpg");
   textures[2] = loadImage("Basketball.jpg");
   textures[3] = loadImage("football.jpg");
   textures[4] = loadImage("tennis.jpg");
}

void draw(){
      background (0);
      translate(width/2, height/2, 0); // set the scene to be in the middle
      lights();
      
      // draw box
      pushMatrix();
      stroke(255);
      noFill();
      translate(0, 0, 0);
      box(300);
      popMatrix();
      
      // for each particle we add by clicking display it and bounce
      for (int i = 0; i < particles.size(); i++){
           Particle p = particles.get(i);
           p.display();
           p.bounce();
      }
}

void mousePressed(){
    // check if mouse is at valid position to make particle
    if ((mouseX > 145 && mouseX < 350) && (mouseY > 100 && mouseY < 300)){
      
      int rand = (int(random(0,5))); // randomise texture array index 
      PImage temp = (textures[rand]); // get the texture
      //add to list of particles and make new particle at mouse position
      particles.add(new Particle(mouseX - width/2, mouseY - height/2, temp));
      
    }
}
