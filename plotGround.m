function plotGround(varargin)
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
        
%% Sloped Ground Case
        case 3
            %Angle Check
                angle = atan(diff(varargin{2}))/(diff(varargin{1}));
                if angle == inf
                    angle = pi/2;
                elseif angle == -inf
                    angle = -pi/2;
                end
            
            %Finding Spline Number
                numSplines = round(sqrt(diff(varargin{1}*10)^2 + diff(varargin{2}*10)^2))*3;
            
            if isequal(varargin{3},'up')
                
                %Finding Spline Locations
                    xSpline(:,1) = linspace(varargin{1}(1),varargin{1}(2),numSplines);
                    ySpline(:,1) = linspace(varargin{2}(1),varargin{2}(2),numSplines);
                    xSpline(:,2) = xSpline(:,1) - 0.015*(cos(angle) - sin(angle));
                    ySpline(:,2) = ySpline(:,1) - 0.015*(cos(angle) + sin(angle));
                
                %Plotting
                    plot(varargin{1},varargin{2},'-k',...
                         xSpline',ySpline','-k','LineWidth',1.5)
                 
            elseif isequal(varargin{3},'down')
                
                %Finding Spline Locations
                    xSpline(:,1) = linspace(varargin{1}(1),varargin{1}(2),numSplines);
                    ySpline(:,1) = linspace(varargin{2}(1),varargin{2}(2),numSplines);
                    xSpline(:,2) = xSpline(:,1) - 0.015*(cos(angle) + sin(angle));
                    ySpline(:,2) = ySpline(:,1) + 0.015*(cos(angle) - sin(angle));
                    
                %Plotting
                    plot(varargin{1},varargin{2},'-k',...
                         xSpline',ySpline','-k','LineWidth',1.5)
            else
                %Error Handling
                    error('Error: Incorrect Input Arguments. PLOTGROUND() was expecting 2 vector arguments and 1 scalar argument')
            end

            %Debugging Print
                fprintf('DEBUG: Case 3 Activated\n')
                fprintf('DEBUG: Number of Splines = %g\n',numSplines)
                fprintf('DEBUG: Line Angle = %g Degrees\n',angle*(180/pi))
            
%% Flat Ground Case w/ Orientation
        case 2  
            if isscalar(varargin{1}) && ischar(varargin{2})
                
                %Finding Spline Locations
                    xSpline(:,1) = linspace(0.02,1,30);
                    ySpline(:,1) = linspace(varargin{1},varargin{1},30);
                    xSpline(:,2) = xSpline(:,1) - 0.015;
                    if isequal(varargin{2},'up')
                        ySpline(:,2) = ySpline(:,1) - 0.015;
                        warning('PLOTGROUND() automatically assumes upward direction. "up" argument is unnecessary, please use PLOTGROUND(H) for faster results.')
                    elseif isequal(varargin{2},'down')
                        ySpline(:,2) = ySpline(:,1) + 0.015;
                    else
                        error('Error: Incorrect Input Arguments. PLOTGROUND() was expecting a second argument of either "up" or "down"')
                    end
                
                %Plotting
                    plot([0 1],[varargin{1} varargin{1}],'-k',...
                         xSpline',ySpline','-k','LineWidth',1.5)
                 
            elseif isvector(varargin{1}) && isvector(varargin{2})
                
                %Angle Check
                    angle = atan(diff(varargin{2}))/(diff(varargin{1}));
                    if angle == inf
                        angle = pi/2;
                    elseif angle == -inf
                        angle = -pi/2;
                    end

                %Finding Spline Number
                    numSplines = round(sqrt(diff(varargin{1}*10)^2 + diff(varargin{2}*10)^2))*3;

                %Finding Spline Locations
                    xSpline(:,1) = linspace(varargin{1}(1),varargin{1}(2),numSplines);
                    ySpline(:,1) = linspace(varargin{2}(1),varargin{2}(2),numSplines);
                    xSpline(:,2) = xSpline(:,1) - 0.015*(cos(angle) - sin(angle));
                    ySpline(:,2) = ySpline(:,1) - 0.015*(cos(angle) + sin(angle));

                %Plotting
                    plot(varargin{1},varargin{2},'-k',...
                         xSpline',ySpline','-k','LineWidth',1.5)                 
            else
                
                %Error Handling
                error('')
                
            end
            
            %Debugging Print
                fprintf('DEBUG: Case 2 Activated\n')
            
%% Basic Flat Ground
        case 1
            %Finding Spline Locations
                xSpline(:,1) = linspace(0.02,1,30);
                ySpline(:,1) = linspace(varargin{1},varargin{1},30);
                xSpline(:,2) = xSpline(:,1) - 0.015;
                ySpline(:,2) = ySpline(:,1) - 0.015;

            %Plotting
                plot([0 1],[varargin{1} varargin{1}],'-k',...
                     xSpline',ySpline','-k','LineWidth',1.5)
                 
             %Debugging Print
                fprintf('DEBUG: Case 1 Activated\n')

%% Error Case
        case 0 %Not Enough Inputs
            error('Error: Not Enough Inputs')
    end
end