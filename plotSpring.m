function plotSpring(startPoint,endPoint,numSpikes,startLength)
% PLOTSPRING plots a line for use in dynamics problems.
%   PLOTSPRING(startPos,endPos,numSpikes,startLength) creates a spring
%   starting at startPos ending at endPos with numSpikes number of peaks.
%   
%       startPos = [x y] position of the origin point of the spring
%
%       endPos = [x y] position of the terminating point of the spring
%
%       numSpikes = the number of repeated spikes in the length of spring
%
%       startLength = the unstretched length of the spring which is used to
%       determin how stretched or contracted the spring is.
%
%    See also PLOTDAMPER, PLOTCIRCLE.

%% Solving Inital Points of Spring
    %Finding Angle of Spring End Points
        theta = atand((endPoint(2) - startPoint(2))/...
                      (endPoint(1) - startPoint(1)));
        if theta == inf
            theta = 90;
        elseif theta == -inf
            theta = 270;
        end
        
    %Finding Current Length of Spring
        L = sqrt((endPoint(2) - startPoint(2))^2 + (endPoint(1) - startPoint(1))^2);
        
    %Finding Current Start and End of Spring Spikes
        x0 = startPoint(1) + 0.1*L*cosd(theta);
        y0 = startPoint(2) + 0.1*L*sind(theta);
        xf = startPoint(1) + 0.95*L*cosd(theta);
        yf = startPoint(2) + 0.95*L*sind(theta);        
        
%% Solving for Variables to Repeated Spring

    %Angle of Spikes (Starts at 45 degrees)
        phi = atand(startLength/L);
        if phi == inf
            phi = 90;
        elseif phi == -inf
            phi = 270;
        end
        
    %Finding Current Individual Length of Each Spring Repetition
        l = (0.8*L)/numSpikes;
        d = (sqrt(2)/4)*((0.8*startLength)/numSpikes);
        
%% Plotting

    plot([startPoint(1) x0],[startPoint(2), y0],'-k','LineWidth',1.25)
    lastPoint = f([x0 y0],d,l,phi,theta);
    for i = 1:(numSpikes-1)
        lastPoint = f(lastPoint,d,l,phi,theta);
    end
    plot([lastPoint(1) endPoint(1)],[lastPoint(2) endPoint(2)],'-k','LineWidth',1.25)
    
%% Debugging
fprintf('Angle of Individual Spring = %g\n',phi)
fprintf('Individual Spring Length = %g\n',l)
fprintf('Total Spring Length = %g\n\n',L)
    
        
%% Nested Function

    function endPoint = f(startPoint,d,l,phi,theta)
        %Start Point
            x(1) = startPoint(1);
            y(1) = startPoint(2);
            
        %First Peak
            x(2) = d*cosd(phi + theta) + x(1);
            y(2) = d*sind(phi + theta) + y(1);
            
        %Second Peak
            x(3) = d*cosd(-phi + theta) + (x(1) + 0.5*l*cosd(theta));
            y(3) = d*sind(-phi + theta) + (y(1) + 0.5*l*sind(theta));
            
        %Final Point
            x(4) = l*cosd(theta) + x(1);
            y(4) = l*sind(theta) + y(1);
            
        %Plotting Indiv Spring
            plot(x,y,'-k','LineWidth',1.25)
            
        %Outputing End Point
            endPoint = [x(4) , y(4)];
        
    end
end