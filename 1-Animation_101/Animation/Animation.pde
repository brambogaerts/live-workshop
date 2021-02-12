int scene = 0;

void setup() {
  size(1280, 720);
  
  setupGridScene();
  setupColorScene();
  setupMovementScene();
}

void draw() {
  if (frameCount % 120 == 0) {
    scene = floor(random(3));
  }
  
  switch (scene) {
    case 0:
    drawGridScene();
    break;
    case 1:
    drawColorScene();
    break;
    case 2:
    drawMovementScene();
    break;
  }
}
