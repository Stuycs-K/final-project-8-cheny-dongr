ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
ArrayList<Zombie> Zombies = new ArrayList<Zombie>();

PImage background; 
void setup(){
  size(1100,600);
  background = loadImage("garden.png");
  Plant[][] PlantGrid = new  Plant[5][9];
}

void mouseClicked(){
  Projectiles.add(new Projectile(-1, 10, mouseX, mouseY));
}

void draw(){
  background(255);
  image(background, 0, 100,1100,500);
  for(Projectile projectile : Projectiles){
    projectile.move();
    projectile.display();
  }
}
