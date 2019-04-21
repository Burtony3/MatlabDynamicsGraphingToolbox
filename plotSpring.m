function plotSpring(startPoint,EndPoint,numSpikes,startLength)
% PLOTSPRING plots a line for use in dynamics problems.
%
%    See also PLOTDAMPER, PLOTCIRCLE.

    %Finding Angle of Spring
        angle = atand((endPoint(2) - startPoint(2))/...
                      (endPoint(1) - startPoint(1)));
        if angle == inf
            angle = 90;
        elseif angle == -inf
            angle = 270;
        end
        
    %Finding Current Length of Spring
        L = sqrt((endPoint(2) - startPoint(2))^2 + (endPoint(1) - startPoint(1))^2);
        
    %Finding Current Start and End of Spring Spikes
        spStart = [startPoint(1) + 0.05*L*cosd(angle),... 
                   startPoint(2) + 0.05*L*sind(angle)];
        spEnd   = [startPoint(1) + 0.95*L*cosd(angle),... 
                   startPoint(2) + 0.95*L*sind(angle)];
               
    %Finding Current Individual Length of Each Spring Repetition
        l = (0.9*L)/numSpikes;
        lOrigin = (0.9*start)/numSpikes;
        
    %Angle of Spikes
        angleSp = atand(lOrigin/l);
        
    function output = indivSpring(startPoint,angleSpike,length,angleTotal)
        
    end
end