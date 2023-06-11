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
### June 2
Added the footballzombie along with the animations, and zombie and plant interactions worked
### June 4
Added the dance zombie(no animations yet), set all plants and zombie's stats to match with the actual game
### June 5
Completed dance zombie animation, dance zombie spawning zombies
### June 6
Organizing code in setup and draw
### June 8
Reworked dance zombie to make it easier to call on in levels, made level 1 with only normal zombies, level 2 with football, level 3 with dance zombie
### June 9
set up ongoing, lost, win with game interaction. Fixed errors within going to different stages. Amount of plants unlock is different for each level, set up win and lost page where player and retry level or go back to menu


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
### June 1
-added shovel to remove plants during gameplay
-added buttons on demo branch to help demo the game
### June 4
-added working Cherrybomb plant
### June 6
-added repeater plant, frames size still need to be adjusted
### June 7
-worked on implementing a Levels system for the player to progress through
### June 9
-finished menu screen and level logic
-changed shovel icon and added a menu button to go back to level selection
