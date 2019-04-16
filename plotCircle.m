function edgePositions = plotCircle(cPos,R,varargin)
% PLOTGROUND plots a datum for use in dynamics problems.
%    PLOTGROUND(H) adds a flat ground at height H
%
%    PLOTGROUND(H,Orientation) adds a flat ground at height H with
%    Orientation up or down
%
%    PLOTGROUND(xSpan , ySpan) adds a ground with 
%       Starting point: [xSpan(1) ySpan(1)]
%       Ending point: [xSpan(2) ySpan(2)]
%
%    PLOTGROUND(xSpan , ySpan , Orientation) adds a ground with 
%       Starting point: [xSpan(1) ySpan(1)]
%       Ending point: [xSpan(2) ySpan(2)]
%       Orientation: Declares which side the splines are on
%           * 'up' or 'down' with reference to flat ground
%           * For vertical lines: 'down' negative normal direction
%                                 'up' is positive normal direction
%
%    See also PLOTSETUP, PLOTLINE.

    switch nargin
        
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
    end
    
end
