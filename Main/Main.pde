static ArrayList<Projectile> Projectiles = new ArrayList<Projectile>();
static ArrayList<Sun> Suns = new ArrayList<Sun>();
int sunCounter = 50;
static ArrayList<Zombie> Zombies = new ArrayList<Zombie>();
static ArrayList<String> SeedPackets = new ArrayList<String>();
ArrayList<PImage> SeedPacketsPNGs = new ArrayList<PImage>();
boolean usingShovel = false;
public static int lost = 0;

static Levels LEVELS;
boolean openMenu= true;


//ArrayList<Boolean> SeedPacketsSelected = new ArrayList<Boolean>();
int SeedPacketSelected = -1;
Plant[][] PlantGrid = new Plant[5][9];


public static ArrayList<PImage> wframes = new ArrayList<PImage>();
public static ArrayList<PImage> eframes = new ArrayList<PImage>();
public static ArrayList<PImage> dframes = new ArrayList<PImage>();
public static ArrayList<PImage> explodeframes = new ArrayList<PImage>();

public static ArrayList<PImage> helmetzeat = new ArrayList<PImage>();
public static ArrayList<PImage> nohelmetzeat = new ArrayList<PImage>();
public static ArrayList<PImage> helmetzwalk = new ArrayList<PImage>();
public static ArrayList<PImage> nohelmetzwalk = new ArrayList<PImage>();

public static ArrayList<PImage> dancezdance = new ArrayList<PImage>();
public static ArrayList<PImage> dancezeat = new ArrayList<PImage>();
public static ArrayList<PImage> dancezwalk = new ArrayList<PImage>();

PImage background;
PImage shovel;
PImage menu;
PImage losescreen;
PImage homescreen;
PImage lvl1;
PImage lvl2;
PImage lvl3;
PImage testlvl;
PImage start;

public static ArrayList<PImage> PeashooterFrames = new ArrayList<PImage>();
public static ArrayList<PImage> SunflowerFrames = new ArrayList<PImage>();
public static ArrayList<PImage> PotatomineFrames = new ArrayList<PImage>();
public static ArrayList<PImage> WallnutFrames = new ArrayList<PImage>();
public static ArrayList<PImage> CherrybombFrames = new ArrayList<PImage>();
public static ArrayList<PImage> RepeaterFrames = new ArrayList<PImage>();

void keyPressed(){
  if (key == 's'){
  Zombies.add(new NormZombie(wframes, eframes, dframes, explodeframes));
  Zombies.add(new DanceZombie(dancezwalk, dancezeat, dancezdance, dframes, explodeframes));
  Zombies.add(new FootballZombie(helmetzwalk, nohelmetzwalk,helmetzeat, nohelmetzeat,dframes, explodeframes));
  }
  if (key == 'c'){
    sunCounter = 9000;
  }
  if (key == 'r'){
    lost = -1;
    clearAll();
      background(255);
      image(losescreen, 0, 0);
      fill(255);
    rect(100, 400, 200, 100);
    rect(850, 400, 200, 100);
    
    fill(0);
    textSize(30);
    text("RETRY?",200,500);
    text("HOME",950,500);
  }
}

void setup(){

  LEVELS = new Levels();
 
  
  size(1100,600); 
  setUpFrames();


  

}

public static void addZombie(Zombie zomb){
  Zombies.add(zomb);
}

void mouseClicked(){
  if (lost == -1 || lost == 1){
    losing();
  }
  if (openMenu && lost == 0){
  checkIfStartGame();
  }
  else{
    selectSeedpacket();
    pressShovel();
    pressMenu();
    if(usingShovel){
      useShovel();
    }
    else {
      clickOnLawn();
    }
  }
}

public static void setLost(int a){
  lost = a;
}

public void clearAll(){
  
    for (int x = Zombies.size()-1; x >= 0; x--){
      Zombies.remove(x);
    }
    for (int x = Projectiles.size()-1; x >= 0; x--){
      Projectiles.remove(x);
    }
    for (int x = SeedPackets.size()-1; x >= 0; x--){
      SeedPackets.remove(x);
    }
    for (int x = 0; x < 5; x++){
      for (int y = 0; y < 9; y++){
        PlantGrid[x][y] = null;
      }
    }
    sunCounter = 50;
}

