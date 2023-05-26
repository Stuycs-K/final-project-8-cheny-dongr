public class Sun{
  private int x,y;
  private final int SIZE = 30;
  private final int sunValue = 25;
  
  public Sun(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  public void display(){
    fill(100, 100 ,0);
    circle(x, y, SIZE);
  }
  
  public boolean isCollected(){
    return ((mouseX < x+SIZE && mouseX > x-SIZE) && (mouseY < y+SIZE && mouseY > y-SIZE));
  }
}
