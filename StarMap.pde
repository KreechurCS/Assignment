class starmap
{
  starmap()
  {
    
  }
  
  void render()
  {
    starmap_bg();
    GalaxyRadar();
    stroke(0,255,255);
    strokeWeight(1);
  }
  
  void starmap_bg()
  {
    fill(0,255,0,20);
    rect(25,380,300, 200);
  }
  
  void GalaxyRadar()
  {
    fill(255, 255, 100);
    noStroke();
    ellipse(175, 480, 15, 15);
    noFill();
    strokeWeight(3);
    stroke(255,0,0);
    ellipse(175,480, 150, 150);
    strokeWeight(1);
    stroke(255);
    ellipse(175, 480, 150, 40);
    //From sun to shallow rim
    strokeWeight(1.4);
    line(168, 475, 160, 461);
    line(181, 475, 190, 461);
    if(mouseX >= 175 - 10 && mouseX <= 175 + 10 &&
       mouseY >= 480 - 10 && mouseY <= 480 + 10 &&
       mousePressed)
      {
        fill(0,255,0);
        textSize(18);
        text("Star: Gamma Omega 26172",65,100);
        text("Diameter: 1.3914m KM",65, 125);
        text("Mass: 1.989 × 10^30 kg", 65, 150);
       }
  }
}