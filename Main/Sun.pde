public class Sun{
  private int x,y;
  private final int SIZE = 30;
  private final int sunValue = 25;
  private PImage sunImage;
  private int lifespan;
  
  public Sun(int x, int y){
    this.x = x;
    this.y = y;
    File image = new File(sketchPath("PlantFrames" + File.separator + "Sun.png"));
    sunImage = loadImage(image.getAbsolutePath());
    lifespan = frameCount;
  }
  
  public void display(){
    fill(100, 100 ,0);
    image(sunImage,x-40,y-40,80,80);
  }
  
  public boolean isCollected(){
    return ((mouseX < x+SIZE && mouseX > x-SIZE) && (mouseY < y+SIZE && mouseY > y-SIZE));
  }
  
  public int life(){
    return (frameCount - lifespan);
  }
}
