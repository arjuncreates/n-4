//n=4 lerp functions; Arjun Yadav - Nov, 2021.

PFont head;
PFont subhead;
PFont note; 

float Ax = 350;
float Ay = 300;

float Bx = 350;
float By = 400;

float Cx = 350;
float Cy = 600;

float Dx = 650;
float Dy = 700;

float AxFinishPos = 350;
float BxFinishPos = 350;
float CxFinishPos = 350;
float DxFinishPos = 350;

float AyFinishPos = 300;
float ByFinishPos = 400;
float CyFinishPos = 500; 

color letter = #2b2bf4;

float Pstroke = 20; 
float Lstroke = 20; 

boolean skelMode = false; 

float transp = 50; 

int m; 


void setup() {
  size (1000, 1000);
  //smooth ();
  head = createFont ("EBGaramond-SemiBoldItalic.ttf", 24);
  subhead = createFont ("IBMPlexSans-Light.ttf", 24);
  note = createFont ("IBMPlexSans-Medium.ttf", 14); 
  frameRate (60); 
}

void draw() {
  background (#EFEEEE);
  noStroke();
  textAlign (LEFT, TOP);
  textFont (head);
  textSize (24);
  fill (#303030);
  text ("n = 4", 41, 33);
  fill (#979595);
  textFont (subhead);
  text ("/explorations", 103, 33);
  
  textFont (note); 
  textSize (14); 
  fill (0, 80); 
  text ("PRESS S FOR SKELETON VIEW", 719, 955); 
  
  textFont (note); 
  fill (#979595); 
  textSize (14); 
  text ("Point A = " + int(AxFinishPos) + ", " +  int (AyFinishPos), 842, 30); 
  text ("Point B = " + int(BxFinishPos) + ", " +  int (ByFinishPos), 842, 50);
  text ("Point C = " + int (CxFinishPos) + ", " + int (CyFinishPos), 842, 70); 
  text ("Point D = " + int (DxFinishPos) + ", " + int (Dy), 842, 90);
  
  m = millis(); 

  //Creating the grid using 10px dots.
  strokeWeight (10);
  stroke (#979595, transp);
  for (int x = 350; x<=650; x = x+100) {
    for (int y = 300; y<=700; y = y+100) {
      point (x, y);
    }
  }

  //Point range available are P1 (350, 300) - P20 (650, 700) [20 points).
  strokeWeight (Pstroke);
  stroke (letter);
  point (Ax, Ay);
  point (Bx, By);
  point (Cx, Cy);
  point (Dx, Dy);

  strokeWeight (Lstroke);
  stroke (letter); 
  line (Ax, Ay, Bx, By);
  line (Bx, By, Cx, Cy);
  line (Cx, Cy, Dx, Dy);
  line (Dx, Dy, Bx, By);

  //Lerp of X Coordinates
  Ax = lerp (Ax, AxFinishPos, 0.1);
  Bx = lerp (Bx, BxFinishPos, 0.1);
  Cx = lerp (Cx, CxFinishPos, 0.1);
  Dx = lerp (Dx, DxFinishPos, 0.1);

  //Lerp of Y Coordinates
  Ay = lerp (Ay, AyFinishPos, 0.1);
  By = lerp (By, ByFinishPos, 0.1);
  Cy = lerp (Cy, CyFinishPos, 0.1); 
  
  if (skelMode == true){
    Pstroke = 25; 
    letter = 0; 
    Lstroke = 10; 
    transp = 50; 
  }
  else {
    letter = #2b2bf4;
    Pstroke = 20; 
    Lstroke = 20; 
    transp = 0; 
    if (key == 'g'){
      transp = 50; 
    }
  }
  
  if (frameCount%120 == 0){
        AxFinishPos = (random(350, 650));
    BxFinishPos = random (AxFinishPos, 650);
    CxFinishPos = random (350, BxFinishPos);
    DxFinishPos = random (CxFinishPos, 650);

    AyFinishPos = random (300, 350);
    ByFinishPos = random (400, 450);
    CyFinishPos = random (500, 550); 
  }
}

void keyPressed() {
  if (key == ' ') {
    AxFinishPos = (random(350, 650));
    BxFinishPos = random (AxFinishPos, 650);
    CxFinishPos = random (350, BxFinishPos);
    DxFinishPos = random (CxFinishPos, 650);

    AyFinishPos = random (300, 350);
    ByFinishPos = random (400, 450);
    CyFinishPos = random (500, 550); 
  }
  
  if (key == 's' || key == 'S'){
    skelMode = !skelMode; 
  }
  
}

void mousePressed(){
 if (mousePressed){
   saveFrame ("letter#####.jpg"); 
 }
}
