abstract class Plant{
  private int Health;
  private int x,y;
  
  public abstract void takeDamage(int damage);
  public abstract void attack();
  public abstract void display();
  public abstract int getHP();
}


/*Plant grid location to pixel calculation:
    x = (column * 82) + 245
    y = (row * 80) + 160
*/
/*Plant pixel location to grid calculation:
    col = (x-245) / 82
    row = (y-160) / 80
*/
