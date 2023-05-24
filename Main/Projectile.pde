public class Projectile{
  private int damage;
  private int speed;
  private int x,y;
  
  public Projectile(int damage, int speed, int x, int y){
    this.damage = damage;
    this.speed = speed;
    this.x = x;
    this.y = y;
  }
    
  public void move(){
    x += speed;
  }
  public void display(){
    fill(0);
    circle(x,y,10);
  }
}
