function output = mdpLine(startPoint,varargin)
% mdpLine Creates a line for use as fixed points as well as moving ones
%    Variations:
%       mdpLine(startPoint,L,angle) = Line with fixed length
%       mdpLine(startPoint,endPoint) = Line with variable length
%    
%    Required Inputs:
%       startPoint & endPoint = [x y] position vectors
%
%       L = scalar length to be used for line
%
%       angle = scalar angle, in degrees, measured from horizontal
%
%    Outputs:
%       tipPoint = [x y] position vector for end point of line (only for
%                  first case of function)
%
%    Examples:
%       mdpLine([1 2],5,90)
%
%    See also mdpSetup, mdpBox, mdpCircle.

%% TODO:
   %* Ability to add text to line

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
%                 fprintf('DEBUG: End Point Case Activated\n')
%                 fprintf('       End Point Located at [%g %g]\n',endPoint)
            
%% Start Point to End Point Case
        case 2
            %Plotting
                plot([startingPoint(1) varargin{1}(1)],[startingPoint(2) varargin{1}(2)],...
                     '-k','LineWidth',1.5)
    end
    
end