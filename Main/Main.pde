static ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
Plant[][] PlantGrid;

void setup(){
  size(1100,600);
  PlantGrid = new Plant[5][9];
  //PLANT TESTING
  PlantGrid[2][2] = new PeaShooter(300, 300);
}

void mouseClicked(){
  Projectiles.add(new Projectile(-1, 10, mouseX, mouseY));
}

void draw(){
  background(255);
  for(Projectile projectile : Projectiles){
    projectile.move();
    projectile.display();
  }
  
  for(int row = 0; row < PlantGrid.length; row++){
    for(int i = 0; i < PlantGrid[row].length; i++){
      if(PlantGrid[row][i] != null){
      //Plant plant = PlantGrid[row][i];
      //Make this only happen once
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
