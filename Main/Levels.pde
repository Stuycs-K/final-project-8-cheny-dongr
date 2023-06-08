public class Levels{
  private int currentLevel = 1;
  private int timer = 0;
  
  public Levels(){
  }
  
  //RETURNS TRUE WHEN A LEVEL IS COMPLETED
  public boolean playCurrentLevel(){
    if(currentLevel == 1){
      if(playLevel1() == true){
        return true;
      } 
      else {
        timer++;
        return false;
      }
    }
    if(currentLevel == 2){
      if(playLevel2() == true){
        return true;
      }
      else {
        timer++;
        return false;
      }
    }
    if(currentLevel == 3){
      if(playLevel3() == true){
        return true;
      }
      else {
        timer++;
        return false;
      }
    }
    if(currentLevel == 4){
      if(playLevel4() == true){
        return true;
      }
      else {
        timer++;
        return false;
      }
    }
    if(currentLevel == 5){
      if(playLevel5() == true){
        return true;
      }
      else {
        timer++;
        return false;
      }
    }
    
    return true;
  }
  
  public void nextLevel(){
    currentLevel++;
    timer = 0;
  }
  
  //playLevel# RETURNS TRUE WHEN LEVEL IS COMPLETE
  public boolean playLevel1(){
    //to compile
    return false;
  }
  public boolean playLevel2(){
    return false;
  }
  public boolean playLevel3(){
    return false;
  }
  public boolean playLevel4(){
    return false;
  }
  public boolean playLevel5(){
    return false;
  }
  
}
