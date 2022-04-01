class Pheromones{

  float x,y,v;
  float dangerCounter,foodCounter,normalCounter,takenCounter;
  float size = 5;
  PVector position;

  Pheromones(float xCoord, float yCoord, float Value){
  
    x = xCoord;
    y = yCoord;
    v = Value;
  
    position = new PVector(x,y);
    normalCounter = 0.033; 
  }
  
  void draw(){

    
    if(v == -1);{
      noStroke();
      fill(255,0,0);
      ellipse(position.x,position.y,size,size);
      
    
    }
    if(v == 0){
      noStroke();
      fill(0,0,255);
      ellipse(position.x,position.y,size,size);
    
    }
    if(v == 1){
      noStroke();
      fill(0,255,0);
      ellipse(position.x,position.y,size,size);
    
    }
    if(v == 2){
      noStroke();
      fill(177,177,0);
      ellipse(position.x,position.y,size,size);
    
    }
    
  }

}
