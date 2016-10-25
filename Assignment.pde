void setup()
{
  size(1000,700);
  background(0);
  noCursor();
}

int start = 0;
int loadbar = 0;
int fuelbar = 300;
void draw()
{
  frameRate(60);
  if (start == 1)
  {
    mainMenus();
  }
  else
  {
    loading();
  }
  myCursor();
  println(mouseX + "x");
  println(mouseY + "y");
}

void myCursor()
{
  noFill();
  stroke(0,255,0);
  strokeWeight(2);
  line(mouseX - 15, mouseY, mouseX - 5, mouseY);
  line(mouseX +15, mouseY, mouseX + 5, mouseY);
  ellipse(mouseX, mouseY, 5,5);
  strokeWeight(3);
  line(mouseX, mouseY + 15, mouseX, mouseY + 5);
}

void loading()
{
  background(0);
  fill(255);
  textSize(24);
  //for loading text
  if (loadbar <= 75)
  {
    text("Loading.",width/2 - 50, height/2);
  }
  else if (loadbar < 150 && loadbar >= 75)
  {
    text("Loading..",width/2 - 50, height/2);
  }
  if (loadbar < 225 && loadbar >= 150)
  {
    text("Loading...",width/2 - 50, height/2);
  }
  if (loadbar <= 300 && loadbar >= 225)
  {
    text("Loading....",width/2 - 50, height/2);
  }
  
  //for loading bar
  stroke(0);
  rect(width/2 - 150, height/2 + 20, 300, 40);
  fill(0,255,0);
  noStroke();
  rect(width/2 - 149, height/2 + 21, loadbar, 39);
  loadbar += 1;
  if (loadbar >= 300)
  {
    loadbar = 300;
     start = 1;
  }
}//end loading

void mainMenus()
{
  background(0);
  fill(100);
  stroke(0,202,255);
  strokeWeight(1);
  rect(0, height/2, width, height);
  fill(0);
  strokeWeight(5);
  stroke(0,202,255);
  rect(0,0,width,height/2);
  boolean fueling = false;
  fuelBar(fueling);
  
}

  int fuel = 100;
  int buttonDistX;
  int buttonDistY;
void fuelBar(boolean fueling)
{
  color fuelColor = color(255,0,0);
  stroke(0);
  fill(200);
  rect(width/2 + 150, height/2 + 50, 300, 40,15);
  fill(fuelColor);
  noStroke();
  rect(width/2 + 151, height/2 + 51, fuelbar, 39,15);

  fill(0);
  text("FUEL:", 765, 390);
  if (fuel >= 50 && fuel <= 90)
  {
    fuelColor = color(255,255,0);
  }
  else if (fuel >= 90)
  {
    fuelColor = color(0,255,0);
  }
    textSize(28);
  fill(fuelColor);
  text(fuel + "%", 860, 390);
  
  //Refuel Button
  
  
  // Fuel Losing
  if(frameCount % 5 == 0)
  {
    fuelbar -= 1;
  }
  fuel = fuelbar/3;
}