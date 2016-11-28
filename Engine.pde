class Engine
{
  float rotateSpeed = 1;
  int Inc;
  int xSize1 = 10, ySize1 = 10;
  int xSize2 = 10, ySize2 = 10;
  int xSize3 = 10, ySize3 = 10;
  int IncSwitch = 1;
  
  Engine()
  {

  }
  
  void Render()
  {
      fill(255,0,0, 100);
      stroke(0,255,255);
      strokeWeight(1);
      ellipse(80,640, 100, 100);
      pushMatrix();
      translate(80,640);
      rotate(rotateSpeed);
      noFill();
      stroke(255,160,0);
      strokeWeight(4);
      arc(0, 0, 100, 100, 0, radians(75));
      popMatrix();
      checkSpeed();
      internal();
  }
  
  void checkSpeed()
  {
    if (speed <= 0)
    {
      rotateSpeed = 0;
    }
    else if(speed > 0 && speed <= 100)
    {
      rotateSpeed += 0.03;
    }
    else if (speed > 100 && speed <= 200)
    {
      rotateSpeed += 0.06;
    }
    else if (speed > 200 && speed <= 300)
    {
      rotateSpeed += 0.09;
    }
    else if (speed > 300 && speed <= 400)
    {
      rotateSpeed += 0.12;
    }
    else if (speed > 400 && speed <= 500)
    {
      rotateSpeed += 0.15;
    }
    else if (speed > 500 && speed <= 601)
    {
      rotateSpeed += 0.18;
    }
  }
  
  void internal()
  {
    noFill();
    strokeWeight(1);
    ellipse(80, 640, Inc, Inc);
    pushMatrix();
    translate(80,640);
    rotate(rotateSpeed);
    ellipse(0, 0, Inc, ySize2);
    ellipse(0, 0, xSize3, Inc);
    line(0,0,Inc/2,0);
    line(0,0,-Inc/2,0);
    line(0,0,0,Inc/2);
    line(0,0,0,-Inc/2);
    triangle(-Inc/2, 0, 0, -Inc/2, Inc/2, 0);
    triangle(-Inc/2, 0, 0, Inc/2, Inc/2, 0);
    popMatrix();
    
    if (speed > 0)
      Inc = Inc + IncSwitch;
    //ySize1 = Inc + IncSwitch;
    if(Inc <= 0)
    {
      IncSwitch = 2;
    }
    else if(Inc >= 99)
    {
      IncSwitch = -2;
    }
  }
}