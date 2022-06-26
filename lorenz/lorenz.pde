import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;
float x1 = 0.01;
float y1 = 0;
float z1 = 0;
float x2 = 0.01;
float y2 = 0;
float z2 = 0;

float a = 10;
float b = 28;
float c = 8.0/3.0;
float a1 = 5;
float b1 = 60;
float c1 = 2;
float a2 = 9;
float b2 = 58;
float c2 = 8.0/4.0;

float hue;
int hueSign = 1;
boolean remove = false;
float rotate = 0.01;
int counter = 0;

//PeasyCam cam;

ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<PVector> points1 = new ArrayList<PVector>();
ArrayList<PVector> points2 = new ArrayList<PVector>();

void setup() {
  fullScreen(P3D);
  colorMode(HSB);
  //cam = new PeasyCam(this, 500);
  strokeWeight(2);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  if (points.size() == 1000) {
    remove = true;
  } else if (points.size() == 1) {
    remove = false;
  }

  if (remove) {
    points.remove(0);
    points1.remove(0);
    points2.remove(0);
  } else {
    float dt = 0.01;
    float dx = (a * (y - x)) * dt;
    float dy = (x * (b - z) - y) * dt;
    float dz = (x * y - c * z) * dt;
    float dx1 = (a1 * (y1 - x1)) * dt;
    float dy1 = (x1 * (b1 - z1) - y1) * dt;
    float dz1 = (x1 * y1 - c1 * z1) * dt;
    float dx2 = (a2 * (y2 - x2)) * dt;
    float dy2 = (x2 * (b2 - z2) - y2) * dt;
    float dz2 = (x2 * y2 - c2 * z2) * dt;
    x += dx;
    y += dy;
    z += dz;
    x1 += dx1;
    y1 += dy1;
    z1 += dz1;
    x2 += dx2;
    y2 += dy2;
    z2 += dz2;

    points.add(new PVector(x, y, z));
    points1.add(new PVector(x1, y1, z1));
    points2.add(new PVector(x2, y2, z2));
  }

  noFill();
  scale(10);

  pushMatrix();
  rotateX(radians(-rotate));
  rotateY(radians(-rotate));
  rotateZ(radians(-rotate));
  hue = 140;
  for (PVector v : points) {
    stroke(hue, 255, 170);
    point(v.x, v.y, v.z);

    hue = hue + (0.5 * hueSign);

    if (hue > 150 || hue < 140) {
      hueSign *= -1;
    }
  }
  popMatrix();

  pushMatrix();
  rotateX(radians(rotate));
  rotateY(radians(rotate));
  rotateZ(radians(rotate));
  hue = 140;
  for (PVector v : points1) {
    stroke(hue, 255, 80);
    point(v.x, v.y, v.z);

    hue = hue + (0.5 * hueSign);

    if (hue > 150 || hue < 140) {
      hueSign *= -1;
    }
  }
  popMatrix();

  pushMatrix();
  rotateX(radians(rotate * 2));
  rotateY(radians(-rotate * 2));
  rotateZ(radians(rotate * 2));
  hue = 140;
  for (PVector v : points2) {
    stroke(hue, 255, 30);
    point(v.x, v.y, v.z);

    hue = hue + (0.5 * hueSign);

    if (hue > 150 || hue < 140) {
      hueSign *= -1;
    }
  }
  popMatrix();
  
  counter++;
  rotate += 0.1;
  //saveFrame("/images/lorentz####.png");
  //if (counter == 8000) {
  //  exit();
  //}
}
