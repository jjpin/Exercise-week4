float a = 40;
float inc = TWO_PI/300;

void setup(){
  size(480,480);
}

void draw(){
  background(255);
  int x = 0;
  float spacing = 40;
  
  for(x = 0; x < width; x+=spacing){
    fill(#0000FF);
    noStroke();
    rect(x, 0, spacing, 190+sin(x/40-a)*20.0);
    rect(x, height, spacing, -190+sin(x/40-a)*20.0);
    
    a += inc;
    
    fill(255);
    noStroke();
    rect(0, 0, 40, height);
    rect(440, 0, 40, height);
  }
}
