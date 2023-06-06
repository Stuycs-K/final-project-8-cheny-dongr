abstract class Zombie {

  private int hp;
  private int x, y;
  private int speed;
  private int damage;

  private int currentFrame = 0;
  private int FRAMERATE = 3;
  private int change;
  boolean alive = true;
  boolean dying = false;
  boolean explode = false;
  boolean dance = false;

  public abstract boolean getDance();
  public abstract void display();
  public abstract void setCurrent();
  public abstract void doDamage(Plant a);
  public abstract boolean getExplode();
  public abstract void setExplode();
  public abstract int gridcol();
  public abstract int gridrow(); 
  public abstract boolean alive(); 
  public abstract int getX(); 
  public abstract void setX(int newposition);  
  public abstract int getY();
  public abstract int getChange();  
  public abstract void setChange(int newchange);  
  public abstract int getHP();
  public abstract void setHP(int newhp);
}
