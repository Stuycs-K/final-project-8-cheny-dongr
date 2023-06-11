import java.nio.file.Path;
import java.nio.file.Paths;

public class Repeater extends Plant{
  public final static int COST = 200;
  private int Health = 300;
  private int x,y;
  private int attackSpeed = 90;
  private int attackCounter = 0;
  private int attackSpeedConsecutive = 5;
  private int attackCounterConsecutive = 5;
  private boolean firstAttack = false;
  //private ArrayList<PImage> frames = new ArrayList<PImage>();
  private int currentFrame = 0;
  //private final int FRAMERATE = 3;
  
  //for seedpacket use
  public Repeater(){
  }
  
  public Repeater(int x, int y){
    this.x = x;
    this.y = y;
  }
  public int getHP(){
    return Health;
  }
  
  public void takeDamage(int damage){
    Health -= damage;
  }
  
  public void attack(){
    if(attackCounter <= 0){
      if(!firstAttack){
        Main.addProjectile(new Projectile(20, 8, x+20,y+20));
        firstAttack = true;
      }
      if(attackCounterConsecutive <= 0){
        Main.addProjectile(new Projectile(20, 8, x+20,y+20));
        attackCounter = attackSpeed;
        attackCounterConsecutive = attackSpeedConsecutive;
        firstAttack= false;
      }
      else{
        attackCounterConsecutive--;
      }
    } else {
      attackCounter--;
    }
  }
  
  public void display(){
    if(frameCount % 6 == 0){
      currentFrame+=3;
      if(currentFrame >= Main.RepeaterFrames.size()){
        currentFrame = 0;
      }
    }
    image(Main.RepeaterFrames.get(currentFrame), x, y);
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
}
