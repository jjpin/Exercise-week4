final int GAME_RUN = 0;
final int GAME_OVER = 1;
int gameState;

float a;
float inc = TWO_PI/300;
float spacing = 40;
int ellipseX = 20;
int ellipseY = 30;
PImage restart;

void setup(){
  size(480,480);
  restart = loadImage("img/restart.png");
  gameState = GAME_RUN;
}

void draw(){
  switch(gameState){
    case GAME_RUN:
      background(255);
      
      for(int x = 40; x < width-40; x+=spacing){
        fill(#0000FF);
        noStroke();
        rect(x, 0, spacing, 200+sin(x/40-a)*20.0);
        rect(x, height, spacing, -200+sin(x/40-a)*20.0);   
        a += inc;
        
        fill(#00FF00);
        ellipse(ellipseX, ellipseY, 25, 25);
        if(mouseX >= ellipseX-25 && mouseX <= ellipseX+25){
          if(mouseY >= ellipseY-25 && mouseY <= ellipseY+25){
            if(mousePressed){
              ellipseX = mouseX;
              ellipseY = mouseY;
             }
           }
         }
         if(mouseX+12 >= x && mouseX-12 <= x+spacing){
           if(mouseY-12 <= 200+sin(x/40-a)*20.0){
              gameState = GAME_OVER;
           }
         }
         if(mouseX+12 >= x && mouseX-12 <= x+spacing){
           if(mouseY+12 >= 200+sin(x/40-a)*20.0+80){
              gameState = GAME_OVER;
           }
         }
       }   
    break;
    
    case GAME_OVER:
      image(restart, 5, 5);
      if(mouseX >= 5 && mouseX <= 45){
        if(mouseY >= 5 && mouseY <= 45){
          if(mousePressed){
            gameState = GAME_RUN;
            ellipseX = 20;
            ellipseY = 30;
          }
        }
      }
    break;
  }
}
