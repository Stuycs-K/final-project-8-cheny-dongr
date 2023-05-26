static ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
static ArrayList<Sun> Suns = new ArrayList<Sun>();
ArrayList<Zombie> Zombies = new ArrayList<Zombie>();
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
  PlantGrid[0][1] = new PeaShooter(0, 100);
  PlantGrid[1][1] = new PeaShooter(0, 200);
  PlantGrid[2][1] = new PeaShooter(0, 300);
  PlantGrid[3][1] = new PeaShooter(0, 400);
  PlantGrid[4][1] = new PeaShooter(0, 500);
  background = loadImage("garden.png");
}

void mouseClicked(){
  Projectiles.add(new Projectile(10, 10, mouseX, mouseY));
  //sun test
  spawnSun(new Sun(500, 400));
  
  Zombies.add(new Zombie());
}

void draw(){
  background(255);
  image(background, 0, 100,1100,500);
  //for(Projectile projectile : Projectiles){
   println("proj: " + Projectiles.size());
   for (int projectile = 0; projectile < Projectiles.size(); projectile++){
    Projectiles.get(projectile).move();
    Projectiles.get(projectile).display();
    //boolean remove = false;
    for (Zombie zomb : Zombies){
      //check the y value of the zombie so it doesnt die immediately
      
      //need correct projectile and plant location to sync the damage
      println("proj: " + projectile);
      println("projs: " + Projectiles.size());
      println("zomb: " + Zombies.size());
      if (zomb.getX() - Projectiles.get(projectile).getX() < 10 && abs(zomb.getY() - Projectiles.get(projectile).getY()) < 30){
        Projectiles.get(projectile).doDamage(zomb);
        Projectiles.remove(projectile);
        if (projectile > 0){
          projectile--;
        }
      }
      
    }
    if (Projectiles.get(projectile).getX() >= width-10){
        Projectiles.remove(projectile);
      }
  }
  for(int i = 0; i < Suns.size(); i++){
    Sun sun = Suns.get(i);
    if(sun.isCollected()){
      Suns.remove(i);
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
   println(Zombies.get(zomb).getHP());
    Zombies.get(zomb).setHP(Zombies.get(zomb).getHP());
    //if (Zombies.get(zomb).getHP() <= 0){
      //testing out zombie dying
    //if (Zombies.get(zomb).getX()-)
      //when zombie is close to plant
      
      //using x until getplant location is done
      
      int xplant = 200;
      int gridcol = (Zombies.get(zomb).getX()-xplant+60)/83;
      int gridrow = (Zombies.get(zomb).getY()-100)/80;
      //making sure zombie is align with grid value
      println("row: " + gridrow + " col: " +gridcol);

      if (gridcol < 9 && Zombies.get(zomb).alive()){
        if (PlantGrid[gridrow][gridcol] != null){
          Plant victim = PlantGrid[gridrow][gridcol];
          if (Zombies.get(zomb).getChange() != 1){
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
