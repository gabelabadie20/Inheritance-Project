float angle = 0;
PImage sunTexture;
PShape sun;
PImage earthTexture;
PShape earth;
float cameraZoom = 500;
float scrollSensitivity = 50;



void setup() {
  sunTexture = loadImage("8k_sun.jpg");
  earthTexture = loadImage("8k_earth_daymap.jpg");
  sun = createShape(SPHERE, 1000);
  sun.setTexture(sunTexture);
  earth = createShape(SPHERE, 100);
  earth.setTexture(earthTexture);
  size(1920, 1080, P3D);
}

void draw() {
  translate(width/2, height/2, 0);
  updateSky();
  updateClock();
  camera(0, 10000 + cameraZoom, 0 /*(height/2.0) / tan(PI*30.0 / 180.0) + cameraZoom*/, 0, 0, 0, 0, 0, 1);
  perspective(radians(90), float(width)/float(height), 0.1, 100000);
  //lights();
  updateSphere();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  cameraZoom += (Math.signum(e) * scrollSensitivity);
}

void updateSky() {
  background(0, 0, 0);
}

void updateClock() {
  textSize(100);
  textAlign(CENTER, CENTER);  
  fill(0, 0, 0);
  stroke(255, 255, 255);
  for (int x = -1; x < 2; x++) {
    fill(255, 255, 255);
    text(hour() + ":" + minute() + ":" + second(), x, 0);
    text(hour() + ":" + minute() + ":" + second(), 0, x);
  }
  fill(0, 0, 0);
  text(hour() + ":" + minute() + ":" + second(), 0, 0);
}

void updateSphere() {
  pushMatrix();
  translate(0, 0, 0);
  sun.setEmissive(100);
  sun.setStroke(false);
  shape(sun);
  popMatrix();

  pushMatrix();
  translate(109 * 100, 0, 0  );
  rotateY(radians(map(second() + (minute() * 60.0) + (hour() * 60.0 * 60.0), 0, 86400, 0, 360)));
  earth.setStroke(false);
  shape(earth);
  popMatrix();
  
  pushMatrix();
  translate(109 * 100, 0, 100);
  fill(255, 255, 255);
  text("Earth", 100, 100);
  popMatrix();
}
