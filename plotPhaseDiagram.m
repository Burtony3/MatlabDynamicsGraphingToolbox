function plotPhaseDiagram(ode45PosOutput,ode45TimeOutput,index,figNum)
% PLOTCIRCLE plots a datum for use in dynamics problems.
%    PLOTCIRCLE(centerPosition(x,y),R) Plots a circle at centerPostion
%    with Radius R.
%    
%    Also outputs the four edge positions starting from horizontal at 
%    angles = [0 90 180 270] Degrees
%
%    PLOTCIRCLE(centerPosition(x,y),R,angle will adjust the above positions
%    with the given angle
%
%    See also PLOTSETUP, PLOTLINE.

%% Collected Inputs
    x = ode45PosOutput;
    t = ode45TimeOutput;
    DoF = size(x,2);
    
%% Setting Axis Limits
    horz = x(:,1:2:DoF);
    vert = x(:,2:2:DoF);
    xLim = [-max(horz(horz>0)) max(horz(horz>0))];
    yLim = [-max(vert(vert>0)) max(vert(vert>0))];
    
%% Plotting
        axis equal
        plot(horz(1:index,:),vert(1:index,:),'LineWidth',1)
        hold on
        plot(horz(index,:),vert(index,:),'ok','LineWidth',1.25)
        grid on
        xlim(xLim)
        ylim(yLim)
end