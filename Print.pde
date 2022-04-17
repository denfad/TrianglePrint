PVector[][] point = new PVector[20][20];
ArrayList<Triangle> tr = new ArrayList<>(); 
int count = 12;
float hue;
void setup() {
  size(1080,920, P3D);
  background(255);
  colorMode(HSB, 360,100,100);
  hue = random(100, 360);
  lights();
  scale(1.2);
  translate(-30,-40);
  
  

  for(int i = 0 ; i < count; i++) {
    for(int j = 0; j < count; j++){
      point[i][j] = new PVector(i * (width /count), j*(height / count), random(-20,20));
    }
    if(i > 0) {
       for(int j = 0; j < count-1; j++){
          tr.add(new Triangle(point[i-1][j], point[i][j], point[i][j+1]));
          tr.add(new Triangle(point[i-1][j], point[i-1][j+1], point[i][j+1]));
       }
    }
   }
   
    for(int i = 1 ; i < count-1; i++) {
      for(int j = 1; j < count-1; j++){
       point[i][j].x += random(-40,40);
        point[i][j].y += random(-40,40);
      }
    }
   
    for(Triangle t: tr) {
    fill(hue+random(-10,10), random(70,90), random(90,100));
    beginShape(TRIANGLES);
     vertex(t.v1.x, t.v1.y, t.v1.z);
      vertex(t.v2.x, t.v2.y, t.v2.z);
       vertex(t.v3.x, t.v3.y, t.v3.z);
    endShape();
  }
  
  
}

void draw() {
 
}

void keyPressed() {
background(255);
tr.clear();
scale(1.2);
  translate(-30,-40);
  hue = random(0, 360);
for(int i = 0 ; i < count; i++) {
    for(int j = 0; j < count; j++){
      point[i][j] = new PVector(i * (width /count), j*(height / count), random(-20,20));
    }
    if(i > 0) {
       for(int j = 0; j < count-1; j++){
          tr.add(new Triangle(point[i-1][j], point[i][j], point[i][j+1]));
          tr.add(new Triangle(point[i-1][j], point[i-1][j+1], point[i][j+1]));
       }
    }
   }
   
    for(int i = 1 ; i < count-1; i++) {
      for(int j = 1; j < count-1; j++){
       point[i][j].x += random(-40,40);
        point[i][j].y += random(-40,40);
      }
    }
   
    for(Triangle t: tr) {
    fill(hue+random(-10,10), random(70,90), random(90,100));
    beginShape(TRIANGLES);
     vertex(t.v1.x, t.v1.y, t.v1.z);
      vertex(t.v2.x, t.v2.y, t.v2.z);
       vertex(t.v3.x, t.v3.y, t.v3.z);
    endShape();
  }

}


class Triangle {
  PVector v1; 
  PVector v2; 
  PVector v3;
  
  Triangle(PVector v1, PVector v2, PVector v3) {
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;
  }

}
