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
    fill(50,240,50);
    circle(x,y,20);
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  
  public void doDamage(Zombie a){
    a.setHP(a.getHP()-damage);
  }
}
