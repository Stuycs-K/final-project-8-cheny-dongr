import java.nio.file.Path;
import java.nio.file.Paths;

public class PeaShooter extends Plant{
  private int Health;
  private int attackDamage;
  private int x,y;
  private int attackSpeed = 100;
  private int attackCounter = 0;
  private ArrayList<PImage> frames = new ArrayList<PImage>();
  private int currentFrame = 0;
  private final int FRAMERATE = 3;
  
  public PeaShooter(int x, int y){
    this.x = x;
    this.y = y;
    
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
    
    File current = new File(sketchPath());
    println(current.exists());
    File[] files = current.listFiles();
    for(File file : files){
      println();
    }
    
    File framesFolder = new File(sketchPath() + "/PlantFrames/Peashooter");
    File[] images = framesFolder.listFiles();
    println(framesFolder.exists());
    for(int i = 1; i <= 24; i++){
      println(framesFolder.getAbsolutePath());
      frames.add(loadImage(framesFolder.getAbsolutePath() + "/peashooter" + i + ".png"));
    }
  }
  
  public void takeDamage(int damage){
  }
  
  public void attack(){
    if(attackCounter <= 0){
      Main.addProjectile(new Projectile(-1, 10, x+20,y+20));
      attackCounter = attackSpeed;
    } else {
      attackCounter--;
    }
  }
  
  public void display(){
    if(frameCount % FRAMERATE == 0){
      println(currentFrame);
      currentFrame++;
      if(currentFrame >= frames.size()){
        currentFrame = 0;
      }
    }
    image(frames.get(currentFrame), x, y, 100, 100);
  }
  
}
