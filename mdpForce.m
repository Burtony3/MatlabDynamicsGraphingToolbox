function mdpForce(startPos,angle,maxLength,value,index)
% mdpForce plots a force arrow to show how/where a force is applied
%    
%    Required Inputs:
%       startPos = [x y] position vector of start point of arrow
%
%       angle = scalar of angle of arrow (in degrees)
%
%       maxLength = scalar, in normalized coordinates, for maximum length
%                   of force arrow
%
%       value = 1xn or nx1 vector of all values of the force to be plotted
%           (Is a vector to allow the use of max() command)
%
%       index = current index in column vector for value to be pulled from
%
%    Examples:
%       mpdForce([0.25 0.25],45,0.2,[7,4,3,6,1],4)
%
%    See also mdpSetup, mdpSpring, mdpTrail.

%% Assigning Variables
    x0 = startPos;
    l = value(index)/max(value);
    xf = [(l*maxLength)*cosd(angle) + x0(1);
          (l*maxLength)*sind(angle) + x0(2)];

%% Transforming to Data Plane

    axes = get(gca, 'Position');
    xLIM = get(gca, 'xlim');
    yLIM = get(gca, 'ylim');
    x0 = normCoord(x0,axes,xLIM,yLIM);
    xf = normCoord(xf,axes,xLIM,yLIM);
      
%% Plotting
    annotation('arrow',[x0(1) xf(1)],[x0(2) xf(2)],'LineWidth',1)

%% Normalizing Function
    function norms = normCoord(Coords, axes, xLIM, yLIM)
    norms = [((Coords(1)-xLIM(1))/(xLIM(2) - xLIM(1)))*axes(3) + axes(1);
             ((Coords(2)-yLIM(1))/(yLIM(2) - yLIM(1)))*axes(4) + axes(2)];
    end
           
end