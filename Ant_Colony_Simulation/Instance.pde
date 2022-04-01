class Instance {
  
  ArrayList <Ant> Ants; 
  ArrayList<Food> Foods;
  ArrayList<Pheromones> danger,food,normal,taken;
  int a,c,f,r1,r2,fRnd;
  
  float rndCluster,rndX,rndY;

  
  
  PVector cluster;
  
  

  Instance(int Ant, int Colony, int FoodClusters){
  
    a = Ant;
    f = FoodClusters;
    c = Colony;
    
    //println(a);
 
    
    Ants =new ArrayList<Ant>();
    Foods=new ArrayList<Food>();
    
    danger = new ArrayList<Pheromones>();
    normal = new ArrayList<Pheromones>();
    food = new ArrayList<Pheromones>();
    taken = new ArrayList<Pheromones>();
    
    
    
    for (int i = 0; i < a; i++){
        Ant newAnt = new Ant(c,c);
        Ants.add(newAnt);
        //println("ant added");
    }
    
   
    for(int i = 0; i < f ; i++){
         
        rndCluster = int(random(100));
        rndX = int(random(width));
        rndY = int(random(height));
        
        for (int j = 0; j < rndCluster; j++){
          
          Foods.add(new Food(int(random(rndX-5,rndX+5)),int(random(rndY-5,rndY+5))));
          
            
        }
        
  
      }
      
    
    
}
    
  
  void draw(){
   
   
    
    
    for (int i = 0; i < Foods.size(); i++){
        
        Foods.get(i).draw();
          
        
       
     }
    
     for (int i = 0; i < normal.size(); i++){
         
      normal.get(i).draw();
      if (normal.size()>5){
        float time = second() + 2;
        normal.get(i).size -= 0.03*time/time;
       // println(second());
         //normal.get(i+1).size -= 0.01*second()/second();
        //normal.get(i+2).size -= 0.1*second()/second();
        //normal.get(i+3).size -= 0.1*second()/second();
        if(normal.get(i).size < 0){
          normal.get(i).size = 0;
          normal.remove(i);
          normal.remove(i+1);
          
        }
        

    
     }
     }
     for (int j = 0; j < food.size(); j++){
        
        food.get(j).draw();
        if (food.size()>5){
        float time = second() + 2;
        food.get(j).size -= 0.06*time/time;
       // println(second());
         //normal.get(i+1).size -= 0.01*second()/second();
        //normal.get(i+2).size -= 0.1*second()/second();
        //normal.get(i+3).size -= 0.1*second()/second();
        if(food.get(j).size < 0){
          food.get(j).size = 0;
          food.remove(j);
          food.remove(j+1);
       //println("Ant at" + Ants.get(i).position.x + Ants.get(i).position.y );
     }
        }
     }
     for (int i = 0; i < taken.size(); i++){
         
      taken.get(i).draw();
       //println("Ant at" + Ants.get(i).position.x + Ants.get(i).position.y );
     }
     for (int i = 0; i < danger.size(); i++){
         
      danger.get(i).draw();
       //println("Ant at" + Ants.get(i).position.x + Ants.get(i).position.y );
     }
     for (int i = 0; i < Ants.size(); i++){
       pushMatrix();
       //Ants.get(i).display();
       Ants.get(i).update();
       Ants.get(i).FOV();
       //println("Ant at" + Ants.get(i).position.x + Ants.get(i).position.y );
       popMatrix();
       
       }
         
       }
     
      
     
       
   }
         
   
   
  
  
