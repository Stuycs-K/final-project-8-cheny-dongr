import java.nio.file.Path;
import java.nio.file.Paths;
public class DanceZombie extends Zombie{

  private int hp;
  private int x, y;
  private int speed;
  private int damage;
  private ArrayList<PImage> dancezeat = new ArrayList<PImage>();
  private ArrayList<PImage> dancezwalk = new ArrayList<PImage>();
  private ArrayList<PImage> dancezdance = new ArrayList<PImage>();
  private ArrayList<PImage> explodeframes = new ArrayList<PImage>();
  private ArrayList<PImage> dframes = new ArrayList<PImage>();
  private int currentFrame = 0;
  private int FRAMERATE = 3;
  private int change;
  private int spawn;
  boolean dance = false;
  boolean alive = true;
  boolean dying = false;
  boolean explode = false;
  
  public void doDamage(Plant a) {
    if (frameCount % 6 == 0) {
      a.takeDamage(damage);
    }
  }
  
  public boolean getExplode() {
    return explode;
  }
  public void setExplode() {
    hp -= 1800;
    if (hp <= 0){
    explode = true;
    currentFrame = 0;
    x += 30;
    }

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


  public DanceZombie(ArrayList<PImage> dancezwalk, ArrayList<PImage> dancezeat, ArrayList<PImage> dancezdance, ArrayList<PImage> dframes, ArrayList<PImage> explodeframes) {
    this.x = width-100;
    this.y = (int)(random(5))*80 + 100; //add constant once figured out positions
    this.spawn = frameCount;
    this.speed = 1;
    this.hp = 500;
    this.damage = 10;
    this.change = 0;
    this.dancezeat = dancezeat;
    this.dancezwalk = dancezwalk;
    this.dancezdance = dancezdance;
    this.explodeframes = explodeframes;
    this.dframes = dframes;
  }


  public void display() {
    if ((frameCount - spawn) % 600 == 0){
      Main.spawnNorm(1,2);
    }
  }
}
