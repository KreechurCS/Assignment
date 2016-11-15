class Radar
{
  int ang = 0;
  int ang2 = 0;
  
  Radar()
  {
  
  }
  
  void render()
  {
    stroke(0,255,255);
    strokeWeight(5);
    smooth();
    
    noFill();
  
    ang += 2;
    ang2 += 3;
    arc(width/2 - 30, 500, 200, 200, radians(ang2), radians(ang2 + 300));
    arc(width/2 - 30, 500, 190, 190, radians(-ang + 50), radians(-ang + 100));
    arc(width/2 - 30, 500, 180, 180, radians(ang2 + 80), radians(ang2 + 160));
    arc(width/2 - 30, 500, 170, 170, radians(ang + 100), radians(ang + 150));
    arc(width/2 - 30, 500, 160, 160, radians(-ang2 + 40), radians(-ang2 + 80));
    arc(width/2 - 30, 500, 150, 150, radians(-ang), radians(-ang + 330));
    
    fill(0,255,255,100);
    strokeWeight(1);
    ellipse(width/2 - 30, 500, 150,150);
    scanner();
    strokeWeight(1);
    stroke(0,255,255);
  }
  
  float theta = 1;
  void scanner()
  {
    stroke(0,255,0);
    strokeWeight(2);
    pushMatrix();
    translate(width/2 - 30, 500);
    rotate(theta);
    line(0, 0, 50,50);
    noStroke();
    fill(0,255,0, 100);
    arc(0,0,150,150,radians(20),radians(43));
    popMatrix();
    theta += 0.04;
  }
}