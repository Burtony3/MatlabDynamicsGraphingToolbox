function edgePos = mdpCircle(cPos,R,varargin)
% mdpCircle plots a circle at a certain point.
%    
%    Required Inputs:
%       cPos = [x y] position vector of center of circle
%
%       R = scalar of radius of circle
%
%    Optional Inputs
%       angle = scalar angle, in degrees, of circle from its original
%               orientation (only affects edgePositions outputs)
%
%    Outputs:
%       edgePos = [x y] of the four edges of the circle in order 
%                 [0 90 180 270] degrees CCW from horizontal right
%
%    Examples:
%       edgePos = mdpCircle([3 2], 3)
%
%    See also mdpSetup, mdpBox, mdpLine.
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
            
            edgePos(:,1) = R*cos([0 pi/2 pi 3*pi/2] + deg2rad(varargin{1})) + cPos(1);
            edgePos(:,2) = R*sin([0 pi/2 pi 3*pi/2] + deg2rad(varargin{1})) + cPos(2);
        
        
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
            
            edgePos(:,1) = R*cos([0 pi/2 pi 3*pi/2]) + cPos(1);
            edgePos(:,2) = R*sin([0 pi/2 pi 3*pi/2]) + cPos(2);
    end
    
end
