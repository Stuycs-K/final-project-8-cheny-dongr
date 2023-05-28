public class SunFlower extends Plant{
  public final static int COST = 50;
  private int Health;
  private int x,y;
  private int attackSpeed = 100;
  private int attackCounter = 0;
  private ArrayList<PImage> frames = new ArrayList<PImage>();
  private int currentFrame = 0;
  private final int FRAMERATE = 3;
  
  public SunFlower(int x, int y){
    this.x = x;
    this.y = y;
    
    File framesFolder = new File(sketchPath("PlantFrames" + File.separator + "Sunflower"));
    File[] images = framesFolder.listFiles();
    //CURRENTLY SKIPS EVERY OTHER FRAME
    for(int i = 1; i <= 24; i+=2){
      frames.add(loadImage(framesFolder.getAbsolutePath() + File.separator + "sunflower" + i + ".png"));
    }
  }
  
  public void takeDamage(int damage){
  }
  
  //ATTACK FOR SUNFLOWER JUST MEANS IT CREATE SUN
  public void attack(){
    if(attackCounter <= 0){
      Main.spawnSun(new Sun(x+80,y+30));
      attackCounter = attackSpeed;
    } else {
      attackCounter--;
    }
  }
  
  public void display(){
    if(frameCount % FRAMERATE == 0){
      currentFrame++;
      if(currentFrame >= frames.size()){
        currentFrame = 0;
      }
    }
    image(frames.get(currentFrame), x, y, 80, 80);
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
}