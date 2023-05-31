public class WallNut extends Plant{
  public final static int COST = 50;
  private int Health;
  private int x,y;
  //private ArrayList<PImage> frames = new ArrayList<PImage>();
  private int currentFrame = 0;
  private final int FRAMERATE = 3;
  
  public WallNut(int x, int y){
    this.x = x;
    this.y = y;
    Health = 3000;
  }
  
  public void takeDamage(int damage){
    Health -= damage;
  }
  
  //ATTACK FOR SUNFLOWER JUST MEANS IT CREATE SUN
  public void attack(){
  }
  
  public void display(){
    if(frameCount % FRAMERATE == 0){
      currentFrame++;
      if(currentFrame >= Main.WallnutFrames.size()){
        currentFrame = 0;
      }
    }
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
