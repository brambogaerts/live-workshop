int counter = 0;

color gridForeground = color(255, 192, 190);
color gridBackground = color(0, 0, 0);

void setupGridScene() {
}

void drawGridScene() {
  colorMode(RGB, 255, 255, 255);
  
  if (frameCount % 30 == 0) {
    counter++;
    
    if (counter > 3) {
      counter = 0;
      
      color tmp = gridForeground;
      gridForeground = gridBackground;
      gridBackground = tmp;
    }
  }
  
  background(gridBackground);
  
  noStroke();
  
  int cellCountY = (int) pow(2, counter);
  float cellSize = (float) height / cellCountY;
  int cellCountX = (int) (width / cellSize);
  
  translate(width / 2, height / 2);
  
  for (int x = -cellCountX / 2; x <= cellCountX / 2; x++) {
    for (int y = -cellCountY / 2; y <= cellCountY / 2; y++) {
      if ((x + y) % 2 == 0) {
        pushMatrix();
        translate(x * cellSize, y * cellSize);
        
        stroke(255);
        noFill();
        strokeWeight(48);
        strokeCap(PROJECT);
        
        if (x % 2 == 0) {
          line(-48, 48, 48, -48);
        } else {
          stroke(gridForeground);
          line(-48, -48, 48, 48);
        }
        
        popMatrix();
      }
    }    
  }
}
