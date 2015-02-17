void setup() {
  size(400, 800, P2D);
  frameRate(30);
}

void draw() {
  background(0, 204, 255);
  plant(15, 0.4, 0.8);
}

void leaf() {
  beginShape();
  fill(0, 204, 0);
    vertex(100.0, -70.0);
    bezierVertex(90.0, -60.0, 40.0, -100.0, 0.0, 0.0);
    bezierVertex(0.0, 0.0, 100.0, 40.0, 100.0, -70.0);
  endShape();
}    

boolean isMoving = true;

// mousePressed is a built-in Processing function, called every time a mouse button is pressed
// For more built-in functions check processing.org/reference
void mousePressed () {
  if (isMoving) {
    noLoop();
    isMoving = false;
  }
  else {
    loop();
    isMoving = true;
  }
}

void plant(int numLeaves, float minLeafScale, float maxLeafScale) {
  line(width/2, 0, width/2, height); // the plant's stem
  int gap = height/numLeaves; // vertical spacing between leaves
  float angle = 0;
  for(int i=0; i < numLeaves; i++) {
    int x = width/2;
    int y = gap*i + (int)random(gap);
    float scale = random(minLeafScale, maxLeafScale);
    
    pushMatrix();
    translate(x, y);
    rotate(angle);
    scale(scale);
    leaf();
    popMatrix();
    
    angle += PI;
    
  }
}
