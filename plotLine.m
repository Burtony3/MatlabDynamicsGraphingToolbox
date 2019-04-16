function output = plotLine(startPoint,varargin)
% PLOTLINE plots a line for use in dynamics problems.
%    PLOTLINE(startPoint,L,Theta) adds a line at startPoint with length L
%    and angle Theta (measured in degrees from the horizontal axis)
%
%    PLOTLINE(startPoint,endPoint) adds a line with at startPoint to
%    endPoint
%
%    See also PLOTSETUP, PLOTCIRCLE.

    switch nargin
        
%% Start Point with Length and Angle Case

        case 3
            %Finding End Point
                endPoint = [startPoint(1) + varargin{1}*cosd(varargin{2}),...
                            startPoint(2) + varargin{1}*sind(varargin{2})];
                    
            %Plotting
                plot([startPoint(1) endPoint(1)],[startPoint(2) endPoint(2)],...
                     '-k','LineWidth',1.5)
                        
            %Outputting Answer
                output = endPoint;
                
            %Debugging Text
                fprintf('DEBUG: End Point Case Activated\n')
                fprintf('       End Point Located at [%g %g]\n',endPoint)
            
%% Start Point to End Point Case

        case 2

    end
    
end