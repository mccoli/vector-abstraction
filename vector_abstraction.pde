import oscP5.*;

// based on Bridget Riley's 'Untitled [Fragment 6/9]' https://www.tate.org.uk/art/artworks/riley-untitled-fragment-6-9-p07109
// using osc to read users facial expression through wekinator
OscP5 oscP5;
float gesture = 0;

color[] colors = 
{
  #cc2e25, //red
  #235688, //navy
  #d99523, //mustard
  #7cabc7, //powder blue
  #d7797e, //salmon
  #a1bece, //grey-blue
  #59b4d6, //bright blue
};

// circle colours
int c1, c2, c3, c4, c5, c6, c7;

// groups of each circle type
PShape smallCircles;
PShape mediumCircles;
PShape largeCircles;

void setup() {
  size(600, 600, P2D);
  frameRate(5);
  
  oscP5 = new OscP5(this, 12000);
  
  smallCircles = createShape(GROUP);
  PShape sCircle = createShape(ELLIPSE, 25, 25, 10, 10);
  PShape sCircle1 = createShape(ELLIPSE, 95, 25, 10, 10);
  PShape sCircle2 = createShape(ELLIPSE, 25, 95, 10, 10);
  PShape sCircle3 = createShape(ELLIPSE, 60, 300, 10, 10);
  PShape sCircle4 = createShape(ELLIPSE, 165, 210, 10, 10);
  PShape sCircle5 = createShape(ELLIPSE, 195, 245, 10, 10);
  
  smallCircles.addChild(sCircle);
  smallCircles.addChild(sCircle1);
  smallCircles.addChild(sCircle2);
  smallCircles.addChild(sCircle3);
  smallCircles.addChild(sCircle4);
  smallCircles.addChild(sCircle5);
  
  mediumCircles = createShape(GROUP);
  PShape mCircle = createShape(ELLIPSE, 60, 60, 20, 20);
  PShape mCircle1 = createShape(ELLIPSE, 135, 135, 20, 20);
  PShape mCircle2 = createShape(ELLIPSE, 27, 210, 20, 20);
  
  mediumCircles.addChild(mCircle);
  mediumCircles.addChild(mCircle1);
  mediumCircles.addChild(mCircle2);
  
  largeCircles = createShape(GROUP);
  PShape lCircle = createShape(ELLIPSE, 95, 95, 30, 30);
  PShape lCircle1 = createShape(ELLIPSE, 35, 375, 30, 30);
  
  largeCircles.addChild(lCircle);
  largeCircles.addChild(lCircle1);

}

void draw() {
  background(227, 224, 222);
  
  if (gesture == 0) {
    print("try smiling at the screen!");
  }
  
  // randomising colours
  c1 = int(random(6));
  c2 = int(random(6));
  c3 = int(random(6));
  
  smallCircles.setStroke(false);
  smallCircles.setFill(colors[c1]);
  
  mediumCircles.setStroke(false);
  mediumCircles.setFill(colors[c2]);
  
  largeCircles.setStroke(false);
  largeCircles.setFill(colors[c3]);
  
  // top left
  shape(smallCircles);
  shape(mediumCircles);
  shape(largeCircles);
  
  // top right
  pushMatrix();
  translate(600, 0);
  rotate(HALF_PI);
  shape(smallCircles);
  shape(mediumCircles);
  shape(largeCircles);
  popMatrix();
  
  // bottom left
  pushMatrix();
  translate(0, 600);
  rotate(PI+HALF_PI);
  shape(smallCircles);
  shape(mediumCircles);
  shape(largeCircles);
  popMatrix();
  
  // bottom right
  pushMatrix();
  translate(600, 600);
  rotate(PI);
  shape(smallCircles);
  shape(mediumCircles);
  shape(largeCircles);
  popMatrix();
  
  noStroke();
  fill(255);
  circle(300, 300, 100+(gesture*200));
}

//gets called when msg is received, takes osc value and puts it into gesture variable
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.addrPattern().equals("/wek/outputs")) {
    gesture = theOscMessage.get(0).floatValue();
    // debug
    //print("gesture: " + gesture);
  }
}
