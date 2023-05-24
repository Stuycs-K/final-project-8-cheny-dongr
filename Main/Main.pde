static ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
static ArrayList<Sun> Suns = new ArrayList<Sun>();
Plant[][] PlantGrid;

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
}

void mouseClicked(){
  Projectiles.add(new Projectile(-1, 10, mouseX, mouseY));
  spawnSun(new Sun(500, 400));
}

void draw(){
  background(255);
  for(Projectile projectile : Projectiles){
    projectile.move();
    projectile.display();
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
