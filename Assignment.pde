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
  PFont zian;
  zian = loadFont("Zian.vlw");
  textFont(zian);
  frameRate(60);
  if (start == 1)
  {
    mainMenus();
    overlay();
    pulse();
    myCursor();
    radar();
  }
  else
  {
    loading();
    myCursor();
  }
  println(mouseX + "x");
  println(mouseY + "y");
}

void myCursor()
{
  noFill();
  stroke(0,255,0);
  strokeWeight(2);
  line(mouseX - 14, mouseY, mouseX - 6, mouseY);
  line(mouseX +14, mouseY, mouseX + 6, mouseY);
  ellipse(mouseX, mouseY, 4,4);
  strokeWeight(3);
  line(mouseX, mouseY + 15, mouseX, mouseY + 6);
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
  noStroke();
  fill(100);
  triangle(0,290, 0, 360, 75, 360);
  triangle(width, 290, width, 360, width -75, 360);
  
  statusBox();
  boolean fueling = false;
  fuelBar(fueling);
  shield();
  
}//END mainMenus

  int fuel = 100;
  int buttonDistX;
  int buttonDistY;

void overlay()
{
  fill(0,159,255,50);
  //main rect
  rect(50,70, width - 100, 220);
  rect(30,70, 20, 220);
  rect(width - 30, 70, -20, 220);
  rect(110,30, 780, 40);
  //bottom left
  triangle(50,320, 50, 290, 30, 290);
  triangle(50,320, 50, 290, 280, 290);
  //bottom right
  triangle(width - 50, 320, width - 50, 290, width - 30, 290);
  triangle(width - 50,320,width - 50, 290, width - 280, 290);
  //top left
  triangle(110, 70, 30, 70, 110, 30);
  //top right
  triangle(width - 110, 70, width - 30, 70, width - 110, 30);
}

int pulseAlpha = 0;
int pulseSwitch = 1;
void pulse()
{
  stroke(0,232,255, pulseAlpha);
  strokeWeight(2);
  //Main Hud
  line(285,285, width - 285, 285);
  line(115, 35, width - 115, 35);
  line (960, 280, 960, 80);
  line (width - 960,280, width - 960, 80);
  
  //Status Overlay
  line(650,360, 970, 360);
  line(650,360, 600, 410);
  line(600,410, 600, 685);
  line(600,685, 970, 685);
  line(970,685, 970, 360);
  
  //Radar square
  line(25,380,325,380);
  line(325,380,325,580);
  line(325,580,25,580);
  line(25,580,25,380);
  
  pulseAlpha = pulseAlpha + pulseSwitch;
  if(pulseAlpha <= 0)
  {
    pulseSwitch = 3;
  }
  else if(pulseAlpha >= 255)
  {
    pulseSwitch = -3;
  }
}

float RadarX = 25;
float RadarY = 380;
int RadarAdd = 2;
float RadarAddX = 3;
void radar()
{
  noStroke();
  fill(0,159,0,50);
  rect(25,380,300,200);
  
  //Moving Lines
  stroke(0,253,255);
  strokeWeight(2);
  //Verticle Line
  line(25,RadarY,325, RadarY);
  RadarY = RadarY + RadarAdd;
  if(RadarY >= 580)
  {
    RadarAdd = -2;
  }
  else if(RadarY <= 380)
  {
    RadarAdd = 2;
  }
  //Horizontal
  RadarX = RadarX + RadarAddX;
  line(RadarX, 380, RadarX, 580);
  if(RadarX >= 325)
  {
    RadarAddX = -3;
  }
  else if(RadarX <= 25)
  {
    RadarAddX = 3;
  }
  //Background
  noStroke();
  fill(25,230,6,100);
  rect(25,380,RadarX - 25,RadarY - 380);
  
  RadarHits(RadarX, RadarY);
  
}

void RadarHits(float RadarX, float RadarY)
{
  int hit1X, hit1Y;
  int hit2X, hit2Y;
  
  hit1X = 175;
  hit1Y = 500;
  hit2X = 280;
  hit2Y = 420;
  
  fill(255);
  if(RadarX > hit1X && RadarY > hit1Y)
  {
    rect(hit1X, hit1Y, 5, 5);
  }
  
  if(RadarX > hit2X && RadarY > hit2Y)
  {
    rect(hit2X, hit2Y, 5, 5);
  }
}
void statusBox()
{
  fill(0,159,255,50);
  rect(650,360, 320, 325);
  triangle(650,360, 650, 410, 600,410);
  rect(600,410,50,275);
}

void fuelBar(boolean fueling)
{
  color fuelColor = color(255,0,0);
  stroke(0,150,255);
  fill(0,255,255, 100);
  rect(width/2 + 150, height/2 + 50, 300, 40,15);
  fill(fuelColor);
  noStroke();
  rect(width/2 + 151, height/2 + 51, fuelbar, 39,15);

  textSize(30);
  fill(0);
  text("FUEL:", 745, 390);
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
  if(frameCount % 10 == 0)
  {
    fuelbar -= 1;
  }
  fuel = fuelbar/3;
  if (fuel <= 0)
  {
    fuelbar = 0;
  }
  
//Low Fuel
  if (fuel < 20 && fuel > 0)
  {
    fill(255,0,0);
    textSize(30);
    if((frameCount % 20) > 5)
    {
      text("Warning!",430,70);
      text("Low Fuel",430, 100);
    }
  }
  else if(fuel < 20)
  {
    textSize(40);
    fill(255,0,0);
    if((frameCount % 20) > 3)
    {
      text("FUEL EMPTY",370, 100);
    }
  }
}//END FUELBAR.

void shield()
{
  
}