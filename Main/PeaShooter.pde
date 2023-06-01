import java.nio.file.Path;
import java.nio.file.Paths;

public class PeaShooter extends Plant{
  public final static int COST = 100;
  private int Health;
  private int attackDamage;
  private int x,y;
  private int attackSpeed = 90;
  private int attackCounter = 0;
  //private ArrayList<PImage> frames = new ArrayList<PImage>();
  private int currentFrame = 0;
  //private final int FRAMERATE = 3;
  
  //for seedpacket use
  public PeaShooter(){
  }
  
  public PeaShooter(int x, int y){
    this.x = x;
    this.y = y;
    Health = 100;
    //LOADING THE FRAMES
    /*File directory = new File("PlantFrames" + File.separator + "Peashooter");
    File cur = new File(System.getProperty("user.dir"));
    println(cur.getAbsolutePath());
    println(directory.isFile());
    
    println(sketchPath());
    File current = new File(sketchPath() + "/PlantFrames/Peashooter");
    
    
    Path currentRelativePath = Paths.get("");
    String s = currentRelativePath.toAbsolutePath().toString();
    System.out.println("Current absolute path is: " + s);*/
    /*
    File framesFolder = new File(sketchPath("PlantFrames" + File.separator + "PeaShooter"));
    for(int i = 1; i <= 24; i++){
      println(framesFolder.getAbsolutePath());
      frames.add(loadImage(framesFolder.getAbsolutePath() + File.separator + "peashooter" + i + ".png"));
    } */
  }
  public int getHP(){
    return Health;
  }
  
  public void takeDamage(int damage){
    Health -= damage;
  }
  
  public void attack(){
    if(attackCounter <= 0){
      Main.addProjectile(new Projectile(20, 8, x+20,y+20));
      attackCounter = attackSpeed;
    } else {
      attackCounter--;
    }
  }
  
  public void display(){
    if(frameCount % 6 == 0){
      currentFrame++;
      if(currentFrame >= Main.PeashooterFrames.size()){
        currentFrame = 0;
      }
    }
    image(Main.PeashooterFrames.get(currentFrame), x, y);
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
}
