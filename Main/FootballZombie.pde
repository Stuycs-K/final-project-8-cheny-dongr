import java.nio.file.Path;
import java.nio.file.Paths;
public class FootballZombie extends Zombie{

  private int hp;
  private int x, y;
  private int speed;
  private int damage;
  private ArrayList<PImage> wframes = new ArrayList<PImage>();
  private ArrayList<PImage> eframes = new ArrayList<PImage>();
  private ArrayList<PImage> dframes = new ArrayList<PImage>();
  private ArrayList<PImage> explodeframes = new ArrayList<PImage>();
  private int currentFrame = 0;
  private int FRAMERATE = 3;
  private int change;
  boolean alive = true;
  boolean dying = false;
  boolean explode = false;
  boolean helmet = true;
  
  public void doDamage(Plant a) {
    if (frameCount % 5 == 0) {
      a.takeDamage(damage);
    }
  }
  
  public boolean getExplode() {
    return explode;
  }
  public void setExplode() {
    explode = true;
    currentFrame = 0;
    x += 30;
    hp = 1;
  }
  
  public int gridcol() {
    return (this.getX()-140)/83;
  }
  public int gridrow() {
    return (this.getY()-100)/80;
  }
  
  public boolean alive() {
    return alive;
  }
  
  public int getX(){
    return x;
  }
  
  public void setX(int newposition) {
    x = newposition;
  }
  
  public int getY(){
    return y;
  }
  
  public int getChange(){
    return change;
  }
  
  public void setChange(int newchange){
    change = newchange;
  }
  
  public int getHP(){
    return hp;
  }
  
  public void setHP(int newhp){
    hp = newhp;
  }


  public FootballZombie(ArrayList<PImage> wframes, ArrayList<PImage> eframes, ArrayList<PImage> dframes, ArrayList<PImage> explodeframes) {
    this.x = width-100;
    this.y = (int)(random(5))*80 + 100; //add constant once figured out positions
    this.speed = 1;
    this.hp = 100;
    this.damage = 5;
    this.change = 0;
    this.wframes = wframes;
    this.eframes = eframes;
    this.dframes = dframes;
    this.explodeframes = explodeframes;
  }


  public void display() {

  }
}
