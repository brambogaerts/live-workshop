//int lineCount = 10;

//ArrayList<Float> startLocations = new ArrayList<Float>();
//ArrayList<Float> endLocations = new ArrayList<Float>();

//void setupMovementScene() {
//  for (int i=0; i<lineCount; i++) {
//    startLocations.add(random(50, width - 50));
//    endLocations.add(random(50, width - 50));
//  }
//}

//void drawMovementScene() {
//  colorMode(RGB, 255, 255, 255);
  
//  if (frameCount % 60 == 0) {
//    startLocations.clear();
//    startLocations.addAll(endLocations);
    
//    endLocations.clear();
    
//    for (int i=0; i<lineCount; i++) {
//      endLocations.add(random(50, width - 50));
//    }
//  }
  
//  float time = ((float) frameCount % 60) / 60;
  
//  background(0);
//  stroke(255);
//  strokeWeight(2);
//  noFill();
//  translate(0, height / 2);
  
//  for (int i=0; i<lineCount; i++) {
//    float start = startLocations.get(i);
//    float end = endLocations.get(i);
    
//    float location = lerp(start, end, time);
    
//    line(location, -64, location, 64);
//  }
//}