void draw(){
  background(255);
  println("zombie: " + Zombies.size());
  println("menu: " + openMenu);
  println("lost: " + lost);
  if (openMenu){
    image(homescreen,0,0);
    lost = 0;

    image(start,465,200);
    
    image(lvl1,100,400);
    
    image(lvl2,350,400);
    
    image(lvl3,600,400);
    
    image(testlvl,850,400);
  }
  else{
    
    if(LEVELS.playCurrentLevel() == true){
      openMenu = true;
    }
    if (lost == 0){
      gamestatus();
    }
    else if (lost == -1){
      clearAll();
      background(255);
      image(losescreen, 0, 0);

    }
    else if (lost == 1){
      clearAll();
      background(255);
      textSize(30);
      image(losescreen, 0, 0);
    fill(255,0,0);
    textSize(100);
    text("DID NOT",10,200);

    }
  }
}

  public void gamestatus(){
   background(255);
  fill(0);
  image(background, 0, 100);
  textSize(80);
  text(sunCounter, 30, 100);
  textSize(40);
  text("Index: " + SeedPacketSelected, 700, 62);
  text("Level: " + LEVELS.getCurrentLevel(), 700, 100);
  difpacket();
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
      if (Zombies.get(zomb).gridcol() < 9 && Zombies.get(zomb).alive()){
        if (PlantGrid[Zombies.get(zomb).gridrow()][Zombies.get(zomb).gridcol()] != null){
          Plant victim = PlantGrid[Zombies.get(zomb).gridrow()][Zombies.get(zomb).gridcol()];
          if (Zombies.get(zomb).getChange() == 0){
            Zombies.get(zomb).setChange(1);
            Zombies.get(zomb).setCurrent();
          }
          
          Zombies.get(zomb).doDamage(victim);
          
          
          
        }
        else if ((Zombies.get(zomb).alive())){
          Zombies.get(zomb).setChange(0);
          //Zombies.get(zomb).setCurrent();
        } 
      }
      if (Zombies.get(zomb).getX()<100){
      lost = -1;
    }
      if (!(Zombies.get(zomb).alive())){
      Zombies.remove(zomb);
    }
    
      
  }
  //projectiles
     for (int projectile = 0; projectile < Projectiles.size(); projectile++){  
    Projectiles.get(projectile).move();
    Projectiles.get(projectile).display();
    for (Zombie zomb : Zombies){
      if (Projectiles.size() > 0 && ((zomb.getX() - Projectiles.get(projectile).getX()) < -60) && Projectiles.get(projectile).getY()- zomb.getY()-80 == 0 && Projectiles.get(projectile).getX()<width-10){
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
  text(frameRate, 700, 30);
  text(LEVELS.getTimer(), 800, 30);
  }
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
    else if(plant.equals("CHERRYBOMB") && sunCounter >= CherryBomb.COST){
      PlantGrid[row][col] = new CherryBomb((col * 82) + 245, (row * 80) + 160);
      sunCounter -= CherryBomb.COST;
    }
    else if(plant.equals("REPEATER") && sunCounter >= Repeater.COST){
      PlantGrid[row][col] = new Repeater((col * 82) + 245, (row * 80) + 160);
      sunCounter -= Repeater.COST;
    }

  }
  private void drawSeedpacketBar(int x){
    for(int i = 0; i < x; i++){
      //rect((i*100)+150, 0, 100, 100);
      image(SeedPacketsPNGs.get(i),i*75+150, 0);
      //text(SeedPackets.get(i),i*100+150, 100);
    }
    //ALSO DRAWS THE SHOVEL
    image(shovel, 900, 0);
    //DRAWS THE MENU ICON
    image(menu, 1000, 0);
  }
  private void selectSeedpacket(){
    if(mouseX > 150 && mouseY< 100){
      SeedPacketSelected = (mouseX-150) / 75;
      //75 is width of packet
    }
  }
  public void clickOnLawn(){
    if (mouseX > 245 && mouseX < 245 + 82*9 && mouseY > 160 && mouseY < 160 + 80*5 
    && SeedPacketSelected > -1 && SeedPacketSelected < SeedPackets.size()
    && PlantGrid[(mouseY-160) / 80][(mouseX-245) / 82] == null) {
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
  
  public void spawnNorm(int row, int col){
    if (row-1 >= 0 ){
      Zombies.add(new NormZombie(wframes, eframes, dframes, explodeframes,row-1,col));
    }
    if (col-1 >= 0 ){
      Zombies.add(new NormZombie(wframes, eframes, dframes, explodeframes,row,col-1));
    }
    if (row +1 <= 4){
      Zombies.add(new NormZombie(wframes, eframes, dframes, explodeframes,row+1,col));
    }
    if (col+1 <= 9){
      Zombies.add(new NormZombie(wframes, eframes, dframes, explodeframes,row,col+1));
    }
    
  }
  

  
  private void pressShovel(){
    if(mouseX > 900 && mouseX < 1000 && mouseY < 100){
      usingShovel = true;
      SeedPacketSelected = -10;
      //75 is width of packet
    }
  }
  private void useShovel(){
    if (mouseX > 245 && mouseX < 245 + 82*9 && mouseY > 160 && mouseY < 160 + 80*5){
      PlantGrid[(mouseY-160) / 80][(mouseX-245) / 82] = null;
      SeedPacketSelected = -1;
      usingShovel = false;
    }
  }
  private void pressMenu(){
    if(mouseX > 1000 && mouseY < 100){
      openMenu = true;
      clearAll();
    }
  }
  private void pressMenuOnEndScreen(){
    //CHANGE THIS CHECK
    if(mouseX > 1000 && mouseY < 100){
      openMenu = true;
    }
  }


  public void setUpFrames(){
    File dancedanceF = new File(sketchPath("ZombieFrames" + File.separator + "dancezdance"));
    for(int i = 0; i <= 7; i++){
      PImage image = loadImage(dancedanceF.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.08s.png");
      image.resize(100,140);
      dancezdance.add(image);
    }
    File danceeatF = new File(sketchPath("ZombieFrames" + File.separator + "dancezeat"));
    for(int i = 0; i <= 32; i++){
      PImage image = loadImage(danceeatF.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.04s.png");
      image.resize(100,140);
      dancezeat.add(image);
    }
    File dancewalkF = new File(sketchPath("ZombieFrames" + File.separator + "dancezwalk"));
    for(int i = 0; i <= 19; i++){
      PImage image = loadImage(dancewalkF.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.06s.png");
      image.resize(100,140);
      dancezwalk.add(image);
    }
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
   packet = loadImage(framesFolder.getAbsolutePath() + File.separator + "cherrybomb.png");
   packet.resize(75,100);
   SeedPacketsPNGs.add(packet);
   packet = loadImage(framesFolder.getAbsolutePath() + File.separator + "repeater.png");
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
    framesFolder = new File(sketchPath("PlantFrames" + File.separator + "Repeater"));
    for(int i = 2; i <= 50; i++){
      println(framesFolder.getAbsolutePath());
      PImage frame = loadImage(framesFolder.getAbsolutePath() + File.separator + "frame_" + i + ".png");
      frame.resize(80,80);
      RepeaterFrames.add(frame);
    }
    
  framesFolder = new File(sketchPath("PlantFrames" + File.separator + "Cherrybomb"));
  PImage frameCherry = loadImage(framesFolder.getAbsolutePath() + File.separator + "cherrybomb.png");
  //DIFFERENT SIZE CHERRYBOMB
  frameCherry.resize(100,80);
  CherrybombFrames.add(frameCherry);
  PImage frameExplosion = loadImage(framesFolder.getAbsolutePath() + File.separator + "cherryexplosion.png");
  frameExplosion.resize(240,240);
  CherrybombFrames.add(frameExplosion);
  losescreen = loadImage("lose.png");
  background = loadImage("garden.png");
  background.resize(1100, 500);
  shovel = loadImage("PlantFrames" + File.separator + "shovel.png");
  shovel.resize(100, 100);
  menu = loadImage("PlantFrames" + File.separator + "menu.png");
  menu.resize(100, 100);
  losescreen.resize(1100, 600);
  homescreen = loadImage("homescreen.png");
  homescreen.resize(1100,600);
  lvl1 = loadImage("lvl1.png");
  lvl2 = loadImage("lvl2.png");
  lvl3 = loadImage("lvl3.png");
  testlvl = loadImage("testlvl.png");
  start = loadImage("start.png");
  lvl1.resize(150,60);
  lvl2.resize(150,60);
  lvl3.resize(150,60);
  testlvl.resize(150,60);
  start.resize(150,60);
  }
  private void difpacket(){
    if (LEVELS.getCurrentLevel() == 1){
      drawSeedpacketBar(2);
    }
    if (LEVELS.getCurrentLevel() == 2){
      drawSeedpacketBar(4);
    }
    if (LEVELS.getCurrentLevel() == 3){
      drawSeedpacketBar(6);
    }
    if (LEVELS.getCurrentLevel() == 4){
      drawSeedpacketBar(6);
    }
  }

  private void checkIfStartGame(){
    if(mouseX > 465 && mouseX < 615 && mouseY > 200 && mouseY < 260){
      openMenu = false;
    }
    if(mouseX > 100 && mouseX < 250 && mouseY > 400 && mouseY < 460){
      lvl(1);
    }
    if(mouseX > 350 && mouseX < 500 && mouseY > 400 && mouseY < 460){
      lvl(2);
    }
    if(mouseX > 600 && mouseX < 750 && mouseY > 400 && mouseY < 460){
      lvl(3);
    }
    if(mouseX > 850 && mouseX < 100 && mouseY > 400 && mouseY < 460){
      lvl(4);
    }
    
  }
  
  private void lvl(int a){
  if(a == 1){
      openMenu = false;
      SeedPackets.add("SUNFLOWER");
      SeedPackets.add("PEASHOOTER");
      //drawSeedpacketBar(2);
      LEVELS.setCurrentLevel(1);
    }
    if(a == 2){
      openMenu = false;
      SeedPackets.add("SUNFLOWER");
      SeedPackets.add("PEASHOOTER");
      SeedPackets.add("POTATOMINE");
      SeedPackets.add("WALLNUT");
      //drawSeedpacketBar(4);
      LEVELS.setCurrentLevel(2);
    }
    if(a == 3){
      openMenu = false;
      SeedPackets.add("SUNFLOWER");
      SeedPackets.add("PEASHOOTER");
      SeedPackets.add("POTATOMINE");
      SeedPackets.add("WALLNUT");
      SeedPackets.add("CHERRYBOMB");
      SeedPackets.add("REPEATER");
      //drawSeedpacketBar(6);
      LEVELS.setCurrentLevel(3);
    }
    if(a == 4){
      openMenu = false;
      SeedPackets.add("SUNFLOWER");
      SeedPackets.add("PEASHOOTER");
      SeedPackets.add("POTATOMINE");
      SeedPackets.add("WALLNUT");
      SeedPackets.add("CHERRYBOMB");
      SeedPackets.add("REPEATER");
      //drawSeedpacketBar(6);
      LEVELS.setCurrentLevel(4);
    }
  }
  //homepage
  //rect(390, 515, 150, 50);
  //retry
   // rect(580, 515, 130, 50);
  private void losing(){
    if(mouseX > 580 && mouseX < 710 && mouseY > 515 && mouseY < 565){
      background(255);
      if (lost == -1 || lost == 1){
      lost = 0;
      lvl(LEVELS.getCurrentLevel());
      }
    }
    if(mouseX > 390 && mouseX < 540 && mouseY > 515 && mouseY < 565){
      background(255);
      if (lost == -1 || lost == 1){
      openMenu = true;
      }
    }
    
    
  }
  
