class panning
{
  float theta = 0;
  
  panning()
  {
    
  }
  
  void render()
  {
    strokeWeight(3);
    stroke(0,255,0);
    pushMatrix();
    translate(width/2, 200);
    rotate(theta);
    line(-20, 0, -160, 0);
    line(20, 0, 160, 0);
    line(-5, 10, 0, 5);
    line(5, 10, 0, 5);
    popMatrix();
    if (keyPressed)
    {
      if(keyCode == RIGHT)
      {
        theta += 0.01;
        if (theta > 0.46)
        {
          theta = 0.46;
        }
      }
      if (keyCode == LEFT)
      {
        theta -= 0.01;
        if (theta < -0.46)
        {
          theta = -0.46;
        }
      }
    }
  }
}