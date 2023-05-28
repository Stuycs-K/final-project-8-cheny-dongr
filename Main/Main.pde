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
  //for testing
  /*Plant grid location to pixel calculation:
    x = (column * 82) + 245
    y = (row * 80) + 160
    */
  PlantGrid[0][5] = new PeaShooter(655,160);
  PlantGrid[1][0] = new PeaShooter(245,240);
}


void mouseClicked(){

  //Projectiles.add(new Projectile(10, 10, mouseX, mouseY));
  //sun test
  spawnSun(new Sun(500, 400));
  
  Zombies.add(new Zombie());
  selectSeedpacket();
  clickOnLawn();
}

void draw(){
  int framer = 5;
  if (Zombies.size() + Projectiles.size() > 0){
    framer = 5;
  }
  if (Zombies.size() + Projectiles.size() > 15){
    framer = 4;
  }
  if (Zombies.size() + Projectiles.size() > 30){
    framer = 3;
  }
  if (Zombies.size() + Projectiles.size() > 45){
    framer = 2;
  }
  if (Zombies.size() + Projectiles.size() > 75){
    framer = 1;
  }

  background(255);
  fill(0);
  image(background, 0, 100,1100,500);

  textSize(80);
  text(sunCounter, 30, 100);
  text("Index: " + SeedPacketSelected, 300, 100);
  drawSeedpacketBar();
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
        int check = 0;
        for (Zombie zomb : Zombies){
          if (zomb.gridrow() == row){
            check++;
          }
        }
        if (check > 0){
        PlantGrid[row][i].attack();
        }
        if (PlantGrid[row][i].getHP() <= 0){
         PlantGrid[row][i] = null;
      }
      }
      
      
    }
  }

  for(int zomb = 0; zomb < Zombies.size(); zomb++){
    Zombies.get(zomb).setFrame(framer);
    Zombies.get(zomb).display();
//testing zombie'sho
   println(Zombies.get(zomb).getHP());    
   println("" + (Zombies.size() + Projectiles.size()));
      //int xplant = 200;
     // int gridcol = (Zombies.get(zomb).getX()-xplant+60)/83;
     // int gridrow = (Zombies.get(zomb).getY()-100)/80;
      //making sure zombie is align with grid value
      println("row: " + Zombies.get(zomb).gridrow() + " col: " +Zombies.get(zomb).gridcol());


      if (Zombies.get(zomb).gridcol() < 9 && Zombies.get(zomb).alive()){
        if (PlantGrid[Zombies.get(zomb).gridrow()][Zombies.get(zomb).gridcol()] != null){
          Plant victim = PlantGrid[Zombies.get(zomb).gridrow()][Zombies.get(zomb).gridcol()];
          if (Zombies.get(zomb).getChange() == 0){
            Zombies.get(zomb).setChange(1);
          }
          
          Zombies.get(zomb).doDamage(victim);
          
          
          
        }
        else if ((Zombies.get(zomb).alive())){
          Zombies.get(zomb).setChange(0);
        } 
      }
      if (Zombies.get(zomb).getX()<100 || !(Zombies.get(zomb).alive())){
      Zombies.remove(zomb);
    }
  }
  //projectiles
     for (int projectile = 0; projectile < Projectiles.size(); projectile++){  
    Projectiles.get(projectile).move();
    Projectiles.get(projectile).display();
    for (Zombie zomb : Zombies){
      if (Projectiles.size() > 0 && ((zomb.getX() - Projectiles.get(projectile).getX()) < -60) && Projectiles.get(projectile).getY()- zomb.getY()-80 == 0){
        Projectiles.get(projectile).doDamage(zomb);
        Projectiles.remove(projectile);       
        if (projectile > 0){
          projectile--;
        }        
      }
      else if (Projectiles.size() >0 && Projectiles.get(projectile).getX() >= width-10){
        Projectiles.remove(projectile);
        if (projectile > 0){
          projectile--;
        }
      }
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
