/*
Author: Steve Martin
Last Update: 02/11/2016
Description: A Sci-Fi themed HUD for a spaceship
*/
Radar radar = new Radar();
starmap starMap = new starmap();
panning ShipPan = new panning();
planet planet1 = new planet(215,450,"zianthantum", 149.6, true);
planet planet2 = new planet(205,475,"Magmantar", 108.2, false);
planet planet3 = new planet(140,520,"Gawreh", 227.9, true);
planet planet4 = new planet(245,540,"Dylanicax IV", 778.5, false);

void setup()
{
  size(1000,700);
  background(0);
  noCursor();

}
//test test1 = new test(500, 500);
//test test2 = new test(200,200);

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
   planet1.Render();
   planet2.Render();
   planet3.Render();
   planet4.Render();
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

int fuelCon = 0;
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
  fuelBar(fuelCon);
  fuelCon = speed();
  shield();
  shipHealth();
  radar.render();
  starMap.render();
  
  ShipPan.render();
  
}//END mainMenus

  int fuel = 100;
  int buttonDistX;
  int buttonDistY;

void overlay()
{
  stroke(0,255,255);
  strokeWeight(0.5);
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

void radar()
{
  noStroke();
  fill(0,159,0,50);
  rect(25,380,300,200);
 
}



void statusBox()
{
  fill(0,159,255,50);
  rect(650,360, 320, 325);
  triangle(650,360, 650, 410, 600,410);
  rect(600,410,50,275);
}

void fuelBar(int fuelCon)
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
  text("FUEL:", 660, 390);
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
  text(fuel + "%", 770, 390);
  
  //Refuel Button
  
  
  // Fuel Losing
  if(frameCount % 10 == 0)
  {
    fuelbar = fuelbar - fuelCon;
  }
  fuel = fuelbar/3;
  if (fuel <= 0)
  {
    fuelbar = 0;
    speed = 0;
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

int shield = 300;
int damage = 0;
void shield()
{
  textSize(30);
  stroke(0,150,255);
  fill(0,255,255, 100);
  rect(width/2 + 150, height/2 + 125, 300, 40,15);
  noStroke();
  fill(0,255,0,75);
  rect(width/2 + 151, height/2 + 126, shield, 39,15);
  
  //Status of Shield
  if(fuel == 0)
  {
    shield -= 5;
    if (shield <= 0)
    {
      shield = 0;
      fill(255,0,0);
      text("SHIELD:OFFLINE", 660,465);
      //Shield Warning
      textSize(34);
      fill(255,0,0);
      if((frameCount % 20) > 4)
      {
        text("SHIELD OFFLINE",365, 125);
      }
      shipDamage();
      if (damage == 1)
      {
        textSize(18);
        text("Damage Taken",770,100);
      }
    }
  }
  else if(fuel > 0 && shield <= 300)
  {
    shield += 5;
    fill(0,255,0);
    text("SHIELD:ONLINE", 660,465);
    if (shield > 300)
    {
      shield = 300;
    }
  }
}

int speed = 0;
int speedbar;
int speed()
{
  int maxSpeed = 600;
  speedbar = speed/2;
  if (speed >= maxSpeed)
  {
    speed = maxSpeed;
  }
  if (speed <= 0)
  {
    speed = 0;
  }
  //to check if accelerating
  if (keyPressed)
  {
    if(keyCode == UP)
    {
      speed++;
    }
    else if(keyCode == DOWN)
    {
      speed--;
    }
    else if (keyCode == SHIFT)
    {
      speed = 0;
    }
  }
 
  //to Draw the box
  textSize(30);
  stroke(0,150,255);
  fill(0,255,255, 100);
  rect(width/2 + 150, height/2 + 200, 300, 40,15);
  noStroke();
  fill(0,255,0,125);
  rect(width/2 + 151, height/2 + 201,speedbar, 39,15);
  fill(0,255,0);
  text("Speed:" + speed,660, height/2 + 195);
  
   //For Fuel Consumption
  if(speed <= 0)
  {
    return(0);
  }
  else if(speed < 200 && speed > 0)
  {
    return(1);
  }
  else if(speed >=200 && speed < 400)
  {
    return(2);
  }
  else if(speed >= 400 && speed < 600);
  {
    return(3);
  }
}//End Speed

void shipHealth()
{
  fill(0,255,255,75);
  triangle(660,660,710,660,685,610);//UP
  triangle(695,610,745,610,720,660);//Down
  triangle(730,660,780,660,755,610);//Up
  triangle(765,610,815,610,790,660);//Down
  triangle(800,660,850,660,825,610);//Up
  triangle(835,610,885,610,860,660);//Down
  triangle(870,660,920,660,895,610);//Up
  triangle(905,610,955,610,930,660);//Down
  shipHealthFrame();
}//End shipHealth

int shipHealth = 100;
void shipHealthFrame()
{
  noStroke();
  fill(0,255,0,100);
  if(shipHealth > 0)
    triangle(663,663,713,663,688,613);//UP
  if(shipHealth > 12)
    triangle(698,613,748,613,723,663);//Down
  if(shipHealth > 25)
  triangle(733,663,783,663,758,613);//Up
  if(shipHealth > 37)
  triangle(768,613,818,613,793,663);//Down
  if(shipHealth > 50)
  triangle(803,663,853,663,828,613);//Up
  if(shipHealth > 62)
  triangle(838,613,888,613,863,663);//Down
  if(shipHealth > 75)
  triangle(873,663,923,663,898,613);//Up
  if(shipHealth > 87)
  triangle(908,613,958,613,933,663);//Down
  if(shipHealth <= 0)
  {
    exit();
  }
}//END ShipHealth

void shipDamage()
{
  int check = (int)random(1, 120);
  if(check == 7)
  {
    shipHealth = shipHealth - (int)random(10, 20);
    damage = 1;
  }
}