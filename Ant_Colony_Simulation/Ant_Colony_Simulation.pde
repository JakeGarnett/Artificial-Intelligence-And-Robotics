Instance myInstance;

void setup(){
  size (1500,1000);
  
  myInstance = new Instance(1000,int(random(900)),60);
  
  

}

void draw(){
  pushMatrix();

  background(0);
  
  
  myInstance.draw();
  
  popMatrix();

}
