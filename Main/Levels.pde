public class Levels{
  private int currentLevel = 1;
  private int timer = 0;

  public Levels(){
  }

  public int getTimer(){
    return timer;
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
    Main.addZombie(new DanceZombie(dancezwalk, dancezeat, dancezdance, dframes, explodeframes));
  }
  public void waves(int norm, int foot, int dance){
    for (int x = 0; x < norm; x++){
      spawnNorm();
    }
    for (int x = 0; x < foot; x++){
      spawnFoot();
    }
    for (int x = 0; x < dance; x++){
      spawnDance();
    }
  }
  
  //playLevel# RETURNS TRUE WHEN LEVEL IS COMPLETE
  public boolean playLevel1(){
    //to compile
      if (timer == 1500){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 3000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 4000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 4800){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 5500){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 6500){
        waves(5,0,0);
      } 
      if (timer == 6700){
        waves(5,0,0);
      }
      if (timer == 6900){
        waves(5,0,0);
      }
    return false;
  }
  public boolean playLevel2(){
      if (timer == 1300){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 2600){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 3500){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 4000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 5500){
          waves(0,1,0);
      }
      if (timer == 7200){
        waves(4,1,0);
      }
      if (timer == 7800){
        waves(4,0,0);
      }
      if (timer == 8400){
        waves(4,0,0);
      }
      if (timer == 9000){
        waves(4,0,0);
      }
      if (timer == 10000){
        waves(4,1,0);
      }
      if (timer == 10300){
        waves(8,0,0);
      }
      if (timer == 12700){
        waves(8,2,0);
      }
    return false;
  }
  public boolean playLevel3(){
    if (timer == 1300){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 2600){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 3500){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 4000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 4800){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 5400){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 6000){
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
          Main.addZombie(new NormZombie(wframes, eframes, dframes, explodeframes));
      }
      if (timer == 7400){
          waves(0,0,1);
      }
      if (timer == 8800){
          waves(4,0,0);
      }
      if (timer == 9500){
          waves(4,0,0);
      }
      if (timer == 10500){
          waves(2,0,1);
      }
      if (timer == 11500){
          waves(6,0,0);
      }
      if (timer == 13000){
          waves(5,0,2);
      }
    
    
    return false;
  }
  public boolean playLevel4(){
      if (timer > 1000 && Main.Zombies.size() == 0){
        Main.setLost(1);
      }
    return false;
  }
  public boolean playLevel5(){
    return false;
  }
  
  public void setCurrentLevel(int level){
    currentLevel = level;
    timer = 0;
  }
  public int getCurrentLevel(){
    return currentLevel;
  }
}
