function plotForce(startPos,angle,maxLength,value,index)

%% Assigning Variables
    x0 = startPos;
    l = value(index)/max(value);
    xf = [(l/maxLength)*cosd(angle) + x0(1);
          (l/maxLength)*sind(angle) + x0(2)];

%% Transforming to Data Plane
    xLIM = xlim;
    yLIM = ylim;
    normX = @(x) (-xLIM(1) + x)/xLIM(2);
    normY = @(y) (-yLIM(1) + y)/yLIM(2);
    x0 = [normX(x0(1)) normY(x0(2))];
    xf = [normX(xf(1)) normY(xf(2))];
      
%% Plotting
    annotation('arrow',[x0(1) xf(1)],[x0(2) xf(2)],...
               'LineWidth',1)

end