# MatlabDynamicsPlottingToolbox



This **open-source** tool set was created for making the visualization of dynamics problems a much simpler process by condensing necessary interlocking shapes into a set of easy to use functions.



## List of Functions

 
- **mdpSetup**: Creates figure and setups up plot space
 
- **mdpGround**: Plots the datum/ground as seen in most dynamics problems
 
- **mdpSave**: Saves plot as a gif when running in a for loop
 
- **mdpPhasePlot**: Creates phase diagram from the ode-function outputs
 
- **mdpLine**: Creates line that outputs the endpoint to attach other shapes to
 
- **mdpCircle**: Plots circle at a given point and outputs the edge points in each of the cardinal directions (0, 90, 180, 270 Degrees measured from the horizontal axis CCW)
 
- **mdpBox**: Plots box like mdpCircle, while outputting points at the center of each edge. 
 
- **mdpSpring**: Plots a spring given two end points and an original, unstretched length. 
 
- **mdpTrail**: Creates a trail from the a given position array


More detailed help on any of these functions can be found by typing `help functionName` into the MATLAB Command Window


## Installation


By running the `MatlabDynamicsPlottingToolbox.mltbx`, it will install the functions above as a Toolbox in MATLAB and make it available in any `.m` file. 
  


## Function Examples


### Creating Single Pendulum
    

```
[t,angle] = ode45(odeFun,tSpan,IC,options)
    
mdpSetup
    
mdpGround([0 0.8],[1 0.8],'down')
    
endPoint = mdpLine([0.5],0.25,angle - 90) %The -90 translates line from horizontal to down
    
mdpCircle(endPoint,0.05,angle)

```

For more examples, reference `exampleScenario.m` which contains use cases of all functions listed above. Some examples include two single pendulums linked by a spring and excited by a harmonic force, and 5 boxes connected by springs with the front pulled by a constant force.
