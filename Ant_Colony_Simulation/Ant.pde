Instance thisInstance;

class Ant{

  PVector position, direction,velocity,acceleration;
  
  int state,move =0;
  
  float x,y,t,r,v;
  boolean doOnce = false;
  float left,right,center,viewDistance,fovSize;
  
  float speed,maxSpeed,angle,turnStrength;
  
  Ant(int Xcoord, int Ycoord){    
    x = Xcoord;
    y = Ycoord;
    
    position = new PVector (x,y);
    velocity = new PVector (0,0);
    acceleration = new PVector(0,0);
    
    
  }
  
  void display(){
    pushMatrix();
    noStroke();
    fill(0);
    
    translate(position.x,position.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0,0,20,10);
    
     //line(newAnt2.x,newAnt2.y,newFood22.x,newFood2.y);
    popMatrix();
  }
  
  void update(){
    this.Pheromones();
    this.FOV();
    speed += 0.01;
    maxSpeed = 1;
    turnStrength = 2;
    t = t +(random(1)/2);
    
    
    if (speed > maxSpeed){
      speed = maxSpeed;
    }
    if( move == 0){
      state = 1;
    }
   
   
   //set the state to wander
   if (state == 1){ 
  
    if (noise(t+0.2)<0.5){
      angle += radians(random(turnStrength));
      
    }else{
      angle -= radians(random(turnStrength));
    } 
    
    int r = int(noise(t/4+random(1)/2));
    switch(r){
      case 0:
          position.x = position.x+cos(angle)*speed;
          position.y = position.y+sin(angle)*speed;
          this.checkEdges();
      break;
      case 1:
          position.x = position.x+cos(angle)*speed;
          position.y = position.y-sin(angle)*speed;
          this.checkEdges();
      break;
      case 2:
          position.x = position.x-cos(angle)*speed;
          position.y = position.y+sin(angle)*speed;
          this.checkEdges();
      break;
      case 3:
          position.x = position.x-cos(angle)*speed;
          position.y = position.y-sin(angle)*speed;
          this.checkEdges();
      break;
    }
   }
   
  }
  
  void checkEdges(){
  
    if (position.x>width- 20 || position.x < 10){
      //position.x *= -1;
      //println(position.x);
      angle += radians(random(10));
    }
    if (position.y>height-20 || position.y < 10){
       //position.y *= -1;
      angle -= radians(random(10));
      //println(position.y);
    } 
  }
  
  void Pheromones(){
    
    switch(state){
     case 0:
     
     break;
     case 1:
    
         float time =  noise(random(frameCount+0.04));
        // println(time);
         if (time < 0.2);
          {
             Pheromones newPheromone = new Pheromones(position.x,position.y,0);
            
            if(time <0.21)
            { doOnce = true;
            if(doOnce == true){
             // Pheromones newPheromone = new Pheromones(position.x,position.y,0);
              myInstance.normal.add(newPheromone);
           // println("Pheromone created");
              doOnce = false;
            }
          }  
         else{
         doOnce = false;
         }
          }
            
    break;    
    case 2:     
          time =  noise(random(frameCount+0.04));
        // println(time);
         if (time < 0.2);
          {
             Pheromones newPheromone = new Pheromones(position.x,position.y,1);
            
            if(time <0.21)
            { doOnce = true;
            if(doOnce == true){
             // Pheromones newPheromone = new Pheromones(position.x,position.y,0);
              myInstance.food.add(newPheromone);
           // println("Pheromone created");
              doOnce = false;
            }
          } 
          }    
    break; 
    case 3:
    
      
    break;
    }
    
  }
  
  void FOV(){
    fovSize = 200;
   
    translate(position.x,position.y);
    rotate(angle);
  
    //tint(100,0);
    //fill(0,);
    //arc(0,0, fovSize, fovSize, radians(-70), radians(70));
    
    //float r1 = myInstance.Foods.get(i).size/2;
    float r2 = fovSize/2;
     
     for (int j = 0; j < myInstance.Foods.size(); j++){
         boolean doOnce;
         float d = dist(position.x,position.y,myInstance.Foods.get(j).x,myInstance.Foods.get(j).y);
         float r1 = myInstance.Foods.get(j).size/2;
         //println (d);
         if(d < 50){
           //println("direction"+d);
            //Ants.get(i).move = 1;
            this.state = 2;
            
       
         }
     }
    
       
 
       
      
   
    
  
    }
 
    }
    
    
    
    

  
  
