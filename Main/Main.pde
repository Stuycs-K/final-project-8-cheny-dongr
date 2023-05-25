static ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
static ArrayList<Sun> Suns = new ArrayList<Sun>();
int sunCounter = 0;
ArrayList<Zombie> Zombies = new ArrayList<Zombie>();
ArrayList<Plant> SeedPackets = new ArrayList<Plant>();
ArrayList<Boolean> SeedPacketsSelected = new ArrayList<Boolean>();
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
  SeedPackets.add(new PeaShooter());
  PlantGrid[0][1] = new PeaShooter(245, 150);
  PlantGrid[1][1] = new PeaShooter(245, 230);
  PlantGrid[2][1] = new PeaShooter(245, 310);
  PlantGrid[3][1] = new PeaShooter(245, 390);
  PlantGrid[4][1] = new PeaShooter(245, 470);
  background = loadImage("garden.png");
}

void mouseClicked(){
  Projectiles.add(new Projectile(-1, 10, mouseX, mouseY));
  //sun test
  spawnSun(new Sun(500, 400));
  
  Zombies.add(new Zombie());
}

void draw(){
  background(255);
  image(background, 0, 100,1100,500);
  textSize(80);
  text(sunCounter, 100, 100);
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
  
  private void selectSeedpacket(){
    
  }
