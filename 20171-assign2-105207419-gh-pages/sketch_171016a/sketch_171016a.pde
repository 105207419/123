if(digTimer == 0 && keyPressed && key == CODED){

        switch(keyCode){
          case LEFT:
          if(playerX > 0){
            digDirection = LEFT;
            digTimer = 15;
            groundHogDisplay = groundhogLeft;
          }
          break;

else if(digTimer > 0){

        digTimer --;
        switch(digDirection){

          case LEFT:
          groundHogDisplay = groundhogLeft;
          if(digTimer == 0){
            playerGridX --;
            playerX = gridSize * playerGridX;
          }else{
            playerX = (float(digTimer) / digDuration + playerGridX - 1) * gridSize;
          }