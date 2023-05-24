public class Zombie{
  private int hp;
  private int x,y;
  private int speed;
  private int damage;
  PImage zombie; 
  
  
  public Zombie(){
    this.x = width-100;
    this.y = (int)(random(5))*80 + 200; //add constant once figured out positions
    this.speed = 1;
    this.hp = 100;
    this.damage = 10; 
    //will change to zombie image when found
    fill(0);
    circle(x,y,80);
  }
  
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public void setPosition(int newposition){
    x = newposition;
  }
  public int getHP(){
    return hp;
  }
  public void setHP(int newhp){
    hp = newhp;
  }
  
  public void zombieMove(){
    this.setPosition(this.x-speed);
    circle(x,y,80);
    //change to image to show zombie moving
    //use millis() to get the interval
  }
  
  public void doDamage(Plant a){
    //a.setHP(a.getHP()-this.damage);
    //need same method for plants
    //change image to show zombie eating
  }
  
  
    
}
