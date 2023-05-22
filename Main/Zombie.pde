public class Zombie{
  private int hp;
  private PVector position;
  private int speed;
  private int damage;
  
  
  public Zombie(){
    this.x = width-200;
    this.y = random(5);
    this.speed = 10;
    this.hp = 100;
    this.damage = 10;   
  }
  
  public PVector getPosition(){
    return position;
  }
  public void setPosition(newposition){
    position = newposition;
  }
  public int getHP(){
    return hp;
  }
  public void setHP(newhp){
    hp = newhp;
  }
  
    
}
