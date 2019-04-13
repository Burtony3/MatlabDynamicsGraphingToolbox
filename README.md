# MatlabDynamicsGraphingToolbox


	This open-source tool set was created for making the visualization of dynamics problems a 
much simpler process by condensing necessary interlocking shapes into a set of easy to use functions.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note:
   For more explaination on the below functions reference the "help" command in MATLAB for specific use cases.

    ___________________________________________________________________________
   | For example "help plotGround" returns:                                    |
   |                                                                           |
   |    plotGround plots a datum for use in dynamics problems.                 |
   |      plotGround(H) adds a flat ground at height H                         |
   |                                                                           |
   |      plotGround(H,Orientation) adds a flat ground at height H with        |
   |      Orientation up or down                                               |
   |                                                                           |
   |      plotGround(xSpan , ySpan) adds a ground with                         | 
   |         Starting point: [xSpan(1) ySpan(1)]                               |
   |         Ending point: [xSpan(2) ySpan(2)]                                 |
   |                                                                           |
   |      plotGround(xSpan , ySpan , Orientation) adds a ground with           |
   |         Starting point: [xSpan(1) ySpan(1)]                               |
   |         Ending point: [xSpan(2) ySpan(2)]                                 |
   |         Orientation: Declares which side the splines are on               |
   |             * 'up' or 'down' with reference to flat ground                |
   |             * For vertical lines: 'down' negative normal direction        |
   |                                   'up' is positive normal direction       |
   |                                                                           |
   |      See also plotSetup, PLOTLINE.                                        |
   |___________________________________________________________________________|

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Functions:
   * plotSetup():
     This function should be used first before all other functions to prep the figure space for graphing the problem.

   * plotGround():
     Also known as datum, this function creates the characteristic shape used by most dynamics books to where either
     the potential energy equals zero, and/or a place to fix an object

   * plotLine():
     Self-Explanitory