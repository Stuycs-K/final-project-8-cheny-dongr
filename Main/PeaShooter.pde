public class PeaShooter extends Plant{
  private int Health;
  private int attackDamage;
  private int x,y;
  
  public PeaShooter(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  public void takeDamage(int damage){
  }
  
  public Projectile attack(){
    return new Projectile(-1,10,x,y);
  }
  
  public void display(){
    rect(x,y,60,100);
  }
}
