public class PotatoMine extends Plant{
  public final static int COST = 25;
  private int Health;
  private int x,y;
  private int armingCounter = 100;
  //private ArrayList<PImage> frames = new ArrayList<PImage>();
  private int currentFrame = 0;
  private final int FRAMERATE = 3;
  
  public PotatoMine(int x, int y){
    this.x = x;
    this.y = y;
    Health = 100;
    
    /*
    File framesFolder = new File(sketchPath("PlantFrames" + File.separator + "Potatomine"));
    
    frames.add(loadImage(framesFolder.getAbsolutePath() + File.separator + "unarmedPotato" + ".png"));
    
    for(int i = 1; i <= 1; i++){
      frames.add(loadImage(framesFolder.getAbsolutePath() + File.separator + "potatomine" + i + ".png"));
    } */
  }
  
  public void takeDamage(int damage){
    Health -= damage;
  }
  
  public void attack(){
    if(armingCounter <= 0){
      
    } else {
      armingCounter--;
    }
  }
  
  public void display(){
    if(armingCounter > 0){
      currentFrame = 0;
    } else {
      currentFrame = 1;
    }
    image(Main.PotatomineFrames.get(currentFrame), x, y);
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
