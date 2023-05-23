public class PeaShooter extends Plant{
  private int Health;
  private int attackDamage;
  private int x,y;
  private int attackSpeed = 100;
  private int attackCounter = 0;
  
  public PeaShooter(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  public void takeDamage(int damage){
  }
  
  public void attack(){
    if(attackCounter <= 0){
      Main.addProjectile(new Projectile(-1, 10, x,y));
      attackCounter = attackSpeed;
    } else {
      attackCounter--;
    }
  }
  
  public void display(){
    rect(x,y,60,100);
  }
}
