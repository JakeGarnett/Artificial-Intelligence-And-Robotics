class Food{

  PVector position,direction,velocity,acceleration;
  
  final int size = 5;
  float x, y;
  
  float state;
  
  
  Food(float Xcoord, float Ycoord){    
    x = Xcoord;
    y = Ycoord;
    
    position = new PVector(x,y);
    
 
  }
  
  
  void draw(){
    fill(0,255,0);
    ellipse(position.x,position.y,size,size);
    noStroke();

  }
  
}
