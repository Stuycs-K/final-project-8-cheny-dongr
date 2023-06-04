import java.nio.file.Path;
import java.nio.file.Paths;
public class NormZombie extends Zombie{

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


  public NormZombie(ArrayList<PImage> wframes, ArrayList<PImage> eframes, ArrayList<PImage> dframes, ArrayList<PImage> explodeframes) {
    this.x = width-100;
    this.y = (int)(random(5))*80 + 100; //add constant once figured out positions
    this.speed = 1;
    this.hp = 200;
    this.damage = 10;
    this.change = 0;
    this.wframes = wframes;
    this.eframes = eframes;
    this.dframes = dframes;
    this.explodeframes = explodeframes;
  }
  
    public NormZombie(ArrayList<PImage> wframes, ArrayList<PImage> eframes, ArrayList<PImage> dframes, ArrayList<PImage> explodeframes, int row, int col) {
    this.x = col * 83 + 140;
    this.y = row * 80 + 100;
    this.speed = 1;
    this.hp = 200;
    this.damage = 10;
    this.change = 0;
    this.wframes = wframes;
    this.eframes = eframes;
    this.dframes = dframes;
    this.explodeframes = explodeframes;
  }


  public void display() {
    if (explode){
      if ((frameCount) % (2) == 0) {
          currentFrame++;
        }
      if (currentFrame >= explodeframes.size()-1) {
        alive = false;
      }

      image(explodeframes.get(currentFrame), x, y);
    }
    else{
    if (hp <= 0) {
      if (!(dying)) {
        currentFrame = 0;
        dying = true;
      }
      setChange(2);
    }
    
    
    if (change != 2) {

      if (change == 0) {
        if ((frameCount) % 3 == 0) {
          this.setX(this.x-speed);
      }
        if ((frameCount) % (3) == 0) {
          currentFrame++;
          //this.setX(this.x-speed);
          if (currentFrame >= wframes.size()) {
            currentFrame = 0;
          }
        }
        image(wframes.get(currentFrame), x, y);
      } else if (change == 1) {
        if ((frameCount) % (2) == 0) {
          currentFrame++;
        }
        if (currentFrame >= eframes.size()) {
          currentFrame = 0;
        }

        image(eframes.get(currentFrame), x, y);
      }
    } else {
      currentFrame++;
      if (currentFrame >= dframes.size()-1) {
        alive = false;
        //currentFrame = 0;
      }

      image(dframes.get(currentFrame), x, y);
    }
  }
  }
}
