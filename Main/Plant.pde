abstract class Plant{
  private int Health;
  private int attackDamage;
  private int x,y;
  
  public abstract void takeDamage(int damage);
  public abstract void attack();
  public abstract void display();
  
}

/*Plant grid location to pixel calculation:
    x = (column * 100) + 145
    y = (row * 80) + 150
*/
