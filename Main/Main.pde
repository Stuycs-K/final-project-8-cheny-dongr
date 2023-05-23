ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
Plant[][] PlantGrid;

void setup(){
  size(1100,600);
  Plant[][] PlantGrid = new Plant[5][9];
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
  /*
  for(Plant[] row : PlantGrid){
    for(Plant plant : row){
      //Make this only happen once
      plant.display();
    }
  }*/
  PlantGrid[2][2].display();
}
