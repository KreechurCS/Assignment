class planet
{
  float xCord;
  float yCord;
  String PlanetName;
  float DistanceToSun;
  Boolean Habitability;
  float theta = 0.0002;
  planet(float xCord, float yCord, String PlanetName, float DistanceToSun, Boolean Habitability)
  {
    this.xCord = xCord;
    this.yCord = yCord;
    this.PlanetName = PlanetName;
    this.DistanceToSun = DistanceToSun;
    this.Habitability = Habitability;
  }
  
  void Render()
  {
    noStroke();
    fill(237,224,101,70);
    ellipse(xCord,yCord, 10,10);
    stroke(255,255,0, 150);
    strokeWeight(1);
    line(xCord, yCord, xCord,yCord + 10);
    ifClick();
    
    
  }
  
  void ifClick()
  {
    if(mouseX >= xCord - 10 && mouseX <= xCord + 10 &&
       mouseY >= yCord - 10 && mouseY <= yCord + 10 &&
       mousePressed)
       {
         displayInfo();
       }
  }
  
  void displayInfo()
  {
    fill(0,255,0,150);
    textSize(18);
    text("Planet: " + PlanetName,65,100);
    text(DistanceToSun + "m KM to Sun",65, 125);
    if(Habitability == true)
    {
      text("Supports Life", 65, 150);
    }
    else
    {
      fill(255,0,0);
      text("Warning: Uninhabitable", 65, 155);
    }
  }
}