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
  private int FRAMERATE = 1;
  private int change;
  boolean alive = true;
  
  
  public void setFrame(int a){
    FRAMERATE = a;
  }
  public Zombie(){
    this.x = width-100;
    this.y = (int)(random(5))*80 + 100; //add constant once figured out positions
    this.speed = 1;
    this.hp = 100;
    this.damage = 10; 
    this.change = 0;

    //will change to zombie image when found
    
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
    if (hp <= 0){
      setChange(2);
    }
  }
  
  
  public void display(){
    if (change != 2){
    
    if (change == 0){
      if(frameCount % FRAMERATE == 0){
      currentFrame++;
      this.setX(this.x-speed);
      if(currentFrame >= wframes.size()){
        currentFrame = 0;
      }
    }
    image(wframes.get(currentFrame), x, y, 200, 150);
    }
    
    else if (change == 1){
      if(frameCount % FRAMERATE == 0){
      currentFrame++;
      if(currentFrame >= eframes.size()){
        currentFrame = 0;
      }
    }
    image(eframes.get(currentFrame), x, y, 200, 150);
    }
  }
    else{
      if(frameCount % FRAMERATE == 0){
      currentFrame++;
      if(currentFrame >= dframes.size()-1){
        alive = false;
        //currentFrame = 0;
        
      }
      else{
      image(dframes.get(currentFrame), x, y, 200, 150);
      }
    }
    
    }
  }
  
  public void doDamage(Plant a){
    a.takeDamage(damage);
    //need same method for plants
    //change image to show zombie eating
  }
  
  
    
}
