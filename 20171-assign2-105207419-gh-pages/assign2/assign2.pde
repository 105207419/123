PImage backGround;
PImage soil;
PImage groundHog;
PImage life;
PImage soldier;
PImage cabbage;
PImage gameOver;
PImage groundhogDown;
PImage groundhogLeft;
PImage groundhogRight;
PImage restartHovered;
PImage restartNormal;
PImage startHovered;
PImage startNormal;
PImage title;
int soldierSpeed,soldierWalk,soldierY,cabbageX,cabbageY,lifeX=10,groundhogSpeed,groundhogDownY, groundhogDisplay,groundhogDirection,digTimer;
final int GAME_START=0,GAME_RUN=1,GAME_LOSE=2,STAND=3,GROUNDHOGDOWN=4;
int gameState,digDirection,image;
float groundhogY=80,digDuration,groundhogX=320,playerGridX,playerGridY;
boolean leftState,rightState,downState;
void setup() {
	size(640, 480, P2D);
backGround = loadImage("img/bg.jpg");
soil = loadImage("img/soil.png");
groundHog = loadImage("img/groundhogIdle.png");
life = loadImage("img/life.png");
soldier = loadImage("img/soldier.png");
cabbage = loadImage("img/cabbage.png");
gameOver = loadImage("img/gameover.jpg");
groundhogDown = loadImage("img/groundhogDown.png");
groundhogLeft = loadImage ("img/groundhogLeft.png");
groundhogRight = loadImage("img/groundhogRight.png");
restartHovered = loadImage("img/restartHovered.png");
restartNormal = loadImage("img/restartNormal.png");
startHovered = loadImage("img/startHovered.png");
startNormal = loadImage("img/startNormal.png");
title = loadImage("img/title.jpg");
soldierY=floor(random(2,5));
cabbageX = floor(random(0,8))*80;
cabbageY = floor(random(3,6))*80;
gameState = GAME_START;
playerGridX = groundhogX/80.0;
playerGridY = groundhogY/80.0;
	// Enter Your Setup Code Here
}

void draw() {

	// Switch Game State
		// Game Start

switch(gameState){
  case GAME_START:
      image(title,0,0);
      image(startNormal,248,360);
      
      if(mouseX>248 && mouseX<392 && mouseY>360 && mouseY<420){
        image(startHovered,248,360);
      if(mousePressed){gameState = GAME_RUN;
      }
      }
      break;
      }
      
		// Game Run
switch(gameState){
  case GAME_RUN:
 image(backGround,0,0);
  image(soil,0,160);//soil
    image(cabbage,cabbageX,cabbageY);//cabbage
noStroke();
  fill(124,204,25);
 rect(0,145,640,15);// Grass
 image(life,lifeX-70,10);//life
 image(life,lifeX,10);
 image(life,lifeX+70,10);
 fill(255,255,0);//SUN
 arc(590,50,130,130,0,360);
 fill(253,184,19);
 arc(590,50,120,120,0,360);
 
image(groundHog,groundhogX,groundhogY);//groundhog
if(digTimer==0&&keyPressed&&key==CODED){
  switch(keyCode){

    case LEFT:
    groundHog=groundhogLeft;
    digDirection=LEFT;
    digTimer=15;
    
   
  }
}


else if(digTimer>0){
  digTimer--;
  switch(digDirection){
    case LEFT:
    if(groundhogX>0){
   
        if(digTimer==0){
          groundHog=groundhogLeft;
            playerGridX--;
            groundhogX=80*playerGridX;
      
    }
   
        else{
          groundHog=groundhogLeft;
              groundhogX+=((float(digTimer)/15)-playerGridX-1);
              } }
    
  }  
  }
if(leftState==false){
  image(groundHog,groundhogX,groundhogY);
}


print(groundhogX);
  
 soldierSpeed=2;
 soldierWalk=(soldierWalk+soldierSpeed)%(650);
 image(soldier,soldierWalk-40,soldierY*80);//SOldier
 
 if(soldierWalk+40>groundhogX && soldierY*80<groundhogY+80 && soldierWalk-40<groundhogX+80 && soldierY*80+80>groundhogY){
   groundhogX=320;
   groundhogY = 80;
    lifeX-=70;//life    
       
    
 }
 if(groundhogX==cabbageX && groundhogY==cabbageY){
    cabbageX=-100;
    cabbageY=-100;
    lifeX+=70;
 }
 if(lifeX==-130){
   gameState=GAME_LOSE;
 }
 
   
 
		// Game Lose
switch(gameState){
  case GAME_LOSE:
  image(gameOver,0,0);
  image(restartNormal,248,360);

    if(mouseX>248 && mouseX<392 && mouseY>360 && mouseY<420){
        image(restartHovered,248,360);
      if(mousePressed){
        gameState = GAME_RUN;
        lifeX+=140;
        soldierY=floor(random(2,5));
        cabbageX = floor(random(0,8))*80;
      cabbageY = floor(random(3,6))*80;
      }
      }
   break;
   
}
print(digTimer);
}

void keyPressed(){
if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftState = true;
      break;
      case RIGHT:
      rightState = true;
      break;
      case DOWN:
      downState = true;
      break;
    }
  }
}



void keyReleased(){
   if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftState = false;
      break;
      case RIGHT:
      rightState = false;
      break;
      case DOWN:
      downState = false;
      break;
    }
  }
}