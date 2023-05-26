static ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
static ArrayList<Sun> Suns = new ArrayList<Sun>();
int sunCounter = 0;
ArrayList<Zombie> Zombies = new ArrayList<Zombie>();
ArrayList<String> SeedPackets = new ArrayList<String>();
//ArrayList<Boolean> SeedPacketsSelected = new ArrayList<Boolean>();
int SeedPacketSelected = -1;
Plant[][] PlantGrid;

PImage background; 
void setup(){
  size(1100,600);
  PlantGrid = new Plant[5][9];
  //PLANT TESTING 
  /*PlantGrid[0][1] = new PeaShooter(100, 0);
  PlantGrid[1][1] = new PeaShooter(100, 100);
  PlantGrid[2][1] = new PeaShooter(100, 200);
  PlantGrid[3][1] = new PeaShooter(100, 300);
  PlantGrid[4][1] = new PeaShooter(100, 400);
  */
  SeedPackets.add("PEASHOOTER");
  SeedPackets.add("SUNFLOWER");
  plant("PEASHOOTER", 0, 0);
  plant("PEASHOOTER", 1, 0);
  plant("PEASHOOTER", 2, 0);
  plant("PEASHOOTER", 3, 0);
  plant("PEASHOOTER", 4, 0);
  background = loadImage("garden.png");
}

void mouseClicked(){
  Projectiles.add(new Projectile(-1, 10, mouseX, mouseY));
  //sun test
  spawnSun(new Sun(500, 400));
  
  Zombies.add(new Zombie());
  selectSeedpacket();
  clickOnLawn();
}

void draw(){
  background(255);
  fill(0);
  image(background, 0, 100,1100,500);
  textSize(80);
  text(sunCounter, 30, 100);
  text("Index: " + SeedPacketSelected, 300, 100);
  drawSeedpacketBar();
  for(Projectile projectile : Projectiles){
    projectile.move();
    projectile.display();
  }
  for(int i = 0; i < Suns.size(); i++){
    Sun sun = Suns.get(i);
    if(sun.isCollected()){
      Suns.remove(i);
      sunCounter += 25;
      i--;
    } else {
      sun.display();
    }
  }
  
  for(int row = 0; row < PlantGrid.length; row++){
    for(int i = 0; i < PlantGrid[row].length; i++){
      if(PlantGrid[row][i] != null){
      //Plant plant = PlantGrid[row][i];
        PlantGrid[row][i].display();
        PlantGrid[row][i].attack();
      }
    }
  }
  
  for(int zomb = 0; zomb < Zombies.size(); zomb++){
    Zombies.get(zomb).display();
    //testing out zombie dying
   
    Zombies.get(zomb).setHP(Zombies.get(zomb).getHP());
    //if (Zombies.get(zomb).getHP() <= 0){
      //testing out zombie dying
    //if (Zombies.get(zomb).getX()-)
      
      if (!(Zombies.get(zomb).alive())){
      
      Zombies.remove(zomb);
    }
  }
}
  /*
  PlantGrid[2][2].display();
  Projectiles.add(PlantGrid[2][2].attack());*/
  
  public static void addProjectile(Projectile projectile){
    Projectiles.add(projectile);
  }
  public static void spawnSun(Sun sun){
    Suns.add(sun);
  }
  private void plant(String plant, int row, int col){
    //PlantGrid[0][1] = new PeaShooter(245, 150);
    if(plant.equals("PEASHOOTER") && sunCounter >= PeaShooter.COST)
    {
      PlantGrid[row][col] = new PeaShooter((col * 82) + 245, (row * 80) + 160);
      sunCounter -= PeaShooter.COST;
    }
    else if(plant.equals("SUNFLOWER") && sunCounter >= SunFlower.COST){
      PlantGrid[row][col] = new SunFlower((col * 82) + 245, (row * 80) + 160);
      sunCounter -= SunFlower.COST;
    }

  }
  private void drawSeedpacketBar(){
    for(int i = 0; i < SeedPackets.size(); i++){
      fill(0);
      rect((i*100)+150, 0, 100, 100);
      textSize(15);
      fill(255);
      text(SeedPackets.get(i),i*100+150, 100);
    }
  }
  private void selectSeedpacket(){
    if(mouseX > 150 && mouseY< 100){
      SeedPacketSelected = (mouseX-150) / 100;
    }
  }
  public void clickOnLawn(){
    if (mouseX > 245 && mouseY > 160 && SeedPacketSelected > -1 && SeedPacketSelected < SeedPackets.size()) {
      //plant the selected
      plant(SeedPackets.get(SeedPacketSelected), (mouseY-160) / 80,(mouseX-245) / 82);
      SeedPacketSelected = -1;
    }
  }
