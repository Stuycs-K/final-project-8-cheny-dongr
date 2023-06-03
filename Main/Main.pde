static ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
static ArrayList<Sun> Suns = new ArrayList<Sun>();
int sunCounter = 50;
static ArrayList<Zombie> Zombies = new ArrayList<Zombie>();
static ArrayList<String> SeedPackets = new ArrayList<String>();
ArrayList<PImage> SeedPacketsPNGs = new ArrayList<PImage>();


//ArrayList<Boolean> SeedPacketsSelected = new ArrayList<Boolean>();
int SeedPacketSelected = -1;
Plant[][] PlantGrid;

public static ArrayList<PImage> wframes = new ArrayList<PImage>();
public static ArrayList<PImage> eframes = new ArrayList<PImage>();
public static ArrayList<PImage> dframes = new ArrayList<PImage>();
public static ArrayList<PImage> explodeframes = new ArrayList<PImage>();

public static ArrayList<PImage> helmetzeat = new ArrayList<PImage>();
public static ArrayList<PImage> nohelmetzeat = new ArrayList<PImage>();
public static ArrayList<PImage> helmetzwalk = new ArrayList<PImage>();
public static ArrayList<PImage> nohelmetzwalk = new ArrayList<PImage>();

PImage background; 
public static ArrayList<PImage> PeashooterFrames = new ArrayList<PImage>();
public static ArrayList<PImage> SunflowerFrames = new ArrayList<PImage>();
public static ArrayList<PImage> PotatomineFrames = new ArrayList<PImage>();
public static ArrayList<PImage> WallnutFrames = new ArrayList<PImage>();

