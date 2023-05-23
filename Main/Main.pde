ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();

void setup(){
  size(1100,600);
  Plant[][] PlantGrid = new  Plant[5][9];
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
