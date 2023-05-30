import java.nio.file.Path;
import java.nio.file.Paths;
public class Zombie{

  private int hp;
  private int x,y;
  private int speed;
  private int damage;
  private ArrayList<PImage> wframes = new ArrayList<PImage>();
  private ArrayList<PImage> eframes = new ArrayList<PImage>();
  private ArrayList<PImage> dframes = new ArrayList<PImage>();
  private int currentFrame = 0;
  private int FRAMERATE = 2;
  private int change;
  boolean alive = true;
  boolean dying = false;
        //int xplant = 200;
     // int gridcol = (Zombies.get(zomb).getX()-xplant+60)/83;
     // int gridrow = (Zombies.get(zomb).getY()-100)/80;
  public int gridcol(){
    return (this.getX()-140)/83;
  }
  public int gridrow(){
    return (this.getY()-100)/80;
  }
  
  public void setFrame(int a){
    FRAMERATE = a;
  }
  public Zombie(ArrayList<PImage> wframes, ArrayList<PImage> eframes, ArrayList<PImage> dframes){
    this.x = width-100;
    this.y = (int)(random(2))*80 + 100; //add constant once figured out positions
    this.speed = 1;
    this.hp = 100;
    this.damage = 1; 
    this.change = 0;
    this.wframes = wframes;
    this.eframes = eframes;
    this.dframes = dframes;
    //will change to zombie image when found
    /*
    File wframesFolder = new File(sketchPath("ZombieFrames" + File.separator + "zwalk"));
    for(int i = 0; i <= 45; i++){
      wframes.add(loadImage(wframesFolder.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.07s.png"));
    }
    
    File eframesFolder = new File(sketchPath("ZombieFrames" + File.separator + "zeat"));
    for(int i = 0; i <= 37; i++){
      eframes.add(loadImage(eframesFolder.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.07s.png"));
    }
    
    File dframesFolder = new File(sketchPath("ZombieFrames" + File.separator + "zdie"));
    for(int i = 0; i <= 38; i++){
      dframes.add(loadImage(dframesFolder.getAbsolutePath() + File.separator + "frame_" + i + "_delay-0.07s.png"));
    }
    */
  }
  public boolean alive(){
    return alive;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public void setX(int newposition){
    x = newposition;
  }
  //when eating plant, change = 1
  //when walking, change = 0
  public void setChange(int newchange){
    change = newchange;
  }
   public int getChange(){
     return change;
   }
  
  public int getHP(){
    return hp;
  }
  public void setHP(int newhp){
    hp = newhp;

  }
  
  
  public void display(){
        if (hp <= 0){
          if (!(dying)){
          currentFrame = 0;
          dying = true;
          }
      setChange(2);
    }
    if (change != 2){
    
    if (change == 0){
      if((frameCount*FRAMERATE) % (FRAMERATE*10) == 0){
      currentFrame++;
      this.setX(this.x-speed);
      if(currentFrame >= wframes.size()){
        currentFrame = 0;
      }
    }
    image(wframes.get(currentFrame), x, y);
    }
    
    else if (change == 1){
      if((frameCount*FRAMERATE) % (FRAMERATE*10) == 0){
      currentFrame++;
      }
      if(currentFrame >= eframes.size()){
        currentFrame = 0;
      }
    
    image(eframes.get(currentFrame), x, y);
    }
  }
    else{
      currentFrame++;
      if(currentFrame >= dframes.size()-1){
        alive = false;
        //currentFrame = 0;
        
      }

      image(dframes.get(currentFrame), x, y);
    
    
    }
  }
  
  public void doDamage(Plant a){
    if (frameCount % 5 == 0){
    a.takeDamage(damage);
    }
    //need same method for plants
    //change image to show zombie eating
  }
  
  
    
}
