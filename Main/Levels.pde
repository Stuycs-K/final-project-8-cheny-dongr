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
  
  public void spawnNorm(){
    Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
  }
  
  public void spawnFoot(){
    Main.addZombie(new FootballZombie(helmetzwalk, nohelmetzwalk,helmetzeat, nohelmetzeat,dframes, explodeframes));
  }
  
  public void spawnDance(){
    
  }
  public void waves(int amount){
  }
  
  //playLevel# RETURNS TRUE WHEN LEVEL IS COMPLETE
  public boolean playLevel1(){
    //to compile
      if (timer == 1600){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 3000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 4000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 5000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 6000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      
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
