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
  
  Zombies.add(new Zombie());
}

void draw(){
  background(255);
  image(background, 0, 100,1100,500);
  for(Projectile projectile : Projectiles){
    projectile.move();
    projectile.display();
  }
  
  for(int zomb = 0; zomb < Zombies.size(); zomb++){
    Zombies.get(zomb).zombieMove();
    Zombies.get(zomb).setHP(Zombies.get(zomb).getHP()-10);
    //if (Zombies.get(zomb).getHP() <= 0){
      //testing out zombie dying
      if (Zombies.get(zomb).getX() <= 250){
      
      Zombies.remove(zomb);
    }
  }
  
}
