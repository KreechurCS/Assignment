class test
{
  int xPos;
  int yPos;
  test(int x, int y)
  {
    xPos = x;
    yPos = y;
  }
  
  void update()
  {
    rect(xPos,yPos,40,40);
  }
}