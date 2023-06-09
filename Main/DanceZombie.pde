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
  private boolean dance;
  boolean alive = true;
  boolean dying = false;
  boolean explode = false;
  
  public void setCurrent(){
    currentFrame = 0;
  }
  

  
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
    return x-30;
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
    this.hp = 400;
    this.damage = 10;
    this.change = 0;
    this.dancezeat = dancezeat;
    this.dancezwalk = dancezwalk;
    this.dancezdance = dancezdance;
    this.explodeframes = explodeframes;
    this.dframes = dframes;
    this.dance = false;
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
      if ((frameCount - spawn) % 1800 == 0 || frameCount - spawn == 300){
        dance = true;
       setChange(4);
       currentFrame = 0;
     
    }
    if (hp <= 0) {
      if (!(dying)) {
        currentFrame = 0;
        dying = true;
      }
      setChange(2);
    }
    if (dance){
      setChange(4);
    }
    if (change != 2) {

      if (change == 0) {
        if ((frameCount) % 3 == 0) {
          this.setX(this.x-speed);
      }
        if ((frameCount) % (3) == 0) {
          currentFrame++;
          //this.setX(this.x-speed);
        }
        if (currentFrame >= dancezwalk.size()) {
            currentFrame = 0;
          }
        image(dancezwalk.get(currentFrame), x, y);
      } else if (change == 1) {
        if ((frameCount) % (2) == 0) {
          currentFrame++;
        }
        if (currentFrame >= dancezeat.size()) {
          currentFrame = 0;
        }

        image(dancezeat.get(currentFrame), x, y);
      }
      else if (change == 4){
        if ((frameCount) % (4) == 0) {
          currentFrame++;
        }
        if (currentFrame == dancezdance.size()-1) {
          spawnNorm(gridrow(),gridcol());
          currentFrame = 0;
          dance =false;
          setChange(0);
          
          
        }

        image(dancezdance.get(currentFrame), x, y);
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
  
  public void spawnNorm(int row, int col){
    if (row-1 >= 0 ){
      Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes,row-1,col));
    }
    if (col-1 >= 0 ){
      Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes,row,col-1));
    }
    if (row +1 <= 4){
      Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes,row+1,col));
    }
    if (col+1 <= 9){
      Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes,row,col+1));
    }
    
  }
}
