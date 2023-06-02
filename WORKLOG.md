# Work Log

## Yao 
### May22
Made the classes, got most of the basic zombie methods done
### May23
continue with zombie class, added temporary garden background and tempory zombie movement code
### May24
added the animation for zombie walking and dying
### May25
projectile damaging zombie, projectile disappear after use, got conversion of zombie position to plant grid
### May 26
projectile aligned with zombie, fixed zombie not dying error, zombie eating animation at the right grid
### May 27
small details: plants only shoot when there is zombie, zombie killing plant, a little bit smoother frames when lots of zombie
### May 28
merging, and fixing small errors with plant and zombie interactions, found new zombie animations
### May 30
fixed most of the lagginess, converted new zombie animations to frames
### May 31
set up code in preparation of the explosion effect from potato mine class, tinker with the frames and damage to match with the game
### June 1
demo branch, key for spawning zombie and removing all zombie, fixed exploding animation errors
## Rui Dong

### May22

Created basic projectile class, starting implementing Plant class.

### May 23

-Created Peashooter Class
-peashooters now shoots projectiles every some time interval.
-added animation frames for peashooter, loops through each frame. Peashooters look animated.
### May 24
-Created Sun Class
-Sun is collected when mouse hovers over it
### May 25
-Realigned Plants to the Grid based on pixel x and y locations. 
-Started creating a seedpacket bar on top of the screen to select which plant to place down.
### May 26
-Created sunflower class that spawns a sun every some time.
-added animation frames for sunflower
### May 29
-Created potatoe mine class
-potato mine can be planted and becomes active after some time
### May 30
-Changed loading images for frames to only be in setup()
-Used resize() once in setup() for images so game runs faster
### May 31
-added wallnut class
-wallnuts can be placed and have damaged frames
-progress on potatoe mine's explosion mechanic
