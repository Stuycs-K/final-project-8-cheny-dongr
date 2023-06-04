public class CherryBomb extends Plant{
  public final static int COST = 150;
  private int Health;
  private int x,y;
  private int armingCounter = 100;
  //private ArrayList<PImage> frames = new ArrayList<PImage>();
  private int currentFrame = 0;
  private final int FRAMERATE = 3;
  
  public CherryBomb(int x, int y){
    this.x = x;
    this.y = y;
    Health = 100;
    
  }
  
  public void takeDamage(int damage){
    //Cherrybomb do not take damage
    //Health -= damage;
  }
  
  public void attack(){
    if(armingCounter <= 0){
      Main.explodeZombieOnTile((y-160) / 80 - 1, ((x-245) / 82) - 1);
      Main.explodeZombieOnTile((y-160) / 80 - 1, ((x-245) / 82));
      Main.explodeZombieOnTile((y-160) / 80 - 1, ((x-245) / 82) + 1);
      Main.explodeZombieOnTile((y-160) / 80, ((x-245) / 82) - 1);
      Main.explodeZombieOnTile((y-160) / 80, ((x-245) / 82));
      Main.explodeZombieOnTile((y-160) / 80, ((x-245) / 82) + 1);
      Main.explodeZombieOnTile((y-160) / 80 + 1, ((x-245) / 82) - 1);
      Main.explodeZombieOnTile((y-160) / 80 + 1, ((x-245) / 82));
      Main.explodeZombieOnTile((y-160) / 80 + 1, ((x-245) / 82) + 1);
      Health = 0;
    } else {
      armingCounter--;
    }
  }
  
  public void display(){
    if(armingCounter > 0){
      currentFrame = 0;
      image(Main.CherrybombFrames.get(currentFrame), x, y);
    } else {
      currentFrame = 1;
      image(Main.CherrybombFrames.get(currentFrame), x-80, y-80);
    }
    //image(Main.CherrybombFrames.get(currentFrame), x, y);
  }
  public int getHP(){
    return Health;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
}
