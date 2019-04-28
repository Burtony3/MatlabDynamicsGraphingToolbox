function edgePositions = plotCircle(cPos,R,varargin)
% PLOTCIRCLE plots a datum for use in dynamics problems.
%    PLOTCIRCLE(centerPosition(x,y),R) Plots a circle at centerPostion
%    with Radius R.
%    
%    Also outputs the four edge positions starting from horizontal at 
%    angles = [0 90 180 270] Degrees
%
%    PLOTCIRCLE(centerPosition(x,y),R,angle will adjust the above positions
%    with the given angle
%
%    See also PLOTSETUP, PLOTLINE.

%% TODO:
   %* The length of the theta array should scale with figure limits
   %* Add ability to add text to circle

    switch nargin
%% Angle Specified Case
        case 3
            if R >= 0.5 
                theta = linspace(0,2*pi,720);
            else
                theta = linspace(0,2*pi,360);
            end
            
            xCirc = R*cos(theta) + cPos(1);
            yCirc = R*sin(theta) + cPos(2);
            
            plot(xCirc,yCirc,'-k','LineWidth',1.5)
            fill(xCirc,yCirc,'w')
            
            edgePositions(:,1) = R*cos([0 pi/2 pi 3*pi/2] + deg2rad(varargin{1})) + cPos(1);
            edgePositions(:,2) = R*sin([0 pi/2 pi 3*pi/2] + deg2rad(varargin{1})) + cPos(2);
        
        
%% Radius and Position Case
        case 2
            if R >= 0.5
                theta = linspace(0,2*pi,720);
            else
                theta = linspace(0,2*pi,360);
            end
            
            xCirc = R*cos(theta) + cPos(1);
            yCirc = R*sin(theta) + cPos(2);
            
            plot(xCirc,yCirc,'-k','LineWidth',1.5)
            fill(xCirc,yCirc,'w')
            
            edgePositions(:,1) = R*cos([0 pi/2 pi 3*pi/2]) + cPos(1);
            edgePositions(:,2) = R*sin([0 pi/2 pi 3*pi/2]) + cPos(2);
    end
    
end