void setup(){
  File helmetwalkF = new File(sketchPath("ZombieFrames" + File.separator + "heltmetzwalk"));
    for(int i = 0; i <= 10; i++){
      PImage image = loadImage(helmetwalkF.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.09s.png");
      image.resize(160,140);
      helmetzwalk.add(image);
    }
    File nohelmetwalkF = new File(sketchPath("ZombieFrames" + File.separator + "nohelmetzwalk"));
    for(int i = 0; i <= 10; i++){
      PImage image = loadImage(nohelmetwalkF.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.09s.png");
      image.resize(160,140);
      nohelmetzwalk.add(image);
    }
    File helmeteatF = new File(sketchPath("ZombieFrames" + File.separator + "helmetzeat"));
    for(int i = 0; i <= 9; i++){
      PImage image = loadImage(helmeteatF.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.09s.png");
      image.resize(160,140);
      helmetzeat.add(image);
    }
    File nohelmeteatF = new File(sketchPath("ZombieFrames" + File.separator + "nohelmetzeat"));
    for(int i = 0; i <= 10; i++){
      PImage image = loadImage(nohelmeteatF.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.09s.png");
      image.resize(160,140);
      nohelmetzeat.add(image);
    }
  
  
  
  File explodeframesFolder = new File(sketchPath("ZombieFrames" + File.separator + "zexplode"));
    for(int i = 0; i <= 29; i++){
      PImage image = loadImage(explodeframesFolder.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.06s.png");
      image.resize(80,120);
      explodeframes.add(image);
    }
  File wframesFolder = new File(sketchPath("ZombieFrames" + File.separator + "zwalk"));
    for(int i = 0; i <= 45; i++){
      PImage image = loadImage(wframesFolder.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.07s.png");
      image.resize(200,150);
      wframes.add(image);
    }
    
    File eframesFolder = new File(sketchPath("ZombieFrames" + File.separator + "zeat"));
    for(int i = 0; i <= 37; i++){
      PImage image = loadImage(eframesFolder.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.07s.png");
      image.resize(200,150);
      eframes.add(image);
    }
    
    File dframesFolder = new File(sketchPath("ZombieFrames" + File.separator + "zdie"));
    for(int i = 0; i <= 38; i++){
      PImage image = loadImage(dframesFolder.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.07s.png");
      image.resize(200,150);
      dframes.add(image);     
    }
  size(1100,600);
  PlantGrid = new Plant[5][9];
  //PLANT TESTING 
  /*PlantGrid[0][1] = new PeaShooter(100, 0);
  PlantGrid[1][1] = new PeaShooter(100, 100);
  PlantGrid[2][1] = new PeaShooter(100, 200);
  PlantGrid[3][1] = new PeaShooter(100, 300);
  PlantGrid[4][1] = new PeaShooter(100, 400);
  */
  SeedPackets.add("SUNFLOWER");
  SeedPackets.add("PEASHOOTER");
  SeedPackets.add("POTATOMINE");
  SeedPackets.add("WALLNUT");
  plant("PEASHOOTER", 0, 0);
  plant("PEASHOOTER", 1, 0);
  plant("PEASHOOTER", 2, 0);
  plant("PEASHOOTER", 3, 0);
  plant("PEASHOOTER", 4, 0);
  background = loadImage("garden.png");
  background.resize(1100, 500);
  
  File framesFolder = new File(sketchPath("PlantFrames" + File.separator + "SeedPackets"));
  /*File[] packets = framesFolder.listFiles();
    for(File packet : packets){
      if(packet.getAbsolutePath().contains(".DS_Store")){
        continue;
      }
      PImage frame = loadImage(packet.getAbsolutePath());
      frame.resize(75,100);
      SeedPacketsPNGs.add(frame);
    }*/
   PImage packet = loadImage(framesFolder.getAbsolutePath() + File.separator + "sunflower.png");
   packet.resize(75,100);
   SeedPacketsPNGs.add(packet);
   packet = loadImage(framesFolder.getAbsolutePath() + File.separator + "peashooter.png");
   packet.resize(75,100);
   SeedPacketsPNGs.add(packet);
   packet = loadImage(framesFolder.getAbsolutePath() + File.separator + "potatoemine.png");
   packet.resize(75,100);
   SeedPacketsPNGs.add(packet);
   packet = loadImage(framesFolder.getAbsolutePath() + File.separator + "wallnut.png");
   packet.resize(75,100);
   SeedPacketsPNGs.add(packet);
   
  
  framesFolder = new File(sketchPath("PlantFrames" + File.separator + "PeaShooter"));
    for(int i = 1; i <= 24; i++){
      PImage frame = loadImage(framesFolder.getAbsolutePath() + File.separator + "peashooter" + i + ".png");
      frame.resize(80,80);
      PeashooterFrames.add(frame);
    }
  framesFolder = new File(sketchPath("PlantFrames" + File.separator + "Sunflower"));
    //CURRENTLY SKIPS EVERY OTHER FRAME
    for(int i = 1; i <= 24; i+=2){
      PImage frame = loadImage(framesFolder.getAbsolutePath() + File.separator + "sunflower" + i + ".png");
      frame.resize(80,80);
      SunflowerFrames.add(frame);
    }
    
    framesFolder = new File(sketchPath("PlantFrames" + File.separator + "Potatomine"));
    PImage unarmedFrame = loadImage(framesFolder.getAbsolutePath() + File.separator + "unarmedPotato" + ".png");
    unarmedFrame.resize(80,80);
    PotatomineFrames.add(unarmedFrame);
    for(int i = 1; i <= 1; i++){
      PImage frame = loadImage(framesFolder.getAbsolutePath() + File.separator + "potatomine" + i + ".png");
      frame.resize(80,80);
      PotatomineFrames.add(frame);
    }
  framesFolder = new File(sketchPath("PlantFrames" + File.separator + "Wallnut"));
    for(int i = 0; i <= 2; i++){
      println(framesFolder.getAbsolutePath());
      PImage frame = loadImage(framesFolder.getAbsolutePath() + File.separator + "wallnutdamaged" + i + ".png");
      frame.resize(80,80);
      WallnutFrames.add(frame);
    }
}


void mouseClicked(){

  //Projectiles.add(new Projectile(10, 10, mouseX, mouseY));
  //sun test
  spawnSun(new Sun(500, 400));
  if (mouseX > 1000){
  Zombies.add(new NormZombie(wframes, eframes, dframes, explodeframes));
  
  Zombies.add(new FootballZombie(helmetzeat, nohelmetzeat,helmetzwalk, nohelmetzwalk,dframes, explodeframes));
  }
  selectSeedpacket();
  clickOnLawn();
}

void draw(){

  background(255);
  fill(0);
  image(background, 0, 100);

  textSize(80);
  text(sunCounter, 30, 100);
  text("Index: " + SeedPacketSelected, 500, 100);
  drawSeedpacketBar();
  naturallySpawnSun();
  for(int i = 0; i < Suns.size(); i++){
    Sun sun = Suns.get(i);
    if (sun.life() > 300){
      Suns.remove(sun);
    }
    else{
    if(sun.isCollected()){
      Suns.remove(i);
      sunCounter += 25;
      i--;
    } else {
      sun.display();
    }
  }
  }
  //change to accomadate sunflower's attack, sunflower would never produce if there is no zombie, i need to fix
  for(int row = 0; row < PlantGrid.length; row++){
    for(int i = 0; i < PlantGrid[row].length; i++){
      if(PlantGrid[row][i] != null){
      //Plant plant = PlantGrid[row][i];
        PlantGrid[row][i].display();
        PlantGrid[row][i].attack();
        
        if (PlantGrid[row][i].getHP() <= 0){
         PlantGrid[row][i] = null;
      }
      }
      
      
    }
  }

  for(int zomb = 0; zomb < Zombies.size(); zomb++){

    Zombies.get(zomb).display();
//testing zombie'sho

   println("" + (Zombies.size() + Projectiles.size()));
      //int xplant = 200;
     // int gridcol = (Zombies.get(zomb).getX()-xplant+60)/83;
     // int gridrow = (Zombies.get(zomb).getY()-100)/80;
      //making sure zombie is align with grid value


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
  fill(0);
   textSize(30);
  text(frameRate, 30, 30);
  text(frameCount, 1000, 30); 

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
    if(plant.equals("PEASHOOTER") && sunCounter >= PeaShooter.COST)
    {
      PlantGrid[row][col] = new PeaShooter((col * 82) + 245, (row * 80) + 160);
      sunCounter -= PeaShooter.COST;
    }
    else if(plant.equals("SUNFLOWER") && sunCounter >= SunFlower.COST){
      PlantGrid[row][col] = new SunFlower((col * 82) + 245, (row * 80) + 160);
      sunCounter -= SunFlower.COST;
    }
    else if(plant.equals("POTATOMINE") && sunCounter >= PotatoMine.COST){
      PlantGrid[row][col] = new PotatoMine((col * 82) + 245, (row * 80) + 160);
      sunCounter -= PotatoMine.COST;
    }
    else if(plant.equals("WALLNUT") && sunCounter >= WallNut.COST){
      PlantGrid[row][col] = new WallNut((col * 82) + 245, (row * 80) + 160);
      sunCounter -= WallNut.COST;
    }

  }
  private void drawSeedpacketBar(){
    for(int i = 0; i < SeedPacketsPNGs.size(); i++){
      //rect((i*100)+150, 0, 100, 100);
      image(SeedPacketsPNGs.get(i),i*75+150, 0);
      //text(SeedPackets.get(i),i*100+150, 100);
    }
  }
  private void selectSeedpacket(){
    if(mouseX > 150 && mouseY< 100){
      SeedPacketSelected = (mouseX-150) / 75;
      //75 is width of packet
    }
  }
  public void clickOnLawn(){
    if (mouseX > 245 && mouseY > 160 && SeedPacketSelected > -1 && SeedPacketSelected < SeedPackets.size()) {
      //plant the selected
      plant(SeedPackets.get(SeedPacketSelected), (mouseY-160) / 80,(mouseX-245) / 82);
      SeedPacketSelected = -1;
    }
  }
  
  public void naturallySpawnSun(){
    if(frameCount % 600 == 0){
      spawnSun(new Sun(245+ (int)(Math.random()*600),160 + (int)(Math.random()*400)) );
    }

}

  public static boolean explodeZombieOnTile(int row, int col){
    boolean exploded = false;
      for (Zombie zomb : Zombies){
        if (zomb.gridrow() == row && zomb.gridcol() == col){
          zomb.setExplode();
          exploded = true;
        }
      }
    return exploded;
  }
