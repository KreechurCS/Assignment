	I started this project a few weeks into the course as we were given a brief idea of what it would be so i decided to get a head start.
However this appeared to be more of a problem than anything else. I used methods for most the components in the first few weeks as
we had not been taught how to use objects and classes at this time. I leaned quickly that this would prove to be a big problem in the long run
as i found it difficult to convert these to objects and only managed to do it with a the panning class. If i was to do another project i will make sure it isi object orientated
from the outset to prevent these problems occuring in the future.
	I found the first two weeks the hardest as i had an idea then decided to do something else and this occured twice before setling
on the idea of doing a spaceship UI. I got inspiration from the game "No Mans Sky" as i personally enjoyed the open world and expansiveness
of it as it was almost meditative. The first aspects of my UI that i did was the general layout. I added a radar initially which i decided to remove and add a different one as i found
it did not function as i would like so i went to a standard rotating one. The next thing i added was the pulsing sidebars to the UI which drastically
Improved the appearance. I then added the fuel bar and speed. The rate at which the fuel decreases is affected by the speed of the ship.
I then added the shield system which only is online when there is fuel. Once the fuel is empty the speed of the ship falls to 0 and the shield is offline.
A message flashes in the top of the cockpit and alerts the user when the fuel is low, empty and when the shield is offline. I then added the ship health bar
which reduces when the ship takes damage. This can only occur when the shield is offline. A random number is generated and if it is 7 the ship takes a damage value randomly from a range of values.
I then knew how objects worked so i removed the old radar and added a new one with rotating arcs around it. I then added the ships panning i initially did this as a method but moved it to a class.
When <- or -> is pressed the ui will rotate to a maximum angle. I added the starmap then which can be pressed on and displays details of the star or planet on the top left of the cockpit UI.
I then added the indicator which shows when damage is taken and what percentage health the ship is at.
Next i replaced the black backgroudn with an image that is laoded and changed the general ship colour.
I then added the engine in the bottom left which changes speed with the ship speed. This was the thing i was most proud about at it uses standard concepts of addition and subtraction to make it pulse in and out. I also used push pop matrix and translate and rotate to complete the function of the engine. I added the background music next using the sound library in processing and engine sounds. However i had to remove this as it was producing an unknown error and would not loop. I then updated the rate at which fuel decreases.
	Overall i enjoyed this assignment and look forward to doing more assignments/projects similiar to this.
