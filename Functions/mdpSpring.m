function mdpSpring(startPoint,endPoint,numSpikes,startLength)
% mdpSpring Creates a spring that connects two points together
%    Variations:
%		mdpSpring(startPoint,endPoint,numSpikes,startLength)
%    
%    Required Inputs:
%       startPoint & endPoint = [x y] position vectors
%
%       numSpikes = scalar multiplier of the number of 'N Waves'
%
%       startLength = scalar signifying the unstretched length of spring
%
%    Examples:
%       mdpSpring([0.1 0.1],[0.4 0.8],4,0.5)
%
%    See also mdpSetup, mdpCircle, mdpTrail.

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
% fprintf('Angle of Individual Spring = %g\n',phi)
% fprintf('Individual Spring Length = %g\n',l)
% fprintf('Total Spring Length = %g\n\n',L)
    
        
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