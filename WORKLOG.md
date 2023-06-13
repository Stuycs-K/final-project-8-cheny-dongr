# Work Log
# Dev Log
## Working Features: 
-Zombies spawn randomly on one of the five lanes <br>
-Placeable plants by clicking on the seedpacket and place on the lawn<br>
-All plant and zombies' stats (hp, rate, damage, etc) all matches with the real game <br>
-Animation for the zombies' walking, eating, dying, and exploding<br>
-Plants and zombie can take damage and get removed once hp reaches zero<br>
-One-time use plants will not take damage when activated and will be removed after use.
-Plants spawn projectiles that damages the zombies<br>
-Sun will spawn (without sunflower) at set intervals<br>
-Player can hover over a sun to collect<br>
-Plants will not plant over each other <br>
-Clicking on the shovel and then on a plant will remove the plant <br>
-Clicking on the gear icon will bring the player back to the menu <br>
-Player can press 'r' to give up and go straight to losing screen <br>
-Player cannot abuse cheat commands in any place other than the testing level<br>
-When all zombies in the last wave is dead, load a 'winning' screen <br>
-When a zombie reaches the very left of the lawn, load a losing screen <br>
-In both screen, allow player to retry level or go back to menu <br>
-In the menu, allow the player to choose a level to play <br>
-There are three different levels with an actual script of what is spawning and what plants are allowed<br>
-A start button (in menu) that allows the player to play most recent level (default to 1)<br>
-testing level where player have access to 9000 sun ('c') or spawn each of the three zombies at the same time ('s') so the player can simulate their own level.
<br>
## Broken Features/Bugs:
-We were not able to implement plants only attacking when they see a zombie (due to time and confusion with separating the sunflower)<br>
-We were not able to set up a cooldown system so player does abuse a plant (due to time) <br>
-We don't have any major bugs as we make sure everything works before moving on (which led to less time)<br>
-We did not add sound nor lawnmover (that was an overlook)<br>
-Only 6 plants and 3 zombies (there weren't enough animation for zombies and we focused on setting up the menus and levels instead of more plants to make it more like a game)
<br>
## Resources:
-All code are from prior knowledge learned from this class. Only resources used were Processing documentation and PVZ wiki.<br>
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
### June 11
made everything look nicer with a better picture and icons in the menu, finishing up README and prototype

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
### June 10
-finished level system that player can select and play. More game testing.
