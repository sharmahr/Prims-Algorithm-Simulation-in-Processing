
ArrayList<PVector> points;
ArrayList<PVector> reached;
ArrayList<PVector> unreached;


void setup(){
size(800,800);
points = new ArrayList<PVector>();
reached = new ArrayList<PVector>();
unreached = new ArrayList<PVector>();
background(0);
}

void draw(){

  // drawing the points on the canvas  
for(PVector point:points){
  fill(255);
  unreached.add(point);
ellipse(point.x,point.y,30,30);
}

// adding the start vertice to the reached arrayList
  if(points.size()>0){
  reached.add(unreached.get(0));
  unreached.remove(0);
  println("vertices added in reached");
  }
  
  while(unreached.size()>0){
  float maxDistance = 1600;
 int reachedIndex = 0, unreachedIndex = 0; 
  
  for(int i =0; i<reached.size();i++){
  for(int j = 0; j< unreached.size(); j++){
    
    PVector point1 = reached.get(i);
    PVector point2 = unreached.get(j);
    
     float distance = dist(point1.x,point1.y,point2.x,point2.y);
     
     if(distance < maxDistance){
     maxDistance = distance;
     reachedIndex = i;
     unreachedIndex = j;
    }
 }
}
  fill(255);
  stroke(255);
  strokeWeight(3);
  
  line(reached.get(reachedIndex).x,reached.get(reachedIndex).y,
        unreached.get(unreachedIndex).x,unreached.get(unreachedIndex).y);
        
  reached.add(unreached.get(unreachedIndex));
  unreached.remove(unreachedIndex);
  

 }
}



void mousePressed(){
points.add(new PVector(mouseX,mouseY));
}
