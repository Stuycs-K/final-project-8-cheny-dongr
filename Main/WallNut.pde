public class WallNut extends Plant{
  public final static int COST = 50;

  private int Health = 4000;
  private final int MaxHealth = 4000;

  private int x,y;
  //private ArrayList<PImage> frames = new ArrayList<PImage>();
  private int currentFrame = 0;
  
  public WallNut(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  public void takeDamage(int damage){
    Health -= damage;
  }
  
  //ATTACK FOR SUNFLOWER JUST MEANS IT CREATE SUN
  public void attack(){
  }
  
  public void display(){
    if(Health < (MaxHealth/3))
    {
      currentFrame = 2;
    }
    else if(Health < 2*(MaxHealth/3))
    { //<>//
      currentFrame = 1;
    } //<>// //<>//
    image(Main.WallnutFrames.get(currentFrame), x, y);
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  
  public int getHP(){
    return Health;
  }
}
