class Engine
{
  float rotateSpeed = 1;
  Engine()
  {
    this.rotateSpeed = rotateSpeed;
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
      rotateSpeed += 0.01;
    }
    else if (speed > 100 && speed <= 200)
    {
      rotateSpeed += 0.03;
    }
    else if (speed > 200 && speed <= 300)
    {
      rotateSpeed += 0.05;
    }
    else if (speed > 300 && speed <= 400)
    {
      rotateSpeed += 0.07;
    }
    else if (speed > 400 && speed <= 500)
    {
      rotateSpeed += 0.09;
    }
    else if (speed > 500 && speed <= 601)
    {
      rotateSpeed += 1;
    }
  }
  
  void internal()
  {
   
  }
}